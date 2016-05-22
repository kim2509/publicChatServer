package com.tessoft.nearhere.taxi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.User;

import common.MessageBiz;
import common.UserBiz;

@Controller
public class FriendController extends BaseController{

	@RequestMapping( value ="/friend/index.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			@CookieValue(value = "userID", defaultValue = "") String userID,
			ModelMap model )
	{
		return new ModelAndView("friend/index", model);
	}
	
	@RequestMapping( value ="/friend/getFriendRequestList.do")
	public @ResponseBody APIResponse getFriendRequestList( HttpServletRequest request, String userID )
	{
		APIResponse response = new APIResponse();

		try
		{			
			HashMap additionalData = new HashMap();
			
			List<HashMap> friendRequestList = sqlSession.selectList("com.tessoft.nearhere.friend.getFriendRequestList", userID );
			
			additionalData.put("friendRequestList", friendRequestList );

			response.setData( additionalData );
			
			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원검색 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/friend/searchUsers.do")
	public @ResponseBody APIResponse searchUsers( HttpServletRequest request, String keyword )
	{
		APIResponse response = new APIResponse();

		try
		{			
			HashMap additionalData = new HashMap();
			
			if ( !Util.isEmptyString(keyword) )
				keyword = keyword.trim();
			
			List<HashMap> userList = sqlSession.selectList("com.tessoft.nearhere.friend.searchUser", keyword );
			
			additionalData.put("userList", userList );

			response.setData( additionalData );
			
			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원검색 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/friend/askFriendRequest.do")
	public @ResponseBody APIResponse askFriendRequest( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{			
			HashMap additionalData = new HashMap();
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			if ( Util.isEmptyString(requestInfo.get("userID")) || Util.isEmptyString(requestInfo.get("userID2")) )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("요청이 올바르지 않습니다.\r\n다시 시도해 주십시오.");
				return response;
			}
			
			int result = sqlSession.insert("com.tessoft.nearhere.friend.askFriendRequest", requestInfo );
			
			UserBiz userBiz = UserBiz.getInstance(sqlSession);
			User user = userBiz.selectUser( requestInfo.get("userID2"), false );
			MessageBiz.getInstance(sqlSession).sendFriendRequestMessage(user.getRegID(), "친구요청", requestInfo.get("userID") );
			
			additionalData.put("result", result );

			response.setData( additionalData );
			
			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원검색 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/friend/acceptFriendRequest.do")
	public @ResponseBody APIResponse acceptFriendRequest( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{			
			HashMap additionalData = new HashMap();
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			if ( Util.isEmptyString(requestInfo.get("userID")) || Util.isEmptyString(requestInfo.get("userID2")) )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("요청이 올바르지 않습니다.\r\n다시 시도해 주십시오.");
				return response;
			}
			
			int result = sqlSession.insert("com.tessoft.nearhere.friend.acceptFriendRequest", requestInfo );
			
			/*
			UserBiz userBiz = UserBiz.getInstance(sqlSession);
			userBiz.
*/
			
			additionalData.put("result", result );

			response.setData( additionalData );
			
			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원검색 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
	
	@RequestMapping( value ="/friend/getFriendsList.do")
	public @ResponseBody APIResponse getFriendsList( HttpServletRequest request, String userID )
	{
		APIResponse response = new APIResponse();

		try
		{			
			HashMap additionalData = new HashMap();
			
			List<HashMap> friendsList = sqlSession.selectList("com.tessoft.nearhere.friend.getFriendsList", userID );
			
			additionalData.put("friendsList", friendsList );

			response.setData( additionalData );
			
			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원검색 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}
}