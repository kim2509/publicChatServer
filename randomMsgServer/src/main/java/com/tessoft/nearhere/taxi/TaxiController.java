package com.tessoft.nearhere.taxi;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.*;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig.Feature;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.APIResponseV2;
import com.nearhere.domain.Notice;
import com.nearhere.domain.NoticeV2;
import com.nearhere.domain.Post;
import com.nearhere.domain.PostReply;
import com.nearhere.domain.User;
import com.nearhere.domain.UserLocation;
import com.nearhere.domain.UserMessage;
import com.nearhere.domain.UserPushMessage;
import com.nearhere.domain.UserSetting;

@Controller
public class TaxiController {

	private SecureRandom random = new SecureRandom();

	@Autowired
	private SqlSession sqlSession;
	ObjectMapper mapper = null;
	protected static Logger logger = Logger.getLogger(TaxiController.class.getName());

	public TaxiController()
	{
		mapper = new ObjectMapper();
	}

	public String getLogIdentifier() {
		return new BigInteger(130, random).toString(32);
	}

	@RequestMapping( value ="/app/appInfo.do")
	public @ResponseBody APIResponse appInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			HashMap appInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectAppInfo", hash);

			response.setData(appInfo);

			logger.info( "[appInfo.do]" );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	private boolean isValidateForRegister( User user, APIResponse response )
	{
		if ( user.getUserID() == null || "".equals( user.getUserID() ) )
		{
			response.setResMsg("userID 가 올바르지 않습니다.");
			response.setResCode(ErrorCode.REQUEST_DATA_INVALID);
			return false;
		}

		return true;
	}

	
	@RequestMapping( value ="/taxi/getRandomIDV2.do")
	public @ResponseBody APIResponse getRandomIDV2( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{	
			String logIdentifier = requestLogging(request, bodyString);
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			bodyString = mapper.writeValueAsString( hash.get("user") );
			user = mapper.readValue(bodyString, new TypeReference<User>(){});

			getRandomIDCommon( hash, user, response, logIdentifier);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( new Exception("회원가입 도중 오류가 발생했습니다.", ex ) );
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/getRandomIDForGuest.do")
	public @ResponseBody APIResponse getRandomIDForGuest( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{	
			String logIdentifier = requestLogging(request, bodyString);
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			bodyString = mapper.writeValueAsString( hash.get("user") );
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
			user.setType("Guest");
			
			getRandomIDCommon( hash, user, response, logIdentifier );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( new Exception("회원가입 도중 오류가 발생했습니다.", ex ) );
			return response;
		}
	}

	@SuppressWarnings({ "unchecked" })
	private void getRandomIDCommon( HashMap requestHash, User user, APIResponse response,
			String logIdentifier ) throws Exception {
		
		HashMap addInfo = new HashMap();
		addInfo.put("alreadyExistsYN", "N");
		addInfo.put("hash", "");
		
		//Guest 로그인 or 카카오로그인
		String userType = user.getType();
		String facebookID = user.getFacebookID();
		String facebookProfileImageURL = user.getFacebookProfileImageURL();
		String facebookURL = user.getFacebookURL();
		String kakaoID = user.getKakaoID();
		String kakaoThumbnail = user.getKakaoThumbnailImageURL();
		String kakaoProfileImageURL = user.getKakaoProfileImageURL();
		String gender = user.getSex();
		
		double appVersion = 0.0;
		if ( requestHash != null && requestHash.containsKey("AppVersion") )
			appVersion = Double.parseDouble( requestHash.get("AppVersion").toString() );
		
		// 기존에 카카오 계정 연동을 한 경우.(삭제후 재설치 케이스)
		if ( !Util.isEmptyString( user.getKakaoID() ) )
		{
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByKakaoID", user);
			if ( tempUser != null )
			{
				user = tempUser;
				
				if ( !Util.isEmptyString( facebookID ) )
				{
					user.setFacebookID(facebookID);
					user.setFacebookProfileImageURL(facebookProfileImageURL);
					user.setSex(gender);
					user.setFacebookURL(facebookURL);
				}
			}
		}
		
		// 기존에 facebook 계정 연동을 한 경우.(삭제후 재설치 케이스)
		if ( !Util.isEmptyString( facebookID ) )
		{
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByFacebookID", user);
			if ( tempUser != null )
			{
				user = tempUser;
				
				if ( !Util.isEmptyString( kakaoID ) )
				{
					user.setKakaoID(kakaoID);
					user.setKakaoThumbnailImageURL(kakaoThumbnail);
					user.setKakaoProfileImageURL(kakaoProfileImageURL);
				}
			}
		}
		
		if ( user.getUserNo() != null && !user.getUserNo().isEmpty())
		{
			logger.info( "[" + logIdentifier + "]: userNo is not null.");
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByUserNo", user);
			if ( tempUser == null || tempUser.getUserID() == null || tempUser.getUserID().isEmpty() )
			{
				// 신규회원
				user.setUserNo(null);
				logger.info( "[" + logIdentifier + "]: userNo set null.");
			}
			else
			{
				// 기존회원
				addInfo.put("alreadyExistsYN", "Y");
				addInfo.put("registerUserFinished", getRegisterUserFinishedYN(tempUser, appVersion) );
				
				// 게스트에서 카카오 연동을 할 경우.
				if ( !Util.isEmptyString( user.getKakaoID() ) )
				{
					sqlSession.update("com.tessoft.nearhere.taxi.updateKakaoInfo", user);
					userType = "Normal";
				}
				
				// 게스트에서 페이스북 연동을 할 경우.
				if ( !Util.isEmptyString( user.getFacebookID() ) )
				{
					sqlSession.update("com.tessoft.nearhere.taxi.updateFacebookInfo", user);
					userType = "Normal";
				}
				
				user = selectUser( tempUser, false );
				
				String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
				if ( profilePoint == null || "".equals( profilePoint ) )
					profilePoint = "0";
				user.setProfilePoint(profilePoint);
			}
		}
		
		// 신규일 경우.(게스트모드 포함)
		if ( user.getUserNo() == null || user.getUserNo().isEmpty())
		{
			logger.info( "[" + logIdentifier + "]: userNo is null.");

			// 신규 user 생성해서 리턴된 userNo 앞에 'user' 를 붙여서 userID 로 사용.
			sqlSession.insert("com.tessoft.nearhere.taxi.insertUser", user);
			user.setUserID( "user" + user.getUserNo() );

			logger.info( "[" + logIdentifier + "]: new userID:" + user.getUserID() );
			
			// 해당 userID 가 있는지 검사.
			User existingUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);

			// 해당 userID 가 이미 존재하면, userID 를 랜덤하게 다르게 변경해서 다시 검사. 5회
			int retryCount = 0; 
			while ( existingUser != null && !"".equals( existingUser.getUserID() ) )
			{
				if ( retryCount == 5 ) break;

				Random rand = new Random();
				int  n = rand.nextInt(99998) + 1;
				user.setUserID("user" + n );
				existingUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
				retryCount++;
			}
			
			logger.info( "[" + logIdentifier + "]: retryCount:" + retryCount );
			
			// 임시 userID 생성완료. userID db 업데이트
			sqlSession.update("com.tessoft.nearhere.taxi.updateUserID", user);
		}
		
		sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserToken", user );
		String randomSeed = Util.getRandomSeed();
		String hashString = Util.getShaHashString( user.getUserID() + randomSeed );
		HashMap userHash = new HashMap();
		userHash.put("seed", randomSeed );
		userHash.put("hash", hashString );
		userHash.put("userID", user.getUserID() );
		sqlSession.insert("com.tessoft.nearhere.taxi.insertUserToken", userHash );
		
		addInfo.put("hash", hashString );
		
		user.setType( userType );
		sqlSession.update("com.tessoft.nearhere.taxi.updateUserType", user );
		
		response.setData( user );
		response.setData2( addInfo );
	}

	private String getRegisterUserFinishedYN(User user, double appVersion) {
		String registerUserFinished = "Y";
		
		HashMap registerUserInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.registerUserFinishedInfo", user);
		if ( Util.isEmptyString( registerUserInfo.get("sex") ))
			registerUserFinished = "N";
		
		if ( Util.isEmptyString( registerUserInfo.get("userName") ))
			registerUserFinished = "N";
		
		if ( Util.isEmptyString( registerUserInfo.get("agreementUserID") ))
			registerUserFinished = "N";
		
		// 1.39 부터 카카오 ID 적용
//		if ( appVersion > 1.38 && Util.isEmptyString( registerUserInfo.get("kakaoID") ))
//			registerUserFinished = "N";
		
		if ( !"Y".equals( registerUserInfo.get("registerUserFinished") ) )
			registerUserFinished = "N";
		
		return registerUserFinished;
	}
	
	@RequestMapping( value ="/taxi/getRandomID.do")
	public @ResponseBody APIResponse getRandomID( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			String logIdentifier = requestLogging(request, bodyString);

			user = mapper.readValue(bodyString, new TypeReference<User>(){});

			getRandomIDCommon( null, user, response, logIdentifier);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}

	@RequestMapping( value ="/taxi/registerUser.do")
	public @ResponseBody APIResponse registerUser( HttpServletRequest request, ModelMap model ,@RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			String logIdentifier = requestLogging(request, bodyString);

			user = mapper.readValue(bodyString, new TypeReference<User>(){});

			if ( isValidateForRegister( user, response ) == false )
			{
				return response;
			}

			User existingUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);

			if ( existingUser != null && !"".equals( existingUser.getUserID() ) )
			{
				response.setResCode(ErrorCode.REGISTER_USER_ALREADY_EXIST);
				response.setResMsg("중복된 아이디가 존재합니다.");
				return response;
			}

			user.setPassword( Util.encryptPassword( user.getPassword() ) );

			sqlSession.insert("com.tessoft.nearhere.taxi.insertUser", user);

			user = selectUser(user, false);

			response.setData( user );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}

	private String requestLogging(HttpServletRequest request, String bodyString) {
		
		String logIdentifier = "";
		
		try
		{
			logIdentifier = getLogIdentifier();
			logger.info( "REQUEST URL [" + request.getRemoteAddr() + "][" + logIdentifier + "]:" + makeUrl( request ) );
			logger.info( "REQUEST[" + logIdentifier + "]:" + bodyString );	
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return logIdentifier;
	}

	@RequestMapping( value ="/taxi/getUserTerms.do")
	public String getUserTerms( HttpServletRequest request, String version, String type )
	{
		String view = "";
		try
		{
			String logIdentifier = requestLogging(request, version );
			
			if ("nearhere".equals( type ) )
				view = "legal_terms/nearhere_terms_" + version;
			else if ("personal".equals( type ) )
				view = "legal_terms/personal_terms_" + version;
			else if ("location".equals( type ) )
				view = "legal_terms/location_terms_" + version;
			else
				view = "user_terms_" + version;
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + view );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}

		return view;
	}

	@RequestMapping( value ="/taxi/insertTermsAgreement.do")
	public @ResponseBody APIResponse insertTermsAgreement( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserTermsAgreement", hash );

			response.setData( result );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/updateUserLocation.do")
	public @ResponseBody APIResponse updateUserLocation( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
//			String logIdentifier = requestLogging(request, bodyString);

			UserLocation location = mapper.readValue(bodyString, new TypeReference<UserLocation>(){});

			if ( location != null && 
					(Util.isEmptyString( location.getLatitude() ) || Util.isEmptyString( location.getLongitude() )) )
			{
				response.setData("0|0");
				return response;
			}
			
			int result = sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserLocation", location );

			int result2 = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserLocation", location );

			response.setData( result + "|" + result2 );

			logger.info( "[updateUserLocation]userID:" + location.getUser().getUserID() + " locationName:" + location.getLocationName() + 
					" lat:" + location.getLatitude() + " lon:" + location.getLongitude());
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/login.do")
	public @ResponseBody APIResponse login( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap requestData = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			requestData.put("password", Util.encryptPassword( requestData.get("password").toString() ) );
			User user = sqlSession.selectOne("com.tessoft.nearhere.taxi.login", requestData );

			if ( user == null || "".equals( user.getUserID() ) )
			{
				response.setResCode( ErrorCode.INVALID_PASSWORD );
				response.setResMsg("아이디 혹은 암호가 올바르지 않습니다.");
			}

			response.setData(user);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("로그인 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/taxi/login_bg.do")
	public @ResponseBody APIResponse login_bg( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			bodyString = mapper.writeValueAsString( hash.get("user") );
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			user = selectUser(user, false);
			
			if ( user != null && !Util.isEmptyString(user.getUserID()) && hash.containsKey("AppVersion") )
			{
				HashMap appVersion = new HashMap();
				appVersion.put("userID", user.getUserID());
				appVersion.put("AppVersion", hash.get("AppVersion") );
				sqlSession.update("com.tessoft.nearhere.taxi.updateUserAppVersion", appVersion );
			}
			
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);

			response.setData(user);
			
			HashMap registerUserInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.registerUserFinishedInfo", user);
			
			String userAgreed = "N";
			if ( !Util.isEmptyString( registerUserInfo.get("agreementUserID") ))
				userAgreed = "Y";
			
			HashMap<String,String> addInfo = new HashMap<String, String>();
			addInfo.put("UserAgreed", userAgreed );
			
			response.setData2(addInfo);

			logger.info( "[login_bg.do]:" + user.getUserID() );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("로그인 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/taxi/login_bg2.do")
	public @ResponseBody APIResponse login_bg2( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap loginInfo = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( !loginInfo.containsKey("hash") && !"".equals( loginInfo.get("hash") ) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("세션키가 올바르지 않습니다.");
				logger.error( response.getResCode() + " " + response.getResMsg() );
				return response;
			}
			
			if ( !loginInfo.containsKey("userID") && !"".equals( loginInfo.get("userID") ) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자정보가 올바르지 않습니다.");
				logger.error( response.getResCode() + " " + response.getResMsg() );
				return response;
			}
			
			if ( loginInfo != null && !Util.isEmptyString(loginInfo.get("userID")) && loginInfo.containsKey("AppVersion") )
			{
				sqlSession.update("com.tessoft.nearhere.taxi.updateUserAppVersion", loginInfo );
			}
			
			User user = new User();
			user.setUserID( loginInfo.get("userID").toString() );
			user = selectUser(user, false);
			
			double appVersion = 0.0;
			if ( loginInfo != null && loginInfo.containsKey("AppVersion") )
				appVersion = Double.parseDouble( loginInfo.get("AppVersion").toString() );

			HashMap addInfo = new HashMap();
			String registerUserFinished = getRegisterUserFinishedYN(user, appVersion);
			addInfo.put("registerUserFinished", registerUserFinished );
			response.setData2( addInfo );
			
			if ( "Y".equals( registerUserFinished ) )
			{
				sqlSession.update("com.tessoft.nearhere.taxi.updateUserTokenAsLogIn", loginInfo );
				
				List<HashMap> userToken = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserToken", loginInfo );

				if ( userToken == null || userToken.size() < 1 )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("로그인정보가 올바르지 않습니다.");
					logger.error( response.getResCode() + " " + response.getResMsg() );
					return response;
				}
				
				String seed = userToken.get(0).get("seed").toString();
				
				String hash = Util.getShaHashString( loginInfo.get("userID") + seed );
				if ( !userToken.get(0).get("hash").equals( hash ))
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("유효한 사용자정보가 아닙니다.");
					logger.error( response.getResCode() + " " + response.getResMsg() );
					return response;
				}
			}
			
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);
			response.setData(user);
			
			logger.info( "[login_bg.do2]:" + user.getUserID() );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("로그인 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/logout.do")
	public @ResponseBody APIResponse logout( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
//			user.setRegID(null);

//			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegID", user );

			response.setData(0);
			
			sqlSession.update("com.tessoft.nearhere.taxi.updateUserTokenAsLogout", user );
			
			user.setType("Guest");
			sqlSession.update("com.tessoft.nearhere.taxi.updateUserType", user );
			
			sqlSession.update("com.tessoft.nearhere.taxi.deleteKakaoInfo", user );
			sqlSession.update("com.tessoft.nearhere.taxi.deleteFacebookInfo", user );
			
			response.setData2( selectUser( user, false ) );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("로그아웃 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/insertPost.do")
	public @ResponseBody APIResponse insertPost( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			Post post = mapper.readValue(bodyString, new TypeReference<Post>(){});
			
			if ( "user628".equals( post.getUser().getUserID() ) || "ffffffff-eb06-2ce8-ffff-ffffc6a77bf8".equals(post.getUser().getUuid()) )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
				return response;
			}
			
			try
			{
				if ( "여자만".equals(post.getSexInfo()) && "M".equals(post.getUser().getSex()))
					post.setbPushOff(false);
			}
			catch( Exception ex )
			{
				logger.error( ex );
			}
			
			Util.setPostDepartureDateTime( logger, logIdentifier, post);
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertPost", post );

			sendPushMessageOnNewPost(post);

			response.setData( result );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/insertPostAjax.do")
	public @ResponseBody APIResponse insertPostAjax( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap postData = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			try
			{
				if ( postData.containsKey("userID") == false )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("사용자 아이디가 올바르지 않습니다.");
					return response;
				}
				
				User user = new User( postData.get("userID").toString() );
				user = selectUser(user, false);
				
				if ( "Guest".equals( user.getType() ) )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("SNS 아이디가 존재하지 않습니다. SNS 로그인을 해 주세요.");
					return response;
				}
				
				if ( "여자만".equals( postData.get("sexInfo").toString() ) && "M".equals(user.getSex()))
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("남성회원은 여자만 옵션을 선택할 수 없습니다.");
					return response;
				}
				
			}
			catch( Exception ex )
			{
				logger.error( ex );
			}
			
			postData.put("departureDateTime", postData.get("departureDate") + " " + postData.get("departureTime") );
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertPostV2", postData );

			Post post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostDetail", postData);
			sendPushMessageOnNewPost(post);

			response.setData( result );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/modifyPostAjax.do")
	public @ResponseBody APIResponse modifyPostAjax( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap post = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( post.containsKey("userID") == false || Util.isEmptyString( post.get("userID") ) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 아이디가 올바르지 않습니다.");
				return response;
			}
			
			User user = new User( post.get("userID").toString() );
			user = selectUser(user, false);
			
			if ( "여자만".equals( post.get("sexInfo").toString() ) && "M".equals(user.getSex()))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("남성회원은 여자만 옵션을 선택할 수 없습니다.");
				return response;
			}
			
			post.put("departureDateTime", post.get("departureDate") + " " + post.get("departureTime") );
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePostV2", post );

			response.setData(result);

			// 새 글 푸쉬 메시지를 전송한다.
			/*
			try
			{
				Date now = new Date();
				Date departureDateTime = Util.getDateFromString(post.getDepartureDateTime(), "yyyy-MM-dd HH:mm:ss");
				
				long diff = departureDateTime.getTime() - now.getTime();
				long diffMinutes = TimeUnit.MINUTES.convert(diff, TimeUnit.MILLISECONDS);
				
				if ( diffMinutes > 0 && "종료됨".equals( postBeforeModified.getStatus() ) )
				{
					post.setStatus("진행중");
					sqlSession.update("com.tessoft.nearhere.taxi.updatePostStatus", post );
				}
				
				// 등록한 시간에 비해서 30분 이상 차이 나면 푸쉬 전송
				if ( diffMinutes >= 30)
				{
					if ( !"종료됨".equals( post.getStatus() ) )
						sendPushMessageOnNewPost( post );
				}
				else
				{
					User daeyong = new User();
					daeyong.setUserID("user27");
					daeyong.setUserNo("27");
					daeyong = selectUser( daeyong, false );
					sendPushMessage( daeyong, "newPostByDistance", "신규 글 등록알림", post.getPostID(), true );
				}
			}
			catch( Exception ex )
			{
				
			}
			*/
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	private void sendPushMessageOnNewPost(Post post){
		
		try
		{
			/*
			HashMap distanceInfo = new HashMap();
			distanceInfo.put("fromLatitude", post.getFromLatitude());
			distanceInfo.put("fromLongitude", post.getFromLongitude());
			distanceInfo.put("userID", post.getUser().getUserID());
			distanceInfo.put("distance", "5");

			if ( post.isbPushOff() == false )
			{
				List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsersForNewPost", distanceInfo);
				if ( userList != null && userList.size() > 0 )
				{
					for ( int i = 0; i < userList.size(); i++ )
					{
						if ( Util.isEmptyString( userList.get(i).getRegID() ) ) continue;
						
						UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", userList.get(i) );

						// 추천 알림받기 여부 체크
						if ( setting == null || !"N".equals( setting.getRecommendPushReceiveYN() ) )
							sendPushMessage(userList.get(i), "newPostByDistance", "5km 내의 새로운 합승 정보가 등록되었습니다.", post.getPostID(), true );
						else
							sendPushMessage(userList.get(i), "newPostByDistance", "5km 내의 새로운 합승 정보가 등록되었습니다.", post.getPostID(), false );
					}				
				}				
			}
			else
			{
				logger.info( "push offed!!!");
			}
			*/
			
			if ( post.isbPushOff() == false )
			{
				sqlSession.insert("com.tessoft.nearhere.taxi.background.insertNewPushJob", post.getPostID() );	
			}
			
			User daeyong = new User();
			daeyong.setUserID("user27");
			daeyong.setUserNo("27");
			daeyong = selectUser( daeyong , false );
			sendPushMessage( daeyong, "newPostByDistance", "신규 글 등록알림", post.getPostID(), true , true );
		}
		catch( Exception ex )
		{
			logger.error("error in sendPushMessageOnNewPost", ex );
		}
		
	}

	public static String makeUrl(HttpServletRequest request)
	{
		return request.getRequestURL().toString() + "?" + request.getQueryString();
	}

	@RequestMapping( value ="/taxi/getUsersNearHere.do")
	public @ResponseBody APIResponse getUsersNearHere( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap requestData = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			if ( !requestData.containsKey("distance"))
				requestData.put("distance", "10");
			
			int pageNo = 1;
			int pageStart = 0;
			int pageSize = 20;
			
			if ( requestData.containsKey("pageNo") && requestData.get("pageNo") != null )
			{
				pageNo = Integer.parseInt( requestData.get("pageNo").toString() );
				if ( pageNo > 1 )
				{
					pageStart = (pageSize * (pageNo-1));
				}
			}
			
			requestData.put("pageStart", pageStart );
			requestData.put("pageSize", pageSize);
			
			ArrayList userList = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", requestData);
			
			response.setData(userList);
			
			int count = sqlSession.selectOne("com.tessoft.nearhere.taxi.searchUserCountByDistance", requestData);
			
			if ( count > pageSize * pageNo )
				response.setData2("true|" + count);
			else
				response.setData2("false|" + count);
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/getPostsNearHere.do")
	public @ResponseBody APIResponse getPostsNearHere( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap requestData = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			int pageNo = 1;
			int pageStart = 0;
			int pageSize = 20;
			
			if ( requestData.containsKey("pageNo") && requestData.get("pageNo") != null )
			{
				pageNo = Integer.parseInt( requestData.get("pageNo").toString() );
				if ( pageNo > 1 )
				{
					pageStart = (pageSize * (pageNo-1));
				}
			}
			else
			{
				pageStart = 0;
				pageSize = 100;
			}
			
			requestData.put("pageStart", pageStart );
			requestData.put("pageSize", pageSize);
			
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostsNearHere", requestData);

			response.setData(postList);
			
			requestData.put("distance", "5");
			requestData.put("pageStart", 0 );
			requestData.put("pageEnd", 100 );
			
			int count = sqlSession.selectOne("com.tessoft.nearhere.taxi.searchUserCountByDistance", requestData);
			response.setData2( count );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/getPostsNearHereV2.do")
	public @ResponseBody APIResponseV2 getPostsNearHereV2( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponseV2 response = new APIResponseV2();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap requestData = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			int pageNo = 1;
			int pageStart = 0;
			int pageSize = 20;
			
			if ( requestData.containsKey("pageNo") && requestData.get("pageNo") != null )
			{
				pageNo = Integer.parseInt( requestData.get("pageNo").toString() );
				if ( pageNo > 1 )
				{
					pageStart = (pageSize * (pageNo-1));
				}
			}
			else
			{
				pageStart = 0;
				pageSize = 100;
			}
			
			requestData.put("pageStart", pageStart );
			requestData.put("pageSize", pageSize);
			
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostsNearHere", requestData);

			response.setData(postList);
			
			requestData.put("distance", "5");
			
			int postCount = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostCountNearHere", requestData);
			
			if ( postCount > pageSize * pageNo )
				response.setData2("true|" + postCount);
			else
				response.setData2("false|" + postCount);
			
			int count = sqlSession.selectOne("com.tessoft.nearhere.taxi.searchUserCountByDistance", requestData);
			response.setData3( count );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/getPostDetail.do")
	public @ResponseBody APIResponse getPostDetail( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			String userID = "";
			if ( hash != null && hash.get("userID") != null )
				userID = hash.get("userID").toString();
			
			String postID = "";
			if ( hash != null && hash.get("postID") != null )
				postID = hash.get("postID").toString();
			
			Post post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostDetail", hash);
			
			if ( post.getUser() == null )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("삭제된 합승내역입니다.");
				return response;
			}
			
			User user = selectUser(post.getUser(), false );
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);
			post.setUser( user );
			
			if ( post == null )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("삭제된 합승내역입니다.");
				return response;
			}
			
			List<PostReply> replies = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostReplies", post );
			post.setPostReplies(replies);

			response.setData(post);

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead3", hash );
			
			response.setData2( result );
			
			boolean bProgressing = true;
			if ( "종료됨".equals(post.getStatus() ) )
				bProgressing = false;
			
			List<HashMap> postReadHistory = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostReadHistory", hash );
			
			if ( ( postReadHistory == null || postReadHistory.size() == 0 ) && hash.get("userID") != null &&
					!hash.get("userID").toString().equals( post.getUser().getUserID() ))
			{
//				User user = new User();
//				user.setUserID( hash.get("userID").toString() );
//				user = selectUser(user, false );
				
				User writer = selectUser( post.getUser() , false );
				
				// 1.34 버전 이후부터 수신가능
				if ( Util.getDouble( writer.getAppVersion() ) > 1.34 )
				{
					sqlSession.insert("com.tessoft.nearhere.taxi.insertPostReadHistory", hash );
					
					// 1.36 부터 조회수 가 추가돼서 푸쉬 보내지 않음
//					if ( bProgressing )
//					{
//						sendPushMessage( writer , "inquiryUser", 
//								user.getUserName() + "님이 고객님의 합승내역을 조회했습니다.", user.getUserID(), true );						
//					}
				}
			}
			
			logger.info( "[getPostDetail.do] userID:" + userID + " postID:" + postID + " title:" + post.getMessage() );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/insertPostReply.do")
	public @ResponseBody APIResponse insertPostReply( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			PostReply post = mapper.readValue(bodyString, new TypeReference<PostReply>(){});

			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertPostReply", post );

			response.setData( result );

			List<User> usersToSendPush = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersForPost", post );
			
			logger.info( "usersToSendPush: " + mapper.writeValueAsString(usersToSendPush) );
			
			for ( int i = 0; i < usersToSendPush.size(); i++ )
			{
				User user = usersToSendPush.get(i);
				UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", user );
				if ( setting == null || !"N".equals( setting.getReplyPushReceiveYN() ) )
				{
					sendPushMessage( user, "postReply", post.getMessage(), post.getPostID(), true, true );
				}
				else
					sendPushMessage( user, "postReply", post.getMessage(), post.getPostID(), false, true );
			}

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping( value ="/taxi/getUserInfoV2.do")
	public @ResponseBody APIResponse getUserInfoV2( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			User userToInquiry = new User();
			userToInquiry.setUserID( hash.get("userIDToInquiry").toString() );

			userToInquiry = selectUser(userToInquiry, false );
			HashMap resHash = getUserInfoCommon(userToInquiry);

			response.setData(resHash);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
			
			String userID = hash.get("userID").toString();
			
			User user = new User();
			user.setUserID( userID );
			user = selectUser(user, false );
			
			/* 프로필 조회 푸쉬 없앰
			if ( !userToInquiry.getUserID().equals( user.getUserID() ) )
			{
				// 본인이 아닐 경우에만 푸쉬 전송
				// A 가 B 프로필을 여러번 조회할 경우 푸쉬 하루에 한번만 보내게끔 보낸 이력 조회
				List<UserPushMessage> pushMessageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectInquiryUser", hash );
				
				// 1.35 버전부터 inquiryUser 푸시 적용
				if ( Util.getDouble( userToInquiry.getAppVersion() ) > 1.34 && (pushMessageList == null || pushMessageList.size() == 0 ) )
				{
					UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", userToInquiry );
					if ( setting == null || !"N".equals( setting.getInquiryUserPushReceiveYN()))
						sendPushMessage( userToInquiry, "inquiryUser", user.getUserName() + "님이 고객님의 프로필를 조회했습니다.", userID, true );
					else
						sendPushMessage( userToInquiry, "inquiryUser", user.getUserName() + "님이 고객님의 프로필를 조회했습니다.", userID, false );
				}
			}
			*/
			
			HashMap temp = new HashMap();
			temp.put("userID", userID);
			temp.put("fromUserID", userToInquiry.getUserID());
			int result2 = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead4", temp );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}
		
		return response;
	}

	private User selectUser(User user, boolean bRequireMobileNo ) {
		user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
		
		if ( bRequireMobileNo == false )
			user.setMobileNo("");
		
		return user;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private HashMap getUserInfoCommon(User user) {
		
		String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
		if ( profilePoint == null || "".equals( profilePoint ) )
			profilePoint = "0";
		user.setProfilePoint(profilePoint);

		List<UserLocation> locationList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserLocation", user);

		List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserPost", user);

		List<Post> postsUserReplied = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostsUserReplied", user);

		HashMap resHash = new HashMap();
		resHash.put("user", user);
		resHash.put("locationList", locationList);
		resHash.put("userPost", postList);
		resHash.put("postsUserReplied", postsUserReplied);
		return resHash;
	}

	@SuppressWarnings({ "rawtypes"})
	@RequestMapping( value ="/taxi/getUserInfo.do")
	public @ResponseBody APIResponse getUserInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			user = selectUser(user, false );
			HashMap resHash = getUserInfoCommon(user);

			response.setData(resHash);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/updateUserSex.do")
	public @ResponseBody APIResponse updateUserSex( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSex", user );

			response.setData( result );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/updateUserJobTitle.do")
	public @ResponseBody APIResponse updateUserJobTitle( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserJobTitle", user );

			response.setData( result );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/updateUserBirthday.do")
	public @ResponseBody APIResponse updateUserBirthday( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserBirthday", user );

			response.setData( result );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/getNoticeList.do")
	public @ResponseBody APIResponse getNoticeList( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			List<Notice> noticeList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectNoticeList");

			response.setData(noticeList);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/getUserMessageList.do")
	public @ResponseBody APIResponse getUserMessageList( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserMessageList", user );

			HashMap hash = new HashMap();

			// 동일한 user 는 제외
			for ( int i = 0; i < messageList.size(); i++ )
			{
				if ( hash.containsKey( messageList.get(i).getUser().getUserID() ) )
				{
					messageList.remove(i);
					i--;
				}
				else
					hash.put( messageList.get(i).getUser().getUserID(), "" );
			}

			response.setData(messageList);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/getUserMessage.do")
	public @ResponseBody APIResponse getUserMessage( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap messageInfo = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserMessage", messageInfo );
			response.setData(messageList);
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserMessageAsRead", messageInfo );
			int result2 = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead2", messageInfo );
			
			response.setData2( result + "|" + result2 );

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/getUserPushMessage.do")
	public @ResponseBody APIResponse getUserPushMessage( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserPushMessage", user );
			response.setData(messageList);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/getUserSetting.do")
	public @ResponseBody APIResponse getUserSetting( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", user );

			response.setData(setting);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/updateUserSetting.do")
	public @ResponseBody APIResponse updateUserSetting( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			UserSetting setting = mapper.readValue(bodyString, new TypeReference<UserSetting>(){});

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSetting", setting );

			response.setData(result);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/updateUserRegID.do")
	public @ResponseBody APIResponse updateUserRegID( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			int result = -1;
			int result2 = -1;
			
			if ( user != null && !Util.isEmptyString( user.getUserID() ))
			{
				result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegIDAsNull", user );
				result2 = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegID", user );
			}
			else
			{
				logger.error( "[updateUserRegID] user is null" );	
			}

			response.setData(result + "|" + result2);

			logger.info( "[updateUserRegID.do]: " + user.getUserID() + " regID:" + user.getRegID() );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	@RequestMapping( value ="/taxi/sendUserMessage.do")
	public @ResponseBody APIResponse sendUserMessage( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			UserMessage message = mapper.readValue(bodyString, new TypeReference<UserMessage>(){});

			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserMessage", message );

			User user = new User();
			user.setUserID(message.getToUser().getUserID());
			UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", user );
			
			if ( setting == null || !"N".equals( setting.getMessagePushReceiveYN() ))
				sendPushMessage( message.getToUser(), "message", message.getMessage(), message.getFromUser().getUserID(), true, false );
			else
				sendPushMessage( message.getToUser(), "message", message.getMessage(), message.getFromUser().getUserID(), false, false );

			HashMap messageInfo = new HashMap();
			messageInfo.put("userID", message.getFromUser().getUserID());
			messageInfo.put("fromUserID", message.getToUser().getUserID());

			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserMessage", messageInfo );
			response.setData(messageList);
			response.setData2(result);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	private void sendPushMessage( User receiver, String type, String msg, String param, boolean bSendPush, boolean bInsertPushMessage ) throws Exception
	{
		try
		{
			logger.info( "sendPushMessage[" + bSendPush + "]: " + mapper.writeValueAsString(receiver) );

			receiver = selectUser(receiver, false );

			UserPushMessage pushMessage = new UserPushMessage();
			pushMessage.setToUserID( receiver.getUserID() );
			pushMessage.setType(type);
			if ( "message".equals( type ) )
				pushMessage.setMessage("메시지가 도착하였습니다.");
			else if ( "postReply".equals( type ) )
				pushMessage.setMessage("댓글이 등록되었습니다.");
			else if ("newPostByDistance".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("event".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("eventssl".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("inquiryUser".equals( type ) )
				pushMessage.setMessage( msg );

			pushMessage.setParam1(param);
			
			int result = 0;
			
			if ( bInsertPushMessage )
			{
				result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );
				logger.info( "insertUserPushMessage result : " + result );
			}

			if ( bSendPush )
			{
				Sender sender = new Sender( Constants.GCM_API_KEY );

				Message message = null;

				if ( !Util.isEmptyString( receiver.getRegID() ) )
				{
					if ( "message".equals( type ) )
					{
						message = new Message.Builder().addData("title", pushMessage.getMessage() )
								.addData("message",  msg )
								.addData("type",  type )
								.addData("toUserID",  receiver.getUserID() )
								.addData("fromUserID",  param )
								.build();	
					}
					else if ( "postReply".equals( type ) )
					{
						message = new Message.Builder().addData("title", pushMessage.getMessage() )
								.addData("message",  msg )
								.addData("type",  type )
								.addData("postID",  param )
								.build();	
					}
					else if ( "newPostByDistance".equals( type ) )
					{
						message = new Message.Builder().addData("title", "신규 합승정보 알림" )
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("postID",  param )
								.build();	
					}
					else if ( "event".equals( type ) || "eventssl".equals( type ) )
					{
						message = new Message.Builder().addData("title", "이벤트")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("eventSeq",  param )
								.addData("pushNo",  pushMessage.getPushNo() )
								.addData("sound", "on")
								.addData("vibrate", "on")
								.build();
					}
					else if ( "inquiryUser".equals( type ) )
					{
						message = new Message.Builder().addData("title", "프로필 조회 알림")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("userID",  param )
								.addData("pushNo",  pushMessage.getPushNo() )
								.build();
					}

					Result pushResult = sender.send(message, receiver.getRegID() , Constants.push_retry_count );

					logger.info( "push result[" + receiver.getRegID() + "]:" + pushResult.toString() + 
							" errorCode:[" + pushResult.getErrorCodeName() + "]");
					
					try
					{
						if ( "NotRegistered".equalsIgnoreCase( pushResult.getErrorCodeName() ) )
						{
							sqlSession.update("com.tessoft.nearhere.taxi.updateUserAsDeleted", receiver );
							logger.info( "update user as deleted.[" + receiver.getUserID() + "]");
						}
					}
					catch( Exception ex )
					{
						logger.error( new Exception("update user as deleted error", ex ));
					}
				}
				else
				{
					logger.info( "push regID is null." );		
				}
			}
			
		}
		catch( Exception ex )
		{
			logger.error( ex );;
		}
	}
	
	@RequestMapping( value ="/taxi/modifyPost.do")
	public @ResponseBody APIResponse modifyPost( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			Post post = mapper.readValue(bodyString, new TypeReference<Post>(){});
			
			if ( Util.isEmptyString( post.getVehicle() ))
				post.setVehicle("택시");
			if ( Util.isEmptyString( post.getFareOption() ))
				post.setVehicle("나눠서 분담");
			
			Post postBeforeModified = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostDetail", post );
			
			Util.setPostDepartureDateTime( logger, logIdentifier, post);
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePost", post );

			response.setData(result);

			// 새 글 푸쉬 메시지를 전송한다.
			try
			{
				Date now = new Date();
				Date departureDateTime = Util.getDateFromString(post.getDepartureDateTime(), "yyyy-MM-dd HH:mm:ss");
				
				long diff = departureDateTime.getTime() - now.getTime();
				long diffMinutes = TimeUnit.MINUTES.convert(diff, TimeUnit.MILLISECONDS);
				
				if ( diffMinutes > 0 && "종료됨".equals( postBeforeModified.getStatus() ) )
				{
					post.setStatus("진행중");
					sqlSession.update("com.tessoft.nearhere.taxi.updatePostStatus", post );
				}
				
				// 등록한 시간에 비해서 30분 이상 차이 나면 푸쉬 전송
				if ( diffMinutes >= 30)
				{
					if ( !"종료됨".equals( post.getStatus() ) )
						sendPushMessageOnNewPost( post );
				}
				else
				{
					User daeyong = new User();
					daeyong.setUserID("user27");
					daeyong.setUserNo("27");
					daeyong = selectUser( daeyong, false );
					sendPushMessage( daeyong, "newPostByDistance", "신규 글 등록알림", post.getPostID(), true, true );
				}
			}
			catch( Exception ex )
			{
				
			}
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/deletePost.do")
	public @ResponseBody APIResponse deletePost( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			Post post = mapper.readValue(bodyString, new TypeReference<Post>(){});

			int result = sqlSession.delete("com.tessoft.nearhere.taxi.updatePostAsDeleted", post );

			response.setData(result);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/getUnreadCount.do")
	public @ResponseBody APIResponse getUnreadCount( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			HashMap countInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.getUnreadCount", info );
			
			HashMap noticeInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUnreadNoticeCount", info );
			countInfo.put("noticeCount", noticeInfo.get("unreadNoticeCount"));
			countInfo.put("lastNoticeID", noticeInfo.get("lastNoticeID"));
			
			int friendRequestCount = sqlSession.selectOne("com.tessoft.nearhere.friend.getFriendRequestCount", info );
			countInfo.put("friendRequestCount", friendRequestCount);

			response.setData(countInfo);

			if ( info.containsKey("UUID") )
			{
				int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSysInfo", info );
				response.setData2( result );
			}

			logger.info( "[getUnreadCount.do] " + info.get("userID") );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/updatePushMessageAsRead.do")
	public @ResponseBody APIResponse updatePushMessageAsRead( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			UserPushMessage message = mapper.readValue(bodyString, new TypeReference<UserPushMessage>(){});

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead", message );
			response.setData(result);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/deletePostReply.do")
	public @ResponseBody APIResponse deletePostReply( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			PostReply postReply = mapper.readValue(bodyString, new TypeReference<PostReply>(){});

			int result = sqlSession.delete("com.tessoft.nearhere.taxi.updatePostReplyAsDeleted", postReply );

			response.setData(result);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserInfo.do")
	public @ResponseBody APIResponse updateUserInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			int result = 0;
			if ( !Util.isEmptyString( user.getMobileNo() ) )
				result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserMobileNo", user );
			
			if ( !Util.isEmptyString( user.getUserName() ) )
				result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserName", user );
			
			if ( !Util.isEmptyString( user.getSex() ) )
				result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSex", user );

			response.setData( result );
			
			sqlSession.update("com.tessoft.nearhere.taxi.updateRegisterUserFinished", user );
			
			sqlSession.update("com.tessoft.nearhere.taxi.updateUserTypeAsNormal", user );
			
			HashMap addInfo = new HashMap();
			
			user = selectUser(user, false);
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);
			
			addInfo.put("user", user );
			
			response.setData2(addInfo);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/statistics.do")
	public @ResponseBody APIResponse leave( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		try
		{
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			if ( info.containsKey("userID") )
				logger.info( "[statistics.do]: " + info.get("userID"));
			else
				logger.info( "[statistics.do]: userID is null");
		}
		catch( Exception ex )
		{
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getNotice.do")
	public ModelAndView getNotice( String noticeID )
	{
		NoticeV2 notice = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectNotice", noticeID );
		
		if ( "EVENT".equals( notice.getType() ) )
			return new ModelAndView( notice.getLandingURL() );
		
		return new ModelAndView("notice", "notice", notice);
	}
	
	@RequestMapping( value ="/taxi/sendEventPush.do")
	public @ResponseBody APIResponse sendEventPush(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap hash = new HashMap();
			
			String logIdentifier = requestLogging(request, bodyString);
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersToSendPush", hash );
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				sendPushMessage(userList.get(i), "event", "[이벤트] 이마트 상품권을 쏩니다!!", "1", true, true );	
			}
			
			response.setData(userList);
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/eventDetail.do")
	public ModelAndView eventDetail( String eventSeq, String pushNo )
	{
		ModelAndView mv = new ModelAndView();
		
		try
		{
			UserPushMessage message = new UserPushMessage();
			message.setPushNo(pushNo);
			
			mv.setViewName("event" + eventSeq );
			mv.addObject("eventSeq", eventSeq);
			mv.addObject("pushNo", pushNo);
			
			User user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserWithPushNo", pushNo );
			mv.addObject("user", user);
			
			HashMap param = new HashMap();
			param.put("eventSeq", eventSeq);
			param.put("userID", user.getUserID());
			
			List<HashMap> eventAppliedList = sqlSession.selectList("com.tessoft.nearhere.taxi.getEventAppliedInfo", param );
			
			if ( eventAppliedList != null && eventAppliedList.size() > 0 )
				mv.addObject("alreadyAppliedYN", "Y" );
			else
			{
				mv.addObject("alreadyAppliedYN", "N" );
				mv.addObject("phoneNo", user.getMobileNo());
			}
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead", message );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return mv;
	}
	
	@RequestMapping( value ="/taxi/eventApply.do")
	public @ResponseBody APIResponse eventApply( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertEventApplyInfo", requestInfo );
			
			if ( result > 0 )
				response.setData("success");
			else
				response.setResCode("9999");
			
			User daeyong = new User();
			daeyong.setUserID("user27");
			daeyong.setUserNo("27");
			daeyong = selectUser( daeyong, false );
			sendPushMessage( daeyong, "newPostByDistance", "이벤트 신청알림 " + requestInfo.get("userID"), requestInfo.get("userID") , true, true );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getMainInfo.do")
	public @ResponseBody APIResponse getMainInfo( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			HashMap registerUserInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.getUserAgreement", requestInfo);
			
			String userAgreed = "N";
			if ( registerUserInfo != null && !Util.isEmptyString( registerUserInfo.get("agreementUserID") ))
				userAgreed = "Y";
			
			HashMap responseInfo = new HashMap();
			responseInfo.put("UserAgreed", userAgreed);
			response.setData(responseInfo);
			
			logger.info( "[getMainInfo.do]: " + requestInfo.get("userID") );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/index.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			@CookieValue(value = "userID", defaultValue = "") String userID,
			ModelMap model )
	{
		List<HashMap> regionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getMainInfo");
		
		model.addAttribute("regionList", regionList );
		
		List<HashMap> hotspotList = sqlSession.selectList("com.tessoft.nearhere.taxi.getHotspotList");
		model.addAttribute("hotspotList", hotspotList );
		
		return new ModelAndView("index", model);
	}
	
	@RequestMapping( value ="/taxi/searchDestination.do")
	public ModelAndView searchDestination( String isApp )
	{
		return new ModelAndView("carPool/searchDestination");
	}
	
	@RequestMapping( value ="/taxi/moreRecentPosts.do")
	public ModelAndView moreRecentPosts( String isApp )
	{
		return new ModelAndView("carPool/moreRecentPosts");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/taxi/listRegion.do")
	public ModelAndView listRegion( String isApp , ModelMap model, 
			@RequestParam(value="lRegionNo", defaultValue = "") String lRegionNo, 
			@RequestParam(value="mRegionNo", defaultValue = "") String mRegionNo, 
			@RequestParam(value="sRegionNo", defaultValue = "") String sRegionNo, 
			@RequestParam(value="tRegionNo", defaultValue = "") String tRegionNo,
			@RequestParam(value="isSubParent", defaultValue = "N") String isSubParent, 
			@RequestParam(value="childRegionCount", defaultValue = "0") int childRegionCount)
	{
		HashMap regionInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.getRegionInfo", lRegionNo );
		
		model.addAttribute("regionInfo", regionInfo );
		
		List<HashMap> childRegionList = null;
		
		model.addAttribute("level", "1");
		
		// 기타를 선택했을 경우 카테고리는 유지하고 아이템만 반영하기 위함
		if ("999999".equals( lRegionNo ) ) {
			model.addAttribute("lRegionNo", "999999" );
			lRegionNo = "";
		}
		if ("999999".equals( mRegionNo ) ) {
			model.addAttribute("mRegionNo", "999999" );
			mRegionNo = "";
		}
		if ("999999".equals( sRegionNo ) ) {
			model.addAttribute("sRegionNo", "999999" );
			sRegionNo = "";
		}
		if ("999999".equals( tRegionNo ) ) {
			model.addAttribute("tRegionNo", "999999" );
			tRegionNo = "";
		}
		
		
		if ( !Util.isEmptyString( mRegionNo ) )
		{
			model.addAttribute("level", "2");
			model.addAttribute("mRegionNo", mRegionNo );
		}
		
		if ( !Util.isEmptyString( sRegionNo ) )
		{
			if ( childRegionCount == 0 )
				model.addAttribute("level", "2");
			else
				model.addAttribute("level", "3");
			
			model.addAttribute("sRegionNo", sRegionNo );
		}
		
		if ( !Util.isEmptyString( tRegionNo ) )
		{
			model.addAttribute("level", "4");
			model.addAttribute("tRegionNo", tRegionNo );
		}
		
		childRegionList = getChildRegionList(lRegionNo, mRegionNo, sRegionNo, tRegionNo, isSubParent, childRegionCount );
		
		model.addAttribute("childRegionList", childRegionList);
		
		return new ModelAndView("carPool/listRegion", model );
	}

	private List<HashMap> getChildRegionList(String lRegionNo, String mRegionNo, String sRegionNo, String tRegionNo, String isSubParent, int childRegionCount ) {

		List<HashMap> childRegionList = null;
		
		if ( Util.isEmptyString(mRegionNo) && Util.isEmptyString(sRegionNo))
		{
			childRegionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getMiddleRegionList", lRegionNo );
		}
		else if ( !Util.isEmptyString(mRegionNo) && Util.isEmptyString(tRegionNo) && childRegionCount == 0 )
		{
//			if ( ( Util.isEmptyString(sRegionNo) || childRegionCount == 0 ) )
				
			childRegionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getSmallRegionList2", mRegionNo );
			List<HashMap> temp = sqlSession.selectList("com.tessoft.nearhere.taxi.getSmallRegionList", mRegionNo );
			childRegionList.addAll( temp );
			
		}
		else if ( !Util.isEmptyString(mRegionNo) && !Util.isEmptyString(sRegionNo) )
		{
			childRegionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getTinyRegionList", sRegionNo );
		}
		else
		{
			childRegionList = new ArrayList<HashMap>(); 
		}
		
		if ( childRegionList != null )
		{
			for ( int i = 0; i < childRegionList.size(); i++ )
			{
				HashMap region = childRegionList.get(i);

				if ("Y".equals(region.get("isSubParent") ) )
				{
					HashMap temp = new HashMap();
					temp.put("parentNo", region.get("parentNo"));
					temp.put("parentNo2", region.get("regionNo"));

					HashMap subParent = sqlSession.selectOne("com.tessoft.nearhere.taxi.getSubParent", temp );

					if ( subParent != null && !Util.isEmptyForKey(subParent, "cnt") )
						region.put("cnt", subParent.get("cnt") );
				}
			}
		}
		
		
		return childRegionList;
	}
	
	@RequestMapping( value ="/taxi/newPost.do")
	public ModelAndView newPost( HttpServletRequest request, HttpServletResponse response , ModelMap model )
	{
		List<HashMap> regionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getRegionList");
		model.addAttribute("regionList", regionList);
		
		return new ModelAndView("carPool/newPost", model );
	}
	
	@RequestMapping( value ="/taxi/editPost.do")
	public ModelAndView editPost( HttpServletRequest request, HttpServletResponse response , String postID, ModelMap model )
	{
		HashMap requestData = new HashMap();
		
		Post post = null;
		
		if ( !Util.isEmptyString(postID ) )
		{
			requestData.put("postID", postID);
			post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostDetail", requestData);
			model.addAttribute("postDetail", post);
		}
		
		HashMap regionInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.getRegionInfo", post.getRegion() );
		
		model.addAttribute("regionNo", post.getRegion() );
		
		if ( "Y".equals( regionInfo.get("isHotSpot") ) )
		{
			List<HashMap> regionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getHotspotRegionList");
			model.addAttribute("regionList", regionList);
			
			return new ModelAndView("carPool/newHotspot", model);
		}
		else
		{
			List<HashMap> regionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getRegionList");
			model.addAttribute("regionList", regionList);
			
			return new ModelAndView("carPool/newPost", model);
		}
	}
	
	@RequestMapping( value ="/taxi/newHotspot.do")
	public ModelAndView newHotspot( HttpServletRequest request, HttpServletResponse response , ModelMap model, String regionNo )
	{
		model.addAttribute("regionNo", regionNo );
		
		List<HashMap> regionList = sqlSession.selectList("com.tessoft.nearhere.taxi.getHotspotRegionList");
		model.addAttribute("regionList", regionList);
		
		return new ModelAndView("carPool/newHotspot", model );
	}
	
	@RequestMapping( value ="/taxi/viewMoreUsers.do")
	public ModelAndView viewMoreUsers()
	{
		return new ModelAndView("viewMoreUsers");
	}
	
	@RequestMapping( value ="/taxi/viewRegion.do")
	public ModelAndView viewRegion( HttpServletRequest request )
	{
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String regionName = request.getParameter("regionName");
		
		logger.info( "[viewRegion.do]" + regionName );
		
		return new ModelAndView("viewRegion");
	}
	
	@RequestMapping( value ="/taxi/getMoreUsers.do")
	public @ResponseBody APIResponse getMoreUsers( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			String logIdentifier = requestLogging(request, bodyString);

			List<HashMap> newUsers = sqlSession.selectList("com.tessoft.nearhere.taxi.selectNewlyRegisteredUsersMore");
			
			for ( int i = 0; i < newUsers.size(); i++ )
			{
				HashMap hash = newUsers.get(i);
				if ( hash.get("address") != null && !Util.isEmptyString( hash.get("address").toString() ) )
					hash.put("address", Util.getRegionName(hash.get("address").toString() ) );
			}
			
			HashMap additionalData = new HashMap();
			additionalData.put("userList", newUsers);
			
			response.setData( additionalData );
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/taxi/getPostsNearHereAjax.do")
	public @ResponseBody APIResponse getPostsNearHereAjax( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			HashMap requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			int pageNo = 1;
			int pageStart = 0;
			int pageSize = 20;
			
			if ( requestInfo.containsKey("pageNo") && requestInfo.get("pageNo") != null )
			{
				pageNo = Integer.parseInt( requestInfo.get("pageNo").toString() );
				if ( pageNo > 1 )
				{
					pageStart = (pageSize * (pageNo-1));
				}
			}
			else
			{
				pageStart = 0;
				pageSize = 20;
			}
			
			requestInfo.put("pageStart", pageStart );
			requestInfo.put("pageSize", pageSize);
			
			HashMap additionalData = new HashMap();
			
			List<Post> postsNearHere = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostsNearHere", requestInfo);
			
			for ( int i = 0; i < postsNearHere.size();i++ )
			{
				Post item = postsNearHere.get(i);
				String repetitiveYN = item.getRepetitiveYN();
				
				String departureDateTime = item.getDepartureDateTime();
				departureDateTime = Util.getDepartureDateTime(departureDateTime);
				
				item.setDepartureDateTime(departureDateTime);
			}
			
			additionalData.put("postsNearHere", postsNearHere );

			response.setData( additionalData );
			
			logger.info( "[getPostsNearHereAjax.do]: " + requestInfo.get("userID") );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/getPostsInRegion.do")
	public @ResponseBody APIResponse getPostsInRegion( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			String logIdentifier = requestLogging(request, bodyString);

			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			HashMap additionalData = new HashMap();
			
			List<HashMap> postsNearHere = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostsInRegion", requestInfo);
			additionalData.put("postsInRegion", postsNearHere );

			response.setData( additionalData );
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/updateFacebookInfo.do")
	public @ResponseBody APIResponse updateFacebookInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			sqlSession.update("com.tessoft.nearhere.taxi.updateFacebookInfo", user );
			sqlSession.update("com.tessoft.nearhere.taxi.updateUserTokenAsLogIn", user );
			HashMap addInfo = new HashMap();
			
			user = selectUser(user, false);
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);
			
			addInfo.put("user", user );
			
			response.setData(addInfo);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/taxi/insertDestination.do")
	public @ResponseBody APIResponse insertDestination( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			String logIdentifier = requestLogging(request, bodyString);

			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			HashMap data = new HashMap();
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertDestination", requestInfo);
			data.put("dbResult",  result );
			
			response.setData( data );
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("목적지 검색 도중 오류가 발생했습니다.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/getUserDestinations.do")
	public @ResponseBody APIResponse getUserDestinations( HttpServletRequest request, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();

		try
		{			
			String logIdentifier = requestLogging(request, bodyString);

			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			HashMap data = new HashMap();
			
			List<HashMap> destinationList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserDestinations", requestInfo);
			data.put("destinationList", destinationList );

			response.setData( data );
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("목적지 검색 도중 오류가 발생했습니다.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/getRecentPosts.do")
	public @ResponseBody APIResponse getRecentPosts( HttpServletRequest request, @RequestBody String bodyString, String strPageSize )
	{
		APIResponse response = new APIResponse();

		try
		{			
			HashMap additionalData = new HashMap();
			
			int pageSize = 5;

			if ( !Util.isEmptyString(strPageSize) ) pageSize = Integer.parseInt(strPageSize);
			
			List<Post> postsNearHere = sqlSession.selectList("com.tessoft.nearhere.taxi.getRecentPosts", pageSize );
			
			for ( int i = 0; i < postsNearHere.size();i++ )
			{
				Post item = postsNearHere.get(i);
				String repetitiveYN = item.getRepetitiveYN();
				
				String departureDateTime = item.getDepartureDateTime();
				departureDateTime = Util.getDepartureDateTime(departureDateTime);
				
				item.setDepartureDateTime(departureDateTime);
			}
			
			additionalData.put("postsNearHere", postsNearHere );

			response.setData( additionalData );
			
			logger.info( "[getRecentPosts.do]: " + bodyString );

			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
}
