package com.tessoft.nearhere;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

import common.RegionBiz;
import common.UserBiz;

@Controller
public class RegionController extends BaseController{

	@SuppressWarnings("unused")
	@RequestMapping( value ="/region/favoriteRegion.do")
	public ModelAndView favoriteRegion ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		ArrayList items = new ArrayList();
		List bigCities = null;
		
		try
		{
			bigCities = RegionBiz.getInstance(sqlSession).getBigCities();
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		model.addAttribute("cities", bigCities );
		model.addAttribute("items", items );
		
		return new ModelAndView("region/favoriteRegion", model);
	}
	
	@RequestMapping( value ="/region/getRegionListByParentAjax.do")
	public @ResponseBody APIResponse getRegionListByParent( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			List regionList = null;
			
			if ( Util.isEmptyForKey(hash, "regionNo") )
				regionList = RegionBiz.getInstance(sqlSession).getBigCities();
			else
				regionList = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.region.getRegionByParent", hash.get("regionNo"));

			response.setData(regionList);

			logger.info( "[getRegionListByParent.do]" );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/region/getUserFavoriteRegionList.do")
	public @ResponseBody APIResponse getUserFavoriteRegionList( HttpServletRequest request, ModelMap model, @RequestBody String bodyString ,
			String userID, @CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap userInfo = new HashMap();
			
			if ( !Util.isEmptyString(userToken))
				userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			else if ( !Util.isEmptyString(userID))
				userInfo.put("userID", userID);
			
			getUserFavoriteRegionList(response, userInfo);

			logger.info( "[getUserFavoriteRegionList.do]" );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/region/insertUserFavoriteRegion.do")
	public @ResponseBody APIResponse insertUserFavoriteRegion( HttpServletRequest request, ModelMap model, @RequestBody String bodyString,
			String userID, @CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			HashMap userInfo = new HashMap();
			
			if ( !Util.isEmptyString(userToken))
				userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			else if ( !Util.isEmptyString(userID))
				userInfo.put("userID", userID);
			
			if ( userInfo != null )
			{
				hash.put("userID", userInfo.get("userID") );
				sqlSession.insert("com.tessoft.nearhere.region.insertUserFavoriteRegion", hash );
				getUserFavoriteRegionList(response, hash);	
			}

			logger.info( "[insertUserFavoriteRegion.do]" );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n기존에 추가된 지역인지 확인해주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	@RequestMapping( value ="/region/deleteUserFavoriteRegion.do")
	public @ResponseBody APIResponse deleteUserFavoriteRegion( HttpServletRequest request, ModelMap model, @RequestBody String bodyString,
			String userID, @CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			HashMap userInfo = new HashMap();
			
			if ( !Util.isEmptyString(userToken))
				userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			else if ( !Util.isEmptyString(userID))
				userInfo.put("userID", userID);
			
			if ( userInfo != null )
			{
				hash.put("userID", userInfo.get("userID") );
				sqlSession.delete("com.tessoft.nearhere.region.deleteUserFavoriteRegion", hash );
				getUserFavoriteRegionList(response, hash);	
			}

			logger.info( "[deleteUserFavoriteRegion.do]" );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}

	private void getUserFavoriteRegionList(APIResponse response, HashMap hash) {
		ArrayList regionList = (ArrayList) sqlSession.selectList("com.tessoft.nearhere.region.getFavoriteRegionByUser", hash );

		ArrayList resultData = new ArrayList();
		
		for ( int i = 0; i < regionList.size(); i++ ){
			
			HashMap region = (HashMap) regionList.get(i);
			
			String regionNo = region.get("regionNo1").toString();
			
			String address = "";
			
			int regionIndex = 1;
			while( region.get("regionName" + regionIndex ) != null )
				address = region.get("regionName" + regionIndex++ ).toString() + " " + address;
			
			HashMap item = new HashMap();
			item.put("regionNo",  regionNo );
			item.put("regionName",  address );
			resultData.add(item);
		}
		
		response.setData(resultData);
	}
	
	@RequestMapping( value ="/region/getFavoriteRegionInfo.do")
	public @ResponseBody APIResponse getFavoriteRegionInfo( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String regionNo = "";
			
			if ( !Util.isEmptyForKey(hash, "tRegionNo") )
				regionNo = hash.get("tRegionNo").toString();
			else if ( !Util.isEmptyForKey(hash, "sRegionNo") )
				regionNo = hash.get("sRegionNo").toString();
			else if ( !Util.isEmptyForKey(hash, "mRegionNo") )
				regionNo = hash.get("mRegionNo").toString();
			else if ( !Util.isEmptyForKey(hash, "lRegionNo") )
				regionNo = hash.get("lRegionNo").toString();

			HashMap param = new HashMap();
			param.put("regionNo", regionNo);
			param.put("userID", hash.get("userID"));
			
			HashMap result = sqlSession.selectOne("com.tessoft.nearhere.region.getFavoriteRegionInfo", param );
			response.setData( result );
			
			logger.info( "[isFavoriteRegionRegistered.do]" );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
}
