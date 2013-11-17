package com.dy.controller;

import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dy.domain.User;
import com.dy.domain.UserProfileKeyword;
import com.dy.domain.UserProfileKeywordDic;

@Controller
public class BaseController implements BeanFactoryAware {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;
	
	@RequestMapping( value ="/mainInfo.do", method = RequestMethod.POST)
	public @ResponseBody List<HashMap<String, String>> mainInfo( ModelMap model, @RequestBody String bodyString )
	{
		List<HashMap<String, String>> userList = null;
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			userList = sqlSession.selectList("com.dy.mapper.getUsersNearMe", user );
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return userList;
	}
	
	@RequestMapping( value ="/registerAsRandomID.do", method = RequestMethod.POST)
	public @ResponseBody User registerAsRandomID(ModelMap model, @RequestBody String bodyString ) {
		
		User user = null;
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			if ( user.getUserNo() == 0 )
			{
				sqlSession.insert("com.dy.mapper.insertUser", user );
				sqlSession.insert("com.dy.mapper.insertUserLocation", user );
				user = sqlSession.selectOne( "com.dy.mapper.getUser",  user.getUserNo() );
			}
			else
			{
				user = sqlSession.selectOne( "com.dy.mapper.getUser",  user.getUserNo() );
				sqlSession.update("com.dy.mapper.updateUserLocation", user );
			}
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return user;
	}
	
	@RequestMapping( value ="/saveUserSex.do", method = RequestMethod.POST)
	public @ResponseBody User saveUserSex(ModelMap model, @RequestBody String bodyString ) {
		
		User user = null;
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			sqlSession.update("com.dy.mapper.updateUserSex", user );
			
			user = sqlSession.selectOne( "com.dy.mapper.getUser",  user.getUserNo() );
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return user;
	}
	
	@RequestMapping( value ="/saveBirthYearAndGetUserProfileKeywords.do", method = RequestMethod.POST)
	public @ResponseBody List<UserProfileKeywordDic> saveBirthYearAndGetUserProfileKeywords(ModelMap model, @RequestBody String bodyString ) {
		
		List<UserProfileKeywordDic> arResult = null;
		
		User user = null;
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			sqlSession.update("com.dy.mapper.updateUserAge", user );
			
			arResult = sqlSession.selectList("com.dy.mapper.getUserProfileKeywordDic");
			
			
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return arResult;
	}
	
	@RequestMapping( value ="/saveUserKeywords.do", method = RequestMethod.POST)
	public @ResponseBody String saveUserKeywords(ModelMap model, @RequestBody String bodyString ) {
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			
			List<UserProfileKeyword> list = mapper.readValue(bodyString, new TypeReference<List<UserProfileKeyword>>(){});
			
			if ( list.size() > 0 )
			{
				sqlSession.delete("com.dy.mapper.deleteUserProfileKeywords", list.get(0));
				sqlSession.insert("com.dy.mapper.batchInsertUserProfileKeywords", list );
			}
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return "true";
	}
	
	@RequestMapping( value ="/fetchMessage.do", method = RequestMethod.POST)
	public @ResponseBody String fetchMessage(ModelMap model, @RequestBody String bodyString ) {
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return "true";
	}
	
	public void setBeanFactory(BeanFactory context) throws BeansException {
		
	}
 
}