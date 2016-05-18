package com.tessoft.nearhere.taxi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController extends BaseController{

	@RequestMapping( value ="/user/userInfo.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			@CookieValue(value = "userID", defaultValue = "") String userID,
			ModelMap model )
	{
		return new ModelAndView("user/userInfo", model);
	}
	
}
