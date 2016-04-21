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

@Controller
public class FriendController extends BaseController{

	@RequestMapping( value ="/friend/index.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			@CookieValue(value = "userID", defaultValue = "") String userID,
			ModelMap model )
	{
		return new ModelAndView("friend/index", model);
	}
}
