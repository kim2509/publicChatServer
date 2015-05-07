package com.dy.controller;

import java.util.ArrayList;
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

import com.dy.common.Constants;
import com.dy.domain.Chat;
import com.dy.domain.ChatMessage;
import com.dy.domain.UserProfileKeyword;
import com.dy.domain.UserProfileKeywordDic;

@Controller
public class BaseController implements BeanFactoryAware {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;
	
	@RequestMapping( value ="/test.do", method = RequestMethod.GET)
	public @ResponseBody String test( ModelMap model )
	{
		return "test";
	}
	
	/*
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
	*/
	
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
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/fetchMessage.do", method = RequestMethod.POST)
	public @ResponseBody List<ChatMessage> fetchMessage(ModelMap model, @RequestBody String bodyString ) {
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			
			HashMap<String,String> hash = mapper.readValue(bodyString, new TypeReference<HashMap<String,String>>(){});
			
			List<HashMap<String,String>> list = sqlSession.selectList("com.dy.mapper.existChatHistory", hash );
			
			if ( list != null && list.size() > 0 )
			{
				HashMap ChatHistory = list.get(0);
				ChatHistory.put("roomID", ChatHistory.get("ROOM_ID"));
				ChatHistory.put("fetchCount", Constants.FETCH_MESSAGE_COUNT );
				ChatHistory.put("lastChatID", hash.get("lastChatID") );
			
				List<ChatMessage> chatMessages = sqlSession.selectList("com.dy.mapper.chatMessages", ChatHistory );
				
				System.out.println( mapper.writeValueAsString( chatMessages ) );
				
				return chatMessages;
			}
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping( value ="/sendMessage.do", method = RequestMethod.POST)
	public @ResponseBody List<HashMap<String,String>> sendMessage(ModelMap model, @RequestBody String bodyString ) {
		
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			
			HashMap<String,String> hash = mapper.readValue(bodyString, new TypeReference<HashMap<String,String>>(){});
			
			List<HashMap<String,String>> list = sqlSession.selectList("com.dy.mapper.existChatHistory", hash );
			
			long roomID = 0;
			
			if ( list == null || list.size() == 0 )
			{
				sqlSession.insert("com.dy.mapper.insertChatRoom", hash );
				
				ArrayList<HashMap<String,String>> users = new ArrayList<HashMap<String,String>>();
				HashMap<String,String> user = new HashMap<String,String>();
				user.put("roomID", String.valueOf(hash.get("roomID")));
				user.put("userNo", String.valueOf(hash.get("userNo")));
				users.add( user );
				HashMap<String,String> anotherUser = new HashMap<String,String>();
				anotherUser.put("roomID", String.valueOf(hash.get("roomID")));
				anotherUser.put("userNo", String.valueOf(hash.get("anotherUserNo")));
				users.add( anotherUser );
				
				sqlSession.insert("com.dy.mapper.insertChatRoomUsers", users );
				
				sqlSession.insert("com.dy.mapper.createChatRoomTable", hash );
				
				System.out.println( mapper.writeValueAsString( hash ) );
				
				String strRoomID = String.valueOf( hash.get("roomID") );
				roomID = Long.valueOf( strRoomID );
			}
			else
			{
				HashMap ChatHistory = list.get(0);
				String strRoomID = String.valueOf( ChatHistory.get("ROOM_ID") );
				roomID = Long.valueOf( strRoomID );	
			}

			ChatMessage msg = new ChatMessage();
			
			//int roomID = Integer.parseInt(  );
			msg.setSender(String.valueOf(hash.get("userNo")));
			msg.setRoomID( roomID );
			msg.setMsg(hash.get("msg"));
			sqlSession.insert("com.dy.mapper.insertChatMessage", msg );

			return list;
		}
		catch( Exception ex )
		{
			ex.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping( value ="/getMetaInfo.do", method = RequestMethod.POST)
	public @ResponseBody String getMetaInfo(ModelMap model, @RequestBody String bodyString ) {
		
		return "true2";
	}
	
	public void setBeanFactory(BeanFactory arg0) throws BeansException {
		// TODO Auto-generated method stub
		
	}
 
}