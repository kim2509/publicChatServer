package controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nearhere.domain.APIResponse;

@Controller
public class DriverController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping( value ="/driver/driverMain.do")
	public ModelAndView driverMain ( HttpServletRequest request, HttpServletResponse response ,
			ModelMap model )
	{
		if ( "driver".equals( request.getParameter("mode") ) )
			return new ModelAndView("driver/driverGetCall", model);
		else
			return new ModelAndView("driver/driverMain", model);
	}
	
	@RequestMapping( value ="/driver/registerDriver.do")
	public ModelAndView registerDriver ( HttpServletRequest request, HttpServletResponse response ,
			ModelMap model )
	{
		return new ModelAndView("driver/registerDriver", model);
	}
	
	@RequestMapping( value ="/driver/callDriver.do")
	public ModelAndView callDriver ( HttpServletRequest request, HttpServletResponse response ,
			ModelMap model )
	{
		return new ModelAndView("driver/callDriver", model);
	}
	
	@RequestMapping( value ="/driver/waitingDriver.do")
	public ModelAndView waitingDriver ( HttpServletRequest request, HttpServletResponse response ,
			ModelMap model )
	{
		return new ModelAndView("driver/waitingDriver", model);
	}
}
