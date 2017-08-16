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
		String newUserID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap userMap = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			String userID = Util.getStringFromHash(userMap, "userID");
			
			if ( Util.isEmptyString(userID) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자정보가 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "userID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("아이디가 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "password") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("비밀번호가 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "userName") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 이름이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "sex") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("성별이 올바르지 않습니다.");
			}
			else
			{
				param.put("userNo", Util.getStringFromHash(userMap, "userNo"));
				param.put("oldUserID", userID);
				param.put("type", "Normal");
				param.put("registerUserFinished", "Y");
				param.put("password", Util.getShaHashString( Util.getStringFromHash(param, "password") ));
				
				// 기존 아이디 체크
				List<HashMap> tmpList = UserBiz.getInstance(sqlSession).getRegisterAvailableCheck1(param);
				// 이미 회원일 경우 체크
				List<HashMap> tmpList2 = UserBiz.getInstance(sqlSession).getRegisterAvailableCheck2(param);
				if ( tmpList.size() > 0 )
				{
					response.setResCode( ErrorCode.REGISTER_USER_ALREADY_EXIST );
					response.setResMsg("해당 아이디는 이미 사용중입니다.");
				}
				else if ( tmpList2.size() > 0 )
				{
					response.setResCode( ErrorCode.REGISTER_USER_ALREADY_EXIST );
					response.setResMsg("고객님은 이미 이근처의 회원입니다.");
				}
				else
				{
					UserBiz.getInstance(sqlSession).updateUserID(param);
					UserBiz.getInstance(sqlSession).updateUser(param);
				
					newUserID = Util.getStringFromHash(param, "userID");
					
					// user_token 갱신
					UserBiz.getInstance(sqlSession).renewUserToken(newUserID);
					
					User user = UserBiz.getInstance(sqlSession).selectUser( newUserID, false);
					response.setData(user);
				}
			}
			
			insertHistory("/cafe/registerMemberAjax.do", userID , newUserID , null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/registerMemberAjax.do", null , null , null, "exception" );
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
