package com.dy.controller;

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
import com.nearhere.domain.Post;
import com.nearhere.domain.User;
import com.nearhere.domain.UserLocation;

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
			
			user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
			
			response.setData( user );
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
			
			return response;
	
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			return response;
		}
	}
	
	@RequestMapping( value ="/taxi/getTermsContent.do")
	public @ResponseBody APIResponse getTermsContent( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
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
			ex.printStackTrace();
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/insertTermsAgreement.do")
	public @ResponseBody APIResponse insertTermsAgreement( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
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
			ex.printStackTrace();
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/updateUserLocation.do")
	public @ResponseBody APIResponse updateUserLocation( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
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
			ex.printStackTrace();
		}
		
		return response;
	}

	@RequestMapping( value ="/taxi/insertPost.do")
	public @ResponseBody APIResponse insertPost( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
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
			ex.printStackTrace();
		}
		
		return response;
	}
	
	@RequestMapping( value ="/taxi/getPostsNearHere.do")
	public @ResponseBody APIResponse getPostsNearHere( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
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
			ex.printStackTrace();
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
			logger.info( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
			
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUserPost", user);
			
			List<Post> postsUserReplied = sqlSession.selectList("com.tessoft.nearhere.taxi.selectPostsUserReplied", user);
			
			HashMap hash = new HashMap();
			hash.put("user", user);
			hash.put("userPost", postList);
			hash.put("postsUserReplied", postsUserReplied);
			
			response.setData(hash);
			
			logger.info( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			ex.printStackTrace();
		}
		
		return response;
	}
}
