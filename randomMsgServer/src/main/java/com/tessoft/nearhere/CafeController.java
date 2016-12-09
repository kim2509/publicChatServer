package com.tessoft.nearhere;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.CafeBiz;
import common.RegionBiz;

@Controller
public class CafeController extends BaseController {

	// 관심지역 리스트
	List<String> favRegionNos = null;
	
	private boolean IsFavRegion( String userID, String regionInfo )
	{
		RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
		
		if ( regionInfo == null || "".equals( regionInfo ) ) return false;
		
		if ( favRegionNos == null )
			favRegionNos = regionBiz.getFavoriteRegionNoByUserID(userID);
		
		for ( int i = 0; i < favRegionNos.size(); i++ )
		{
			String[] regionList = regionInfo.split("\\|");
			for ( int j = 0; j < regionList.length; j++ )
			{
				if ( favRegionNos.get(i).equals(regionList[j]))
					return true;
			}
		}
		
		return false;
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/index.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> myCafeList = cafeBiz.getMyCafeList(userID);
			ArrayList<HashMap> favoriteCafeMeetingList = new ArrayList<HashMap>();
			List<HashMap> temp = cafeBiz.getUpcomingCafeMeetingList(userID);
			
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
			
			for ( int i = 0; i < temp.size(); i++ )
			{
				String regionNo = temp.get(i).get("regionNo").toString();
				String regionInfo = regionBiz.getRegionInfoByRegionNo(regionNo);
				
				if ( IsFavRegion(userID, regionInfo) )
					favoriteCafeMeetingList.add( temp.get(i) );
			}
			
			model.addAttribute("myCafeList", myCafeList);
			model.addAttribute("favoriteCafeMeetingList", favoriteCafeMeetingList);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/index.do", userID , null , null, null );
		
		return new ModelAndView("cafe/index", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/searchByName.do")
	public ModelAndView searchByName ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/searchByName.do", userID , null , null, null );
		
		return new ModelAndView("cafe/searchByName", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/searchByRegion.do")
	public ModelAndView searchByRegion ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/searchByRegion.do", userID , null , null, null );
		
		return new ModelAndView("cafe/searchByRegion", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/myCafeList.do")
	public ModelAndView myCafeList ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/mycafeList.do", userID , null , null, null );
		
		return new ModelAndView("cafe/myCafeList", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/moreFavoriteMeeting.do")
	public ModelAndView moreFavoriteMeeting ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/moreFavoriteMeeting.do", userID , null , null, null );
		
		return new ModelAndView("cafe/moreFavoriteMeeting", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/newCafe.do")
	public ModelAndView newCafe ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/newCafe.do", userID , null , null, null );
		
		return new ModelAndView("cafe/newCafe", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/newCafeResult.do")
	public ModelAndView newCafeResult ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/newCafeResult.do", userID , null , null, null );
		
		return new ModelAndView("cafe/newCafeResult", model);
	}
	
	@RequestMapping( value ="/cafe/{cafeName}")
	public ModelAndView cafeHome ( @PathVariable(value="cafeName") String cafeName , String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/" + cafeName, userID , null , null, null );
		
		return new ModelAndView("cafe/cafeHome", model);
	}
	
	@RequestMapping( value ="/cafe/terms.do")
	public ModelAndView terms ( String userID, String name, String version, ModelMap model ) throws IOException
	{
		String pageName = "";
		
		try
		{
			if ( "normal".equals( name ) )
				pageName = "cafe_terms";
			else if ( "personal_info".equals(name))
				pageName = "cafe_personal_info_terms";
			
			if ( "1.0".equals( version ) )
				pageName += "_" + version;
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/" + pageName, userID , null , null, null );
		
		return new ModelAndView("legal_terms/" + pageName, model);
	}
}
