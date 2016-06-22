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

	public ArrayList<HashMap> getSeoulCityNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.seoul.go.kr/mw/topmenu.do").timeout(5000).get();
		Elements newsHeadlines = doc.select("#container .grid").get(0).select(".container").get(0).select("ul[class=txt_section] li a[class=ts_a]");
		
		String host = "http://m.seoul.go.kr/";
		
		ArrayList<HashMap> items = new ArrayList<HashMap>();
		
		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = newsHeadlines.get(i).html();
			String link = newsHeadlines.get(i).attr("href");
			
			if ( link.startsWith("javascript:") ) continue;
			
			if ( link.toLowerCase().startsWith("http") == false )
				link = host + link;
			
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			hash.put("regionNo", "40");
			hash.put("regionName", "서울시");
			hash.put("host", host );
			items.add( hash );
		}
		
		return items;
	}
	
	public ArrayList<HashMap> getGangnamGuNews() throws Exception
	{
		Document doc = Jsoup.connect("http://www.gangnam.go.kr/portal/main/portalMain.do").timeout(5000).get();
		Elements newsHeadlines = doc.select(".tabList").get(1).select("li a");
		newsHeadlines.addAll( doc.select(".tabList").get(3).select("li a") );
		
		String host = "http://www.gangnam.go.kr/";
		String regionNo = "1";
		String regionName = "강남구";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, regionName);
		
		return items;
	}
	
	public ArrayList<HashMap> getGwanakNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.gwanak.go.kr/infor/infor.jsp?tab_depth1=infor_main&tab_depth2=infor")
				.timeout(5000).get();
		Elements newsHeadlines = doc.select(".bb_list li a");
		
		String host = "http://m.gwanak.go.kr/";
		String regionNo = "3";
		String regionName = "관악구";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, regionName);
		
		return items;
	}
	
	public ArrayList<HashMap> getGwangjinGuNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.gwangjin.go.kr/board/MIT038/list#")
				.timeout(5000).get();
		Elements newsHeadlines = doc.select(".bbs_list a");
		
		String host = "http://m.gwangjin.go.kr/";
		String regionNo = "4";
		String regionName = "광진구";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, regionName);
		
		return items;
	}
	
	public ArrayList<HashMap> getGeumcheonGuNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.geumcheon.go.kr/html/046/046.jsp")
				.timeout(5000).get();
		Elements newsHeadlines = doc.select("#mainContent .bbs-con li a");
		
		String host = "http://m.geumcheon.go.kr/";
		String regionNo = "6";
		String regionName = "금천구";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, regionName);
		
		return items;
	}

	private ArrayList<HashMap> getHashMapList(Elements newsHeadlines, String host, String regionNo, String regionName) {
		ArrayList<HashMap> items = new ArrayList<HashMap>();
		
		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = newsHeadlines.get(i).html();
			String link = newsHeadlines.get(i).attr("href");
			
			if ( link.startsWith("javascript:") ) continue;
			
			if ( link.toLowerCase().startsWith("http") == false )
				link = host + link;
			
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			hash.put("regionNo", regionNo);
			hash.put("regionName", regionName);
			hash.put("host", host );
			items.add( hash );
		}
		return items;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping( value ="/news/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		ArrayList items = new ArrayList();
		try
		{
			items = getSeoulCityNews();
			items.addAll( getGangnamGuNews() );
			items.addAll( getGwanakNews() );
			items.addAll( getGwangjinGuNews() );
			items.addAll( getGeumcheonGuNews() );
		}
		catch( Exception ex )
		{
			
		}
		
		model.addAttribute("items", items );
		
		return new ModelAndView("news/list", model);
	}
}
