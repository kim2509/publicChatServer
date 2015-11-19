package com.tessoft.nearhere.taxi;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LocationController {
	@Autowired
	private SqlSession sqlSession;
	
	ObjectMapper mapper = null;
	
	public LocationController()
	{
		mapper = new ObjectMapper();
	}
	
	@RequestMapping( value ="/location/userLocation.do")
	public ModelAndView userLocation( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		return new ModelAndView("location/location", "location", null);
	}
}
