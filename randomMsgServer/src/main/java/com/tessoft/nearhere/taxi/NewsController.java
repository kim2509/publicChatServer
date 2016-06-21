package com.tessoft.nearhere.taxi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsController extends BaseController{

	@SuppressWarnings("unused")
	@RequestMapping( value ="/news/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		Document doc = Jsoup.connect("http://m.seoul.go.kr/mw/topmenu.do").get();
		Elements newsHeadlines = doc.select("#container .grid").get(0).select(".container").get(0).select("li a[class=ts_a]");
		
		ArrayList<HashMap<String, String>> items = new ArrayList<HashMap<String, String>>();
		
		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = newsHeadlines.get(i).html();
			String link = newsHeadlines.get(i).attr("href");
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			items.add( hash );
		}
		
		model.addAttribute("host", "http://m.seoul.go.kr/");
		model.addAttribute("items", items );
		
		return new ModelAndView("news/list", model);
	}
}
