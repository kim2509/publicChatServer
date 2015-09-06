package com.tessoft.nearhere.taxi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.Constants;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.User;
import com.nearhere.domain.UserPushMessage;

@Controller
public class AdminController extends BaseController{

	@RequestMapping( value ="/admin/index.do")
	public ModelAndView index ( HttpServletRequest request )
	{
		try
		{
			ModelAndView mav = new ModelAndView();
	        mav.setViewName("redirect:login.do");
			if ( request.getSession().getAttribute("id") == null )
				return mav;
		}
		catch(Exception ex )
		{
			
		}
		
		return new ModelAndView("admin/index");
	}
	
	@RequestMapping( value ="/admin/login.do")
	public ModelAndView login ( HttpServletRequest request )
	{
		try
		{
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			
			if ( "admin".equals( id ) && "fdsa4321".equals( pw ) )
			{
				ModelAndView mav = new ModelAndView();
				request.getSession().setAttribute("id", "admin");
				mav.setViewName("redirect:index.do");
				return mav;
			}
		}
		catch(Exception ex )
		{
			
		}
		
		return new ModelAndView("admin/login");
	}
	
	@RequestMapping( value ="/admin/sendEventPushToAllUsers.do")
	public @ResponseBody APIResponse sendEventPushToAllUsers( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectUsersForEventPush");
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);
				
				logger.info( "[sendEventPushToAllUsers] sent to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );
				
				sendPushMessage(receiver, "event", requestInfo.get("title"), requestInfo.get("eventID"), true );
			}
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendEventPushToAllUsers]" + ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendEventPushToAdmin.do")
	public @ResponseBody APIResponse sendEventPushToAdmin( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectAdminForEventPush");
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);
				
				logger.info( "[sendEventPushToAdmin] sending to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );
				
				sendPushMessage(receiver, "event", requestInfo.get("title"), requestInfo.get("eventID"), true );
			}
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendEventPushToAdmin]" + ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendEventResult.do")
	public @ResponseBody APIResponse sendEventResult(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap hash = new HashMap();
			
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap data = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			List<String> usersToSend = (List<String>) data.get("userList");
			String eventSeq = data.get("eventSeq").toString();
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersWithUserID", usersToSend );
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				sendPushMessage(userList.get(i), "eventssl", data.get("title").toString() , eventSeq + "Result", true );
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
	
	
	@RequestMapping( value ="/admin/sendLocationUpdateToAllUsers.do")
	public @ResponseBody APIResponse sendLocationUpdateToAllUsers( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectUsersForLocationUpdate");
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);
				
				logger.info( "[sendEventPushToAllUsers] sent to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );
				
				sendPushMessage(receiver, "locationUpdate", "합승 등록 이벤트를 진행합니다!!!", "", true );
			}
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendEventPushToAllUsers]" + ex.getMessage());
		}
		
		return response;
	}
}
