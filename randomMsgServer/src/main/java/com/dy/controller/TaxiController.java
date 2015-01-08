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

import com.nearhere.domain.User;

@Controller
public class TaxiController {

	@Autowired
	private SqlSession sqlSession;
	ObjectMapper mapper = null;
	
	public TaxiController()
	{
		mapper = new ObjectMapper();
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
