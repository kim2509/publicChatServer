package com.tessoft.nearhere.taxi;

import java.util.Date;
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

import common.CarPoolPostBiz;
import common.UserBiz;

@Controller
public class UserController extends BaseController{

	@RequestMapping( value ="/user/userInfo.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			String userID,
			ModelMap model )
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userInfo");
		
		try
		{
			if ( Util.isEmptyString( userID ) || ( Constants.bReal&& !request.isSecure()) ) return mv;
			
			UserBiz userBiz = UserBiz.getInstance(sqlSession);
			
			HashMap userInfo = userBiz.getUserInfo(userID);
			
			if ( !Util.isEmptyString( userInfo.get("birthday") ) )
			{
				String birthday = userInfo.get("birthday").toString().replaceAll("-", "");
				if ( birthday.length() >= 4 )
				{
					Date d = new Date();
					int year = d.getYear() + 1900;
					int birthYear = Integer.parseInt( birthday.substring(0, 4) );
					int age = year - birthYear + 1;
					userInfo.put("age", String.valueOf( age ) );
				}
			}
			
			mv.addObject("userInfo", userInfo);
			
			mv.addObject("userLocationList", userBiz.getUserLocation(userID) );
			mv.addObject("friendList", userBiz.getFriendList(userID) );
			
			List<HashMap> userPostList = CarPoolPostBiz.getInstance(sqlSession).getUserPosts(userID);
			mv.addObject("userPostList", userPostList );
			
			logger.info( "userPostList: " + mapper.writeValueAsString( userPostList ) );	
		}
		catch( Exception ex )
		{
			
		}
		
		return mv;
	}
	
}
