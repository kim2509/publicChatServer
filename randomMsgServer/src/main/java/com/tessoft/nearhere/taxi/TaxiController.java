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
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.Notice;
import com.nearhere.domain.Post;
import com.nearhere.domain.PostReply;
import com.nearhere.domain.User;
import com.nearhere.domain.UserLocation;
import com.nearhere.domain.UserMessage;
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
			
			ObjectMapper mapper = new ObjectMapper();
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
			
			Post post = mapper.readValue(bodyString, new TypeReference<Post>(){});
			
			post = sqlSession.selectOne("com.tessoft.nearhere.taxi.getPostDetail", post);
			
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
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			List<UserMessage> messageList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserMessage", user );
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
}
