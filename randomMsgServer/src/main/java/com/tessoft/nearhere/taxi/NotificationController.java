package com.tessoft.nearhere.taxi;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.Constants;
import com.dy.common.Util;

import common.UserBiz;

@Controller
public class NotificationController extends BaseController{

	@RequestMapping( value ="/notification/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, String userHash )
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notification/list");

		if ( Util.isEmptyString( userID ) || ( Constants.bReal&& !request.isSecure()) ) return mv;
		
		logger.info("[notification/list.do] userID:" + userID );
		
		List<HashMap> userPushMessageList = UserBiz.getInstance(sqlSession).getUserPushMessage(userID);
		
		mv.addObject("userPushMessageList", userPushMessageList );
		
		return mv;
	}
}
