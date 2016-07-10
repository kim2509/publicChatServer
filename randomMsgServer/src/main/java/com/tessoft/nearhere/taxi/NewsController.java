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

	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/news/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
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
			else
			{
				HashMap region = new HashMap();
				region.put("regionNo", "40");
				region.put("regionName", "서울");
				region.put("news", sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", "40" ));
				list.add(region);
				
				region = new HashMap();
				region.put("regionNo", "18");
				region.put("regionName", "경기도");
				region.put("news", sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", "18" ));
				list.add(region);
			}
			
			request.setAttribute("newsList", list);
			request.setAttribute("favoriteRegions", favoriteRegions);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
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
			logger.error( ex );
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
			
			if ( !Util.isEmptyString(userID) )
			{
				sqlSession.delete("com.tessoft.nearhere.news.deleteRegionByUser", userID );
				
				if ( ar != null && ar.size() > 0 )
				{
					int result = sqlSession.insert("com.tessoft.nearhere.news.insertFavoriteRegion", ar );	
				}
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		
		return new ModelAndView("news/redirect", model);
	}
}
