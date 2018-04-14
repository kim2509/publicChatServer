package com.tessoft.nearhere;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
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

import common.CarPoolPostBiz;
import common.UserBiz;

@Controller
public class UserController extends BaseController{

	@Autowired
	ServletContext servletContext;
	
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
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	@RequestMapping( value ="/user/registerMemberAjax.do")
	public @ResponseBody APIResponse registerMemberAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		String newUserID = "";
		
		logDetail = new StringBuilder();
		logDetail.append("registerMemberAjax start|");
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			logDetail.append("1 token:" + userToken + "|");
			
			HashMap userMap = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			
			logDetail.append("3|");
			
			String userID = Util.getStringFromHash(userMap, "userID");
			
			logDetail.append("5 userID:" + userID + "|");
			
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
				logDetail.append("7|");
				
				param.put("userNo", Util.getStringFromHash(userMap, "userNo"));
				param.put("oldUserID", userID);
				param.put("type", "Normal");
				param.put("registerUserFinished", "Y");
				param.put("password", Util.encryptPassword( Util.getStringFromHash(param, "password") ));
				
				logDetail.append("9|");
				
				// 기존 아이디 체크
				List<HashMap> tmpList = UserBiz.getInstance(sqlSession).getRegisterAvailableCheck1(param);
				// 이미 회원일 경우 체크
				List<HashMap> tmpList2 = UserBiz.getInstance(sqlSession).getRegisterAvailableCheck2(param);
				if ( tmpList.size() > 0 )
				{
					logDetail.append("11|");
					
					response.setResCode( ErrorCode.REGISTER_USER_ALREADY_EXIST );
					response.setResMsg("해당 아이디는 이미 사용중입니다.");
				}
				else if ( tmpList2.size() > 0 )
				{
					logDetail.append("13|");
				
					response.setResCode( ErrorCode.REGISTER_USER_ALREADY_EXIST );
					response.setResMsg("고객님은 이미 이근처의 회원입니다.");
				}
				else
				{
					logDetail.append("15|");
					
					UserBiz userBiz = UserBiz.getInstance(sqlSession);
					userBiz.setLoggingBuffer(logDetail);
					userBiz.updateUserID(param);
					
					logDetail.append("17|");
					
					UserBiz.getInstance(sqlSession).updateUser(param);
				
					logDetail.append("21|");
					
					newUserID = Util.getStringFromHash(param, "userID");
					
					// user_token 갱신
					UserBiz.getInstance(sqlSession).renewUserToken(newUserID);
					
					logDetail.append("23|");
					
					User user = UserBiz.getInstance(sqlSession).selectUser( newUserID, false);
					response.setData(user);
					
					logDetail.append("25|");
				}
			}
			
			logDetail.append("27|");
			
			insertHistory("/cafe/registerMemberAjax.do", userID , newUserID , null, null );
			
			logDetail.append("registerMemberAjax end SUCCESS|");
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/registerMemberAjax.do", null , null , null, "exception" );
			logger.error( ex );
			
			if ( ex != null )
				logDetail.append("registerMemberAjax end ex:" + ex.getMessage() + "|");
			else
				logDetail.append("registerMemberAjax end ex null|");
		}
		finally {
			logger.info(logDetail.toString());
		}
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	@RequestMapping( value ="/user/loginAjax.do")
	public @ResponseBody APIResponse loginAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		logDetail = new StringBuilder();
		logDetail.append("loginAjax start|");
		
		try {
			
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			logDetail.append("1 loginID:" + Util.getStringFromHash(param, "loginID") + 
					"  userToken:" + Util.getStringFromHash(param, "userToken") + "|");
			
			param.put("password", Util.encryptPassword( Util.getStringFromHash(param, "password") ));
			
			logDetail.append("3|");
			
			HashMap loginInfo = UserBiz.getInstance(sqlSession).getLoginInfo(param);
			
			logDetail.append("5|");
			
			if ( loginInfo == null ) {
				response.setResCode( ErrorCode.INVALID_PASSWORD );
				response.setResMsg("아이디 혹은 비밀번호가 올바르지 않습니다.");
				
				logDetail.append("7|");
				
			} else {
				
				logDetail.append("9|");
				
				param.put("type", "Normal");
				UserBiz.getInstance(sqlSession).updateUser(param);
				
				logDetail.append("11|");
				
				// user_token 갱신
				UserBiz.getInstance(sqlSession).renewUserToken( Util.getStringFromHash(param, "loginID") );
				
				logDetail.append("13|");
				
				User user = UserBiz.getInstance(sqlSession).selectUser( Util.getStringFromHash(param, "loginID"), false);
				response.setData(user);
				
				logDetail.append("15|");
				
				String profilePoint = UserBiz.getInstance(sqlSession).selectProfilePoint(user);
				user.setProfilePoint(profilePoint);
				
				logDetail.append("loginAjax end SUCCESS|");
			}
			
		} catch ( Exception ex ) {
			logger.error(ex);
			
			if ( ex != null )
				logDetail.append("loginAjax end ex:" + ex.getMessage() + "|");
			else
				logDetail.append("loginAjax end ex null|");
			
		} finally {
			logger.info(logDetail.toString());
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
			String profilePoint = UserBiz.getInstance(sqlSession).selectProfilePoint(user);
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
	
	@RequestMapping( value ="/user/findID.do")
	public ModelAndView findID ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			

			insertHistory("/cafe/findID.do", userID , null , null, null );
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return new ModelAndView("user/findID", model);
	}
	
	@RequestMapping( value ="/user/findPassword.do")
	public ModelAndView findPassword ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			

			insertHistory("/cafe/findPassword.do", userID , null , null, null );
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return new ModelAndView("user/findPassword", model);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/user/findIDAjax.do")
	public @ResponseBody APIResponse findIDAjax( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).getIDFind(param);
			
			HashMap data = new HashMap();
			data.put("userInfo", userInfo);
			response.setData( data );
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	@RequestMapping( value ="/user/findPasswordAjax.do")
	public @ResponseBody APIResponse findPasswordAjax( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).getPasswordFind(param);
			
			HashMap data = new HashMap();
			data.put("userInfo", userInfo);
			response.setData( data );
			
			if ( userInfo != null && !Util.isEmptyForKey(userInfo, "email")) {
				
				String newPw = Util.randomString(8);
				param.put("password", Util.encryptPassword(newPw));
				UserBiz.getInstance(sqlSession).updateUserPassword(param);
				
				String htmlContent = "<html><head><meta charset=\"UTF-8\" />" +
						"<meta name=\"viewport\" content=\"user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width\" />" +
						"</head><body>" +
						"<div id=\"header\"><img src=\"cid:image\" style=\"width:250px;\"/></div>" +
						"<hr style=\"background:#7bafe3;height:2px;\" />" +
						"<div><h3>비밀번호 재설정안내</h3>" +
						"<p>해당 메일은 비밀번호 재설정 메일입니다.<br/><br/>고객님의 계정에 해당하는 비밀번호가 아래와 같이 변경되었습니다.</p>" +
						"<div>임시 비밀번호 : <span style=\"font-weight:bold;color:blue;\">" + newPw +"</span></div>" +
						"<p style=\"font-size:14px;margin-top:30px;color:#ab2010;\">비밀번호 변경요청을 하지 않았을 경우 아래의 고객센터로 연락 주시기 바랍니다.</p>" +
						"<hr /><div  style=\"font-size:14px;\">" +
						"이근처 고객센터 nearheretaxi@gmail.com" +
						"</div></div></body></html>";
				
				Util.sendPasswordResetMail( Util.getStringFromHash(userInfo, "email"),
						"비밀번호가 재설정되었습니다.", htmlContent, servletContext.getRealPath("image/email_footer.png") );
			}
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return response;
	}
	
	@RequestMapping( value ="/user/changePassword.do")
	public ModelAndView changePassword ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			

			insertHistory("/cafe/changePassword.do", userID , null , null, null );
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return new ModelAndView("user/changePassword", model);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	@RequestMapping( value ="/user/changePasswordAjax.do")
	public @ResponseBody APIResponse changePasswordAjax( HttpServletRequest request, ModelMap model, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logDetail = new StringBuilder();
			logDetail.append("changePasswordAjax start|");
			
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			
			logDetail.append("1 userID:" + userID + "|");
			
			param.put("loginID", userID);
			param.put("userToken", userToken);
			param.put("password", Util.encryptPassword( Util.getStringFromHash(param, "oldPassword") ));
			
			logDetail.append("3|");
			
			HashMap loginInfo = UserBiz.getInstance(sqlSession).getLoginInfo(param);
			
			if ( loginInfo == null ) {
				
				logDetail.append("5|");
				
				response.setResCode( ErrorCode.INVALID_PASSWORD );
				response.setResMsg("현재 비밀번호가 올바르지 않습니다.");
			} else {
				
				logDetail.append("7|");
				
				String newPw = Util.randomString(8);
				param.put("userID", userID);
				param.put("password", Util.encryptPassword(Util.getStringFromHash(param, "newPassword")));
				UserBiz.getInstance(sqlSession).updateUserPassword(param);
			}
			
			logDetail.append("changePasswordAjax end SUCCESS|");
		}
		catch( Exception ex )
		{
			logger.error(ex);
			
			if ( ex != null )
				logDetail.append("changePasswordAjax end ex:" + ex.getMessage() + "|");
			else
				logDetail.append("changePasswordAjax end ex null|");
		}
		finally {
			logger.info(logDetail.toString());
		}
		
		return response;
	}
}
