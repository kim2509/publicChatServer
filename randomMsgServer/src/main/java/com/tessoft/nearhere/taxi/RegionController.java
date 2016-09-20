package com.tessoft.nearhere.taxi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegionController extends BaseController{

	@SuppressWarnings("unused")
	@RequestMapping( value ="/region/favoriteRegion.do")
	public ModelAndView favoriteRegion ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		ArrayList items = new ArrayList();
		ArrayList bigCities = new ArrayList();
		try
		{
			bigCities = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.region.getBigCities");
			
			for ( int i = 0; i < bigCities.size(); i++ )
			{
				HashMap region = (HashMap) bigCities.get(i);
				ArrayList regionList = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.region.getRegionByParent", region.get("regionNo"));
				
				HashMap parentRegion = new HashMap();
				parentRegion.put("regionNo", region.get("regionNo") );
				parentRegion.put("regionName", region.get("regionName") );
				parentRegion.put("hostURL", region.get("hostURL") );
				parentRegion.put("useYN", region.get("useYN") );
				
				regionList.add(0, parentRegion);
				
				region.put("regionList", regionList);
			}
			
			List list = (List) sqlSession.selectList("com.tessoft.nearhere.region.getFavoriteRegionByUser", userID );
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
		
		return new ModelAndView("region/favoriteRegion", model);
	}
	
}
