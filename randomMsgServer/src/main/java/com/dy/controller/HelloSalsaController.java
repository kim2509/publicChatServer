package com.dy.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hellosalsa.domain.MainInfoResponse;
import com.hellosalsa.domain.User;
import com.hellosalsa.domain.UserResponse;

@Controller
public class HelloSalsaController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping( value ="/registerUser.do")
	public @ResponseBody UserResponse registerUser( ModelMap model, @RequestBody String bodyString )
	{
		UserResponse res = new UserResponse();
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			User tempUser = sqlSession.selectOne("com.salsa.mapper.getUser", user.getUserID() );
			
			if ( tempUser == null )
				sqlSession.insert("com.salsa.mapper.insertUser", user );
			else
			{
				res.setResCode("1001");
				res.setResMessage("이미 사용중인 아이디입니다.");
			}
			
			res.setUser(user);
		}
		catch( Exception ex )
		{
			res.setResCode("9999");
			res.setResMessage(ex.getMessage());
			ex.printStackTrace();
		}
		
		return res;
	}
	
	@RequestMapping( value ="/login.do")
	public @ResponseBody UserResponse login( ModelMap model, @RequestBody String bodyString )
	{
		UserResponse res = new UserResponse();
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			User tempUser = sqlSession.selectOne("com.salsa.mapper.login", user );
			
			if ( tempUser == null )
			{
				res.setResCode("1002");
				res.setResMessage("아이디 혹은 비밀번호가 올바르지 않습니다.");
			}
			
			res.setUser(tempUser);
		}
		catch( Exception ex )
		{
			res.setResCode("9999");
			res.setResMessage(ex.getMessage());
			ex.printStackTrace();
		}
		
		return res;
	}
	
	@RequestMapping( value ="/mainInfo.do")
	public @ResponseBody MainInfoResponse mainInfo( ModelMap model, @RequestBody String bodyString )
	{
		MainInfoResponse res = new MainInfoResponse();
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			sqlSession.update("com.salsa.mapper.updateUserLocation", user );
			List<HashMap> userList = sqlSession.selectList("com.salsa.mapper.getUsersNearMe", user );
			
			res.setUserList(userList);
		}
		catch( Exception ex )
		{
			res.setResCode("9999");
			res.setResMessage(ex.getMessage());
			ex.printStackTrace();
		}
		
		return res;
	}
	
	
}
