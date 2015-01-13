package com.dy.controller;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
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
import com.nearhere.domain.User;
import com.nearhere.domain.UserLocation;

@Controller
public class TaxiController {

	@Autowired
	private SqlSession sqlSession;
	ObjectMapper mapper = null;
	
	public TaxiController()
	{
		mapper = new ObjectMapper();
	}
	
	private synchronized void initializeCommonValues()
	{
	}
	
	@RequestMapping( value ="/nearhere/taxi/getTermsContent.do")
	public @ResponseBody APIResponse getTermsContent( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			System.out.println( "REQUEST:" + bodyString );
			
			HashMap termsVersion = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectTermsVersion");
			HashMap termsContent = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectTermsContent", termsVersion);
			
			response.setData(termsContent);
			
			System.out.println( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			ex.printStackTrace();
		}
		
		return response;
	}
	
	@RequestMapping( value ="/nearhere/taxi/insertTermsAgreement.do")
	public @ResponseBody APIResponse insertTermsAgreement( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			System.out.println( "REQUEST:" + bodyString );
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserTermsAgreement", hash );
			
			response.setData( result );
			
			System.out.println( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			ex.printStackTrace();
		}
		
		return response;
	}
	
	@RequestMapping( value ="/nearhere/taxi/updateUserLocation.do")
	public @ResponseBody APIResponse updateUserLocation( ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			System.out.println( "REQUEST:" + bodyString );
			
			UserLocation location = mapper.readValue(bodyString, new TypeReference<UserLocation>(){});
			
			int result = sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserLocation", location );
			
			int result2 = sqlSession.delete("com.tessoft.nearhere.taxi.insertUserLocation", location );
			
			response.setData( result + "|" + result2 );
			
			System.out.println( "RESPONSE: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			ex.printStackTrace();
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
	
	@RequestMapping( value ="/nearhere/taxi/registerUser.do")
	public @ResponseBody APIResponse registerUser( ModelMap model, @RequestBody String bodyString )
	{
		User user = null;
		APIResponse response = new APIResponse();
		
		try
		{			
			System.out.println( "REQUEST:" + bodyString );
			
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
			
			System.out.println( "RESPONSE: " + mapper.writeValueAsString(response) );
			
			return response;
	
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
			return response;
		}
	}
	
	@RequestMapping( value ="/nearhere/taxi/getUserLocation.do")
	public @ResponseBody String getUserLocation( ModelMap model, @RequestBody String bodyString )
	{
		User user = null;
		
		try
		{			
			System.out.println( "REQUEST:" + bodyString );
			
			ObjectMapper mapper = new ObjectMapper();
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
		
			sqlSession.update("com.tessoft.neighborhood.updateUserLocation", user);
			
			System.out.println( "RESPONSE: true" );
			
			return "true";
	
		}
		catch( Exception ex )
		{
			
			return "false";
		}
	}
	
	@RequestMapping( value ="/nearhere/taxi/searchUsers.do")
	public @ResponseBody List<User> searchUsers( ModelMap model, @RequestBody String bodyString )
	{
		List<User> userList = null;
		try
		{			
			System.out.println( "REQUEST:" + bodyString );
			
			User user = mapper.readValue(bodyString, new TypeReference<User>(){}); 
			
			userList = sqlSession.selectList("com.tessoft.nearhere.taxi.searchUsers", user );
			
			System.out.println( "RESPONSE:" + mapper.writeValueAsString( userList ) );
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return userList;
	}
	
}
