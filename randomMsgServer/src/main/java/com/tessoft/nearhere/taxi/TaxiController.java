package com.tessoft.nearhere.taxi;

import java.util.*;

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

	@Autowired
	private SqlSession sqlSession;
	ObjectMapper mapper = null;
	protected static Logger logger = Logger.getLogger(TaxiController.class.getName());
	
	public TaxiController()
	{
		mapper = new ObjectMapper();
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
	
	@RequestMapping( value ="/taxi/registerUser.do")
	public @ResponseBody APIResponse registerUser( ModelMap model, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();
		
		try
		{			
			logger.info( "REQUEST URL:" + "/taxi/registerUser.do" );
			logger.info( "REQUEST:" + bodyString );
			
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
			
			initializeUserSetting(user);
			
			user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
			
			response.setData( user );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
			
			return response;
	
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
			return response;
		}
	}

	private void initializeUserSetting(User user) {
		
		sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserSetting", user);
		
		UserSetting setting = new UserSetting();
		setting.setUserID(user.getUserID());
		setting.setSettingName("쪽지알림 받기");
		setting.setSettingValue("Y");
		sqlSession.insert("com.tessoft.nearhere.taxi.insertUserSetting", setting);
		setting = new UserSetting();
		setting.setUserID(user.getUserID());
		setting.setSettingName("댓글알림 받기");
		setting.setSettingValue("Y");
		sqlSession.insert("com.tessoft.nearhere.taxi.insertUserSetting", setting);
		setting = new UserSetting();
		setting.setUserID(user.getUserID());
		setting.setSettingName("추천알림 받기");
		setting.setSettingValue("Y");
		sqlSession.insert("com.tessoft.nearhere.taxi.insertUserSetting", setting);
	}
	
	@RequestMapping( value ="/taxi/getTermsContent.do")
	public @ResponseBody APIResponse getTermsContent( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getTermsContent.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap termsVersion = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectTermsVersion");
			HashMap termsContent = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectTermsContent", termsVersion);
			
			response.setData(termsContent);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/insertTermsAgreement.do")
	public @ResponseBody APIResponse insertTermsAgreement( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/insertTermsAgreement.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserTermsAgreement", hash );
			
			response.setData( result );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
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
	public @ResponseBody APIResponse updateUserLocation( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/updateUserLocation.do" );
			logger.info( "REQUEST:" + bodyString );
			
			UserLocation location = mapper.readValue(bodyString, new TypeReference<UserLocation>(){});
			
			int result = sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserLocation", location );
			
			int result2 = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserLocation", location );
			
			response.setData( result + "|" + result2 );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/login.do")
	public @ResponseBody APIResponse login( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/login.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap request = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			request.put("password", Util.encryptPassword( request.get("password").toString() ) );
			User user = sqlSession.selectOne("com.tessoft.nearhere.taxi.login", request);
			
			if ( user == null || "".equals( user.getUserID() ) )
			{
				response.setResCode( ErrorCode.INVALID_PASSWORD );
				response.setResMsg("아이디 혹은 암호가 올바르지 않습니다.");
			}
			
			response.setData(user);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}

	@RequestMapping( value ="/taxi/logout.do")
	public @ResponseBody APIResponse logout( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/login.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			user.setRegID(null);
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegID", user );
			
			response.setData(result);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/insertPost.do")
	public @ResponseBody APIResponse insertPost( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/insertPost.do" );
			logger.info( "REQUEST:" + bodyString );
			
			Post post = mapper.readValue(bodyString, new TypeReference<Post>(){});
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertPost", post );
			
			HashMap distanceInfo = new HashMap();
			distanceInfo.put("latitude", post.getFromLatitude());
			distanceInfo.put("longitude", post.getFromLongitude());
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", distanceInfo);
			if ( userList != null && userList.size() > 0 )
			{
				for ( int i = 0; i < userList.size(); i++ )
				{
					sendPushMessage(userList.get(i), "newPostByDistance", "500미터 내의 새로운 합승 정보가 등록되었습니다.", post.getPostID());
				}				
			}
			
			response.setData( result );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getUsersNearHere.do")
	public @ResponseBody APIResponse getUsersNearHere( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getUsersNearHere.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap request = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", request);
			response.setData(userList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getPostsNearHere.do")
	public @ResponseBody APIResponse getPostsNearHere( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getPostsNearHere.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap request = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostsNearHere", request);
			
			response.setData(postList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getPostDetail.do")
	public @ResponseBody APIResponse getPostDetail( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getPostDetail.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			Post post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostDetail", hash);
			
			List<PostReply> replies = sqlSession.selectList("com.tessoft.nearhere.taxi.getPostReplies", post );
			post.setPostReplies(replies);
			
			response.setData(post);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/insertPostReply.do")
	public @ResponseBody APIResponse insertPostReply( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/insertPostReply.do" );
			logger.info( "REQUEST:" + bodyString );
			
			PostReply post = mapper.readValue(bodyString, new TypeReference<PostReply>(){});
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertPostReply", post );
			
			response.setData( result );
			
			List<User> usersToSendPush = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersForPost", post );
			for ( int i = 0; i < usersToSendPush.size(); i++ )
				sendPushMessage( usersToSendPush.get(i), "postReply", post.getMessage(), post.getPostID());
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/taxi/getUserInfo.do")
	public @ResponseBody APIResponse getUserInfo( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getUserInfo.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
			
			List<UserLocation> locationList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserLocation", user);
			
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserPost", user);
			
			List<Post> postsUserReplied = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostsUserReplied", user);
			
			HashMap hash = new HashMap();
			hash.put("user", user);
			hash.put("locationList", locationList);
			hash.put("userPost", postList);
			hash.put("postsUserReplied", postsUserReplied);
			
			response.setData(hash);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserSex.do")
	public @ResponseBody APIResponse updateUserSex( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/updateUserSex.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSex", user );
			
			response.setData( result );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserJobTitle.do")
	public @ResponseBody APIResponse updateUserJobTitle( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/updateUserJobTitle.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserJobTitle", user );
			
			response.setData( result );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserBirthday.do")
	public @ResponseBody APIResponse updateUserBirthday( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/updateUserBirthday.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserBirthday", user );
			
			response.setData( result );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getNoticeList.do")
	public @ResponseBody APIResponse getNoticeList( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getNoticeList.do" );
			logger.info( "REQUEST:" + bodyString );
			
			List<Notice> noticeList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectNoticeList");
			
			response.setData(noticeList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getUserMessageList.do")
	public @ResponseBody APIResponse getUserMessageList( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getUserMessageList.do" );
			logger.info( "REQUEST:" + bodyString );
			
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
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getUserMessage.do")
	public @ResponseBody APIResponse getUserMessage( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getUserMessage.do" );
			logger.info( "REQUEST:" + bodyString );
			
			HashMap messageInfo = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserMessage", messageInfo );
			response.setData(messageList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getUserPushMessage.do")
	public @ResponseBody APIResponse getUserPushMessage( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/selectUserPushMessage.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserPushMessage", user );
			response.setData(messageList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getUserSetting.do")
	public @ResponseBody APIResponse getUserSetting( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/getUserSetting.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			List<UserSetting> settingsList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserSetting", user );
			
			if ( settingsList == null || settingsList.size() == 0 )
			{
				// 없으면 기본값 insert
				initializeUserSetting( user );
				settingsList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserSetting", user );
			}
			
			response.setData(settingsList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserSetting.do")
	public @ResponseBody APIResponse updateUserSetting( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/updateUserSetting.do" );
			logger.info( "REQUEST:" + bodyString );
			
			UserSetting setting = mapper.readValue(bodyString, new TypeReference<UserSetting>(){});
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserSetting", setting );
			
			response.setData(result);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserRegID.do")
	public @ResponseBody APIResponse updateUserRegID( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/updateUserRegID.do" );
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			int result = sqlSession.update("com.tessoft.nearhere.taxi.updateUserRegID", user );
			
			response.setData(result);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/sendUserMessage.do")
	public @ResponseBody APIResponse sendUserMessage( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.info( "REQUEST URL:" + "/taxi/sendUserMessage.do" );
			logger.info( "REQUEST:" + bodyString );
			
			UserMessage message = mapper.readValue(bodyString, new TypeReference<UserMessage>(){});
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserMessage", message );
			
			sendPushMessage( message.getToUser(), "message", message.getMessage(), message.getFromUser().getUserID() );
			
			HashMap messageInfo = new HashMap();
			
			messageInfo.put("userID", message.getFromUser().getUserID());
			messageInfo.put("fromUserID", message.getToUser().getUserID());
			
			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserMessage", messageInfo );
			response.setData(messageList);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
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
}
