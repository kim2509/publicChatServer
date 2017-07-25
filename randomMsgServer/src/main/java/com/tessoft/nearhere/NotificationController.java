package com.tessoft.nearhere;

import java.util.HashMap;
import java.util.List;

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

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

import common.CafeBiz;
import common.CafePushBiz;
import common.UserBiz;

@Controller
public class NotificationController extends BaseController{

	@RequestMapping( value ="/notification/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, String userHash, @CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notification/list");

		try
		{
			if ( Util.isEmptyString(userID) && !Util.isEmptyString(userToken) )
				userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			
			if ( Util.isEmptyString( userID ) ) return mv;
			
			logger.info("[notification/list.do] userID:" + userID );
			
			List<HashMap> userPushMessageList = UserBiz.getInstance(sqlSession).getUserPushMessage(userID);
			
			mv.addObject("userPushMessageList", userPushMessageList );		
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return mv;
	}
	
	// 푸쉬 읽음 처리
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/notification/updatePushMessageAsReadAjax.do")
	public @ResponseBody APIResponse updatePushMessageAsReadAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", userID);

			UserBiz.getInstance(sqlSession).updateUserPushMessageAsRead(param);

			insertHistory("/cafe/updatePushMessageAsReadAjax.do", userID , null, null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");

			insertHistory("/cafe/updatePushMessageAsReadAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}

		return response;
	}
	
	// 푸쉬 읽음 처리
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/notification/updateAllUserPushMessageAsRead.do")
	public @ResponseBody APIResponse updateAllPushMessageesAsReadAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", userID);

			UserBiz.getInstance(sqlSession).updateAllUserPushMessageAsRead(param);

			insertHistory("/cafe/updateAllUserPushMessageAsRead.do", userID , null, null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");

			insertHistory("/cafe/updateAllUserPushMessageAsRead.do", null , null , null, "exception" );
			logger.error( ex );
		}

		return response;
	}
}
