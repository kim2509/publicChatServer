package com.tessoft.nearhere.taxi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.Util;

@Controller
public class TravelInfoController extends BaseController{

	@RequestMapping( value ="/travelInfo/index.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return new ModelAndView("travelInfo/index", model);
	}
	
}
