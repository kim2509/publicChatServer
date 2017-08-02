package com.tessoft.nearhere;

import java.util.Date;
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
import com.nearhere.domain.User;
import com.nearhere.domain.UserLocation;

import common.CafeBiz;
import common.CarPoolPostBiz;
import common.UserBiz;

@Controller
public class UserController extends BaseController{

	@RequestMapping( value ="/user/registerNewMember.do")
	public ModelAndView registerNewMember ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			

			insertHistory("/cafe/registerNewMember.do", userID , null , null, null );
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return new ModelAndView("user/registerNewMember", model);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/user/registerMemberAjax.do")
	public @ResponseBody APIResponse registerMemberAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			String regionNo = param.get("regionNo").toString();
			param.put("userID", userID);
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> cafeMeetings = cafeBiz.getFavCafeListByRegion(param);
			response.setData(cafeMeetings);
			response.setData2( cafeBiz.getFavCafeCountByRegion(param) );
			
			insertHistory("/cafe/getCafeListByRegionAjax.do", userID , regionNo , null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/getCafeListByRegionAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/user/userInfo.do")
	public ModelAndView userInfo ( HttpServletRequest request, HttpServletResponse response , 
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
			User user = userBiz.selectUser(userInfo.get("userID").toString(), false);
			String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
			userInfo.put("profilePoint", profilePoint);
			
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
			mv.addObject("friendList", userBiz.getFriendList(userID, false) );
			
			List<HashMap> userPostList = CarPoolPostBiz.getInstance(sqlSession).getUserPosts(userID);
			mv.addObject("userPostList", userPostList );
			
			logger.info( "userPostList: " + mapper.writeValueAsString( userPostList ) );
		}
		catch( Exception ex )
		{
			
		}
		
		return mv;
	}
	
	@RequestMapping( value ="/user/friendInfo.do")
	public ModelAndView friendInfo ( HttpServletRequest request, HttpServletResponse response , 
			String userID, String userHash )
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/friendInfo");
		
		if ( Util.isEmptyString( userID ) || ( Constants.bReal&& !request.isSecure()) ) return mv;
		
		UserBiz userBiz = UserBiz.getInstance(sqlSession);
		
		mv.addObject("friendList", userBiz.getFriendList(userID, true ) );
		
		return mv;
	}
	
	@RequestMapping( value ="/user/updateUserInfo.do")
	public @ResponseBody APIResponse updateUserInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap requestHash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			sqlSession.update("com.tessoft.nearhere.user.updateUserAppVersion", requestHash);
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return response;
	}
}
