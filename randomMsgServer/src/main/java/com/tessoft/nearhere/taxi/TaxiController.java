package com.tessoft.nearhere.taxi;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.Notice;
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

	@RequestMapping( value ="/taxi")
	public ModelAndView index ()
	{
		String message = "Hello World, Spring 3.0!";           
		return new ModelAndView("index", "message", message);
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
		try
		{
			requestLogging(request, bodyString);
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			bodyString = mapper.writeValueAsString( hash.get("user") );
			return getRandomID(request, bodyString);
		}
		catch( Exception ex )
		{
			return getRandomID(request, bodyString);
		}
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

			user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);

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
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertPost", post );

			HashMap distanceInfo = new HashMap();
			distanceInfo.put("latitude", post.getFromLatitude());
			distanceInfo.put("longitude", post.getFromLongitude());
			distanceInfo.put("userID", post.getUser().getUserID());

			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", distanceInfo);
			if ( userList != null && userList.size() > 0 )
			{
				for ( int i = 0; i < userList.size(); i++ )
				{
					UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", userList.get(i) );

					// 추천 알림받기 여부 체크
					if ( setting == null || !"N".equals( setting.getRecommendPushReceiveYN() ) )
						sendPushMessage(userList.get(i), "newPostByDistance", "500미터 내의 새로운 합승 정보가 등록되었습니다.", post.getPostID());
				}				
			}

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
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", requestData);
			response.setData(userList);

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

			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostsNearHere", requestData);

			response.setData(postList);
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", requestData);
			response.setData2( userList.size() );

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

			Post post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostsNearHere", hash);

			List<PostReply> replies = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostReplies", post );
			post.setPostReplies(replies);

			response.setData(post);

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePushMessageAsRead3", hash );
			
			response.setData2( result );
			
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
					sendPushMessage( user, "postReply", post.getMessage(), post.getPostID());
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

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/taxi/getUserInfo.do")
	public @ResponseBody APIResponse getUserInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			String logIdentifier = requestLogging(request, bodyString);

			User user = mapper.readValue(bodyString, new TypeReference<User>(){});

			user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			if ( profilePoint == null || "".equals( profilePoint ) )
				profilePoint = "0";
			user.setProfilePoint(profilePoint);

			List<UserLocation> locationList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserLocation", user);

			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserPost", user);

			List<Post> postsUserReplied = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostsUserReplied", user);

			HashMap hash = new HashMap();
			hash.put("user", user);
			hash.put("locationList", locationList);
			hash.put("userPost", postList);
			hash.put("postsUserReplied", postsUserReplied);

			response.setData(hash);

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
				sendPushMessage( message.getToUser(), "message", message.getMessage(), message.getFromUser().getUserID() );

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

	private String GCM_API_KEY = "AIzaSyAfDDYJvFo6EWjLJH9PsPYzhcZJke30B4A";
	private int push_retry_cnt = 5;
	private void sendPushMessage( User receiver, String type, String msg, String param ) throws Exception
	{
		try
		{
			logger.info( "sendPushMessage: " + mapper.writeValueAsString(receiver) );

			receiver = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", receiver);

			UserPushMessage pushMessage = new UserPushMessage();
			pushMessage.setToUserID( receiver.getUserID() );
			pushMessage.setType(type);
			if ( "message".equals( type ) )
				pushMessage.setMessage("메시지가 도착하였습니다.");
			if ( "postReply".equals( type ) )
				pushMessage.setMessage("댓글이 등록되었습니다.");
			else if ("newPostByDistance".equals( type ) )
				pushMessage.setMessage( msg );

			pushMessage.setParam1(param);
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );

			logger.info( "insertUserPushMessage result : " + result );

			Sender sender = new Sender(GCM_API_KEY);

			Message message = null;

			if ( "message".equals( type ) )
			{
				message = new Message.Builder().addData("title", pushMessage.getMessage() )
						.addData("message",  msg )
						.addData("type",  type )
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

			Result pushResult = sender.send(message, receiver.getRegID() , push_retry_cnt);

			logger.info( "push result:" + pushResult.toString() );	
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

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updatePost", post );

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
			
			if ( !Util.isEmptyString( user.getMobileNo() ) && 
					(Util.isEmptyString( user.getUserName() ) || Util.isEmptyString( user.getSex() ) ) )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("입력값이 올바르지 않습니다.\r\n다시 확인해 주십시오.");
				return response;
			}

			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserInfo", user );

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
}
