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
public class NewsController extends BaseController{

	public ArrayList<HashMap> getSeoulCityNews() throws Exception
	{
		String regionNo = "40";
		
		ArrayList<HashMap> items = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", regionNo );
		
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
		ArrayList bigCities = new ArrayList();
		try
		{
			bigCities = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.news.getBigCities");
			
			items = getSeoulCityNews();
//			items.addAll( getGangnamGuNews() );
//			items.addAll( getGwanakNews() );
//			items.addAll( getGwangjinGuNews() );
//			items.addAll( getGeumcheonGuNews() );
			
			List list = (List) sqlSession.selectList("com.tessoft.nearhere.news.getFavoriteRegionByUser", userID );
			String favoriteRegions = "";
			
			if ( list != null && list.size() > 0 )
			{
				for ( int i = 0; i < list.size(); i++ )
				{
					HashMap region = (HashMap) list.get(i);
					favoriteRegions += region.get("regionName") + ",";
					
					region.put("news", sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", region.get("regionNo")) );
				}
				
				if ( favoriteRegions.endsWith(",") )
					favoriteRegions = favoriteRegions.substring(0, favoriteRegions.length() - 1 );
			}
			
			request.setAttribute("newsList", list);
			
			request.setAttribute("favoriteRegions", favoriteRegions);
		}
		catch( Exception ex )
		{
			
		}
		
		model.addAttribute("cities", bigCities );
		model.addAttribute("items", items );
		
		return new ModelAndView("news/list", model);
	}
	
	@SuppressWarnings("unused")
	@RequestMapping( value ="/news/favoriteRegion.do")
	public ModelAndView favoriteRegion ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		ArrayList items = new ArrayList();
		ArrayList bigCities = new ArrayList();
		try
		{
			bigCities = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.news.getBigCities");
			
			for ( int i = 0; i < bigCities.size(); i++ )
			{
				HashMap region = (HashMap) bigCities.get(i);
				ArrayList regionList = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.news.getRegionByParent", region.get("regionNo"));
				
				HashMap parentRegion = new HashMap();
				parentRegion.put("regionNo", region.get("regionNo") );
				parentRegion.put("regionName", region.get("regionName") );
				parentRegion.put("hostURL", region.get("hostURL") );
				parentRegion.put("useYN", region.get("useYN") );
				
				regionList.add(0, parentRegion);
				
				region.put("regionList", regionList);
			}
			
			List list = (List) sqlSession.selectList("com.tessoft.nearhere.news.getFavoriteRegionByUser", userID );
			String favoriteRegions = "";
			
			if ( list != null && list.size() > 0 )
			{
				for ( int i = 0; i < list.size(); i++ )
				{
					HashMap region = (HashMap) list.get(i);
					favoriteRegions += region.get("regionName") + ",";
				}
				
				if ( favoriteRegions.endsWith(",") )
					favoriteRegions = favoriteRegions.substring(0, favoriteRegions.length() - 1 );
			}
			
			request.setAttribute("favoriteRegions", favoriteRegions);
		}
		catch( Exception ex )
		{
			
		}
		
		model.addAttribute("cities", bigCities );
		model.addAttribute("items", items );
		
		return new ModelAndView("news/favoriteRegion", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/news/setFavoriteRegion.do")
	public ModelAndView setFavoriteRegion ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			String selectedRegionNo = request.getParameter("selectedRegionNo");
			String[] regions = selectedRegionNo.split("\\,");

			ArrayList ar = new ArrayList();
			
			for ( int i = 0; i < regions.length; i++ )
			{
				if ( !Util.isEmptyString( regions[i] ) )
				{
					HashMap map = new HashMap();
					map.put("userID", userID);
					map.put("regionNo", regions[i]);	
					ar.add(map);
				}
			}
			
			if ( !Util.isEmptyString(userID) && ar != null && ar.size() > 0 )
			{
				sqlSession.delete("com.tessoft.nearhere.news.deleteRegionByUser", userID );
				int result = sqlSession.insert("com.tessoft.nearhere.news.insertFavoriteRegion", ar );	
			}
		}
		catch( Exception ex )
		{
			
		}
		
		
		return new ModelAndView("news/redirect", model);
	}
}
