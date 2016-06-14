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

	@RequestMapping( value ="/friend/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			@CookieValue(value = "userID", defaultValue = "") String userID,
			ModelMap model )
	{
		return new ModelAndView("friend/list", model);
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
			
			String userID = requestInfo.get("userID");
			String userID2 = requestInfo.get("userID2");
			
			if ( requestInfo.get("userID").equals( requestInfo.get("userID2") ) )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("본인에게 친구요청을 하실 수 없습니다.");
				return response;
			}
			
			List<HashMap> friendRequestList = sqlSession.selectList("com.tessoft.nearhere.friend.getFriendsList", userID );
			if ( friendRequestList != null )
			{
				for ( int i = 0; i < friendRequestList.size(); i++ ){
					if ( userID2.equals( friendRequestList.get(i).get("userID") ) )
					{
						response.setResCode( ErrorCode.UNKNOWN_ERROR );
						response.setResMsg("이미 친구입니다.");
						return response;
					}
				}	
			}
			
			
			int result = sqlSession.insert("com.tessoft.nearhere.friend.askFriendRequest", requestInfo );
			
			UserBiz userBiz = UserBiz.getInstance(sqlSession);
			User fromUser = userBiz.selectUser( requestInfo.get("userID"), false );
			User toUser = userBiz.selectUser( requestInfo.get("userID2"), false );
			MessageBiz.getInstance(sqlSession).sendFriendRequestMessage(toUser.getRegID(), fromUser.getUserName() + "님의 친구요청이 있습니다.", requestInfo.get("userID") );
			
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
			
			UserBiz userBiz = UserBiz.getInstance(sqlSession);
			User fromUser = userBiz.selectUser( requestInfo.get("userID"), false );
			User toUser = userBiz.selectUser( requestInfo.get("userID2"), false );
			MessageBiz.getInstance(sqlSession).sendAcceptFriendRequest(toUser.getRegID(), fromUser.getUserName() + "님이 친구요청을 수락했습니다.", requestInfo.get("userID") );
			
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
	
	@RequestMapping( value ="/friend/getFriendStatus.do")
	public @ResponseBody APIResponse getFriendStatus( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			if ( Util.isEmptyString(requestInfo.get("userID")) || Util.isEmptyString(requestInfo.get("userID2")) )
			{
				response.setResCode( ErrorCode.UNKNOWN_ERROR );
				response.setResMsg("요청이 올바르지 않습니다.\r\n다시 시도해 주십시오.");
				return response;
			}
			
			String result = sqlSession.selectOne("com.tessoft.nearhere.friend.getFriendStatus", requestInfo );
			
			if ( Util.isEmptyString(result ) )
				result = "";
			
			response.setData( result );
			
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
