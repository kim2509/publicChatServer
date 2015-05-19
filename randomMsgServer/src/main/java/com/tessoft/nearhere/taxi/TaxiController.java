package com.tessoft.nearhere.taxi;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.*;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig.Feature;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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

			if ( hash.containsKey("UUID") )
			{
				// 기존 UUID 가 있는지 검사
				if ( "ffffffff-eb06-2ce8-ffff-ffffc6a77bf8".equals( hash.get("UUID") ) )
				{
					response.setResCode( ErrorCode.UNKNOWN_ERROR );
					response.setResMsg("회원가입 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
					return response;
				}
			}
			
			/*
			if ( hash.containsKey("UUID") )
			{
				// 기존 UUID 가 있는지 검사
				if ( "ffffffff-cf61-8f83-23cf-387f485472b4".equals( hash.get("UUID") ) ||
						"00000000-3cdb-d0ac-9c1c-96300033c587".equals( hash.get("UUID") ) ||
						"00000000-60a6-9d2e-ffff-ffff99d603a9".equals( hash.get("UUID") ))
				{
					// 김대용 휴대폰이면
					String userNo = "";
					
					try
					{
						userNo = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserNoByUUID", hash );
						if ( !Util.isEmptyString( userNo ) )
							user.setUserNo(userNo);	
					}
					catch( Exception ex )
					{
						logger.error("error while getRandomIDV2", ex );
					}
					
				}
				
				user.setUuid( hash.get("UUID").toString() );
			}
			*/
			
			getRandomIDCommon(user, response, logIdentifier);

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

	private void getRandomIDCommon(User user, APIResponse response,
			String logIdentifier) {
		
		if ( user.getUserNo() != null && !user.getUserNo().isEmpty())
		{
			logger.info( "[" + logIdentifier + "]: userNo is not null.");
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByUserNo", user);
			if ( tempUser == null || tempUser.getUserID() == null || tempUser.getUserID().isEmpty() )
			{
				user.setUserNo(null);
				logger.info( "[" + logIdentifier + "]: userNo set null.");
			}
			else
			{
				user = tempUser;
			}
		}
		
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

		response.setData( user );
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

			getRandomIDCommon(user, response, logIdentifier);

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

			user = selectUser(user);

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
			String logIdentifier = requestLogging(request, bodyString);

			UserLocation location = mapper.readValue(bodyString, new TypeReference<UserLocation>(){});

			if ( location != null && 
					(Util.isEmptyString( location.getLatitude() ) || Util.isEmptyString( location.getLongitude() )) )
			{
				logger.info( "[" + logIdentifier + "]: location's latitude and longitude is null.");
				response.setData("0|0");
				return response;
			}
			
			int result = sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserLocation", location );

			int result2 = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserLocation", location );

			response.setData( result + "|" + result2 );

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
	
	@RequestMapping( value ="/taxi/login_bg.do")
	public @ResponseBody APIResponse login_bg( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			bodyString = mapper.writeValueAsString( hash.get("user") );
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			user = selectUser(user);
			
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);

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

	@RequestMapping( value ="/taxi/logout.do")
	public @ResponseBody APIResponse logout( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			user.setRegID(null);

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegID", user );

			response.setData(result);

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

	private void sendPushMessageOnNewPost(Post post){
		
		try
		{
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
			
			User daeyong = new User();
			daeyong.setUserID("user27");
			daeyong.setUserNo("27");
			daeyong = selectUser( daeyong );
			sendPushMessage( daeyong, "newPostByDistance", "신규 글 등록알림", post.getPostID(), true );
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
			String logIdentifier = requestLogging(request, bodyString);

			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			hash.put("pageStart", 0 );
			hash.put("pageSize", 1);
			hash.remove("status");
			
			Post post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostsNearHere", hash);

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
				User user = new User();
				user.setUserID( hash.get("userID").toString() );
				user = selectUser(user);
				
				User writer = selectUser( post.getUser() );
				
				// 1.34 버전 이후부터 수신가능
				if ( Util.getDouble( writer.getAppVersion() ) > 1.34 )
				{
					sqlSession.insert("com.tessoft.nearhere.taxi.insertPostReadHistory", hash );
					
					if ( bProgressing )
					{
						sendPushMessage( writer , "inquiryUser", 
								user.getUserName() + "님이 고객님의 합승내역을 조회했습니다.", user.getUserID(), true );						
					}
				}
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
					sendPushMessage( user, "postReply", post.getMessage(), post.getPostID(), true);
				}
				else
					sendPushMessage( user, "postReply", post.getMessage(), post.getPostID(), false );
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

			userToInquiry = selectUser(userToInquiry);
			HashMap resHash = getUserInfoCommon(userToInquiry);

			response.setData(resHash);

			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
			
			String userID = hash.get("userID").toString();
			
			User user = new User();
			user.setUserID( userID );
			user = selectUser(user);
			
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

	private User selectUser(User user) {
		user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
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

			user = selectUser(user);
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
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegIDAsNull", user );
			
			int result2 = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegID", user );

			response.setData(result + "|" + result2);

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
				sendPushMessage( message.getToUser(), "message", message.getMessage(), message.getFromUser().getUserID(), true );
			else
				sendPushMessage( message.getToUser(), "message", message.getMessage(), message.getFromUser().getUserID(), false );

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

	private void sendPushMessage( User receiver, String type, String msg, String param, boolean bSendPush ) throws Exception
	{
		try
		{
			logger.info( "sendPushMessage[" + bSendPush + "]: " + mapper.writeValueAsString(receiver) );

			receiver = selectUser(receiver);

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
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );

			logger.info( "insertUserPushMessage result : " + result );

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
					sendPushMessageOnNewPost( post );
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
			String logIdentifier = requestLogging(request, bodyString);

			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			HashMap countInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.getUnreadCount", info );
			
			int count = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUnreadNoticeCount", info );
			countInfo.put("noticeCount", count );

			response.setData(countInfo);

			if ( info.containsKey("UUID") )
			{
				logger.info( "[" + logIdentifier + "] uuid is not null.");
				int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSysInfo", info );
				response.setData2( result );
			}
			else
				logger.info( "[" + logIdentifier + "] uuid is null.");

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
			requestLogging(request, bodyString);

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
				sendPushMessage(userList.get(i), "event", "[이벤트] 이마트 상품권을 쏩니다!!", "1", true );	
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
	
	@RequestMapping( value ="/taxi/sendEventResult.do")
	public @ResponseBody APIResponse sendEventResult(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap hash = new HashMap();
			
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, List<String>> usersToSend = mapper.readValue(bodyString, new TypeReference<Map<String, List<String>>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersWithUserID", usersToSend.get("userList") );
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				sendPushMessage(userList.get(i), "eventssl", "축하드립니다! 이마트 상품권 이벤트에 당첨되셨습니다.", "1Result", true );
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
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead", message );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return mv;
	}
	
	@RequestMapping( value ="/taxi/eventInput.do")
	public @ResponseBody APIResponse eventInput( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			response.setData( requestInfo );
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
			String logIdentifier = requestLogging(request, bodyString);

			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<HashMap> info = sqlSession.selectList("com.tessoft.nearhere.taxi.getMainInfo", requestInfo);
			List<HashMap> newUsers = sqlSession.selectList("com.tessoft.nearhere.taxi.selectNewlyRegisteredUsers");
			String newUserCount = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectNewUsersCount");
			
			for ( int i = 0; i < newUsers.size(); i++ )
			{
				HashMap hash = newUsers.get(i);
				if ( hash.get("address") != null && !Util.isEmptyString( hash.get("address").toString() ) )
					hash.put("address", Util.getRegionName(hash.get("address").toString() ) );
			}
			
			HashMap additionalData = new HashMap();
			
			List<HashMap> progressingPosts = sqlSession.selectList("com.tessoft.nearhere.taxi.selectProgressingPosts", requestInfo);
			additionalData.put("progressingPosts", progressingPosts );
			
			List<HashMap> myPosts = sqlSession.selectList("com.tessoft.nearhere.taxi.selectMyPosts", requestInfo);
			additionalData.put("myPosts", myPosts );
			
			List<HashMap> postsWithin1Week = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostsWithin1Week", requestInfo);
			additionalData.put("postsWithin1Week", postsWithin1Week );
			
			additionalData.put("userList", newUsers );
			additionalData.put("newUserCount", newUserCount );

			response.setData( info );
			response.setData2( additionalData );
			
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
	
	@RequestMapping( value ="/taxi/index.do")
	public ModelAndView index ()
	{
		String message = "Hello World, Spring 3.0!";           
		return new ModelAndView("index", "message", message);
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
			String logIdentifier = requestLogging(request, bodyString);

			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			HashMap additionalData = new HashMap();
			
			List<HashMap> postsNearHere = sqlSession.selectList("com.tessoft.nearhere.taxi.selectsPostsNearHereV2", requestInfo);
			additionalData.put("postsNearHere", postsNearHere );

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
}
