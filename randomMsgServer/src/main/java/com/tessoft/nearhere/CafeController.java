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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.User;

import common.CafeBiz;
import common.RegionBiz;
import common.UserBiz;

@Controller
public class CafeController extends BaseController {

	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/index.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken ) 
	{
		String userID = "";
		
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

			if ( userInfo != null )
			{
				userID = userInfo.get("userID").toString();
				// 내 카페 리스트
				List<HashMap> myCafeList = cafeBiz.getMyCafeList(userID);
				model.addAttribute("myCafeList", myCafeList);
				
				List<HashMap> favoriteCafeMeetingList = cafeBiz.getCafeMeetingsInMyFavRegion(userID);
				
				for ( int i = 0; i < favoriteCafeMeetingList.size(); i++ )
				{
					String regionName = "";

					if ( !Util.isEmptyString(favoriteCafeMeetingList.get(i).get("lRegionName") ))
						regionName += favoriteCafeMeetingList.get(i).get("lRegionName").toString();
					if ( !Util.isEmptyString(favoriteCafeMeetingList.get(i).get("mRegionName") ))
						regionName += " " + favoriteCafeMeetingList.get(i).get("mRegionName").toString();
					if ( !Util.isEmptyString(favoriteCafeMeetingList.get(i).get("sRegionName") ))
						regionName += " " + favoriteCafeMeetingList.get(i).get("sRegionName").toString();
					if ( !Util.isEmptyString(favoriteCafeMeetingList.get(i).get("tRegionName") ))
						regionName += " " + favoriteCafeMeetingList.get(i).get("tRegionName").toString();
					
					favoriteCafeMeetingList.get(i).put("regionName", regionName);
				}
				
				model.addAttribute("favoriteCafeMeetingList", favoriteCafeMeetingList);
				model.addAttribute("favoriteCafeMeetingsJSON", mapper.writeValueAsString(favoriteCafeMeetingList));
			}
			
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/index.do", userID , null , null, null );
		
		return new ModelAndView("cafe/index", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/searchCafe.do")
	public ModelAndView searchByName ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			List<HashMap> bigCities = RegionBiz.getInstance(sqlSession).getBigCities();
			model.addAttribute("cities", bigCities);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/searchCafe.do", userID , null , null, null );
		
		return new ModelAndView("cafe/searchCafe", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/cafe/myCafeList.do")
	public ModelAndView myCafeList ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		try
		{
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/mycafeList.do", userToken , null , null, null );
		
		return new ModelAndView("cafe/myCafeList", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/moreFavoriteMeeting.do")
	public ModelAndView moreFavoriteMeeting ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			
			if ( userInfo != null )
			{
				String userID = userInfo.get("userID").toString();
				List<HashMap> myFavRegionList = regionBiz.getFavoriteRegionNoByUserID(userID);
				
				for ( int i = 0; i < myFavRegionList.size(); i++ )
				{
					String regionName = "";

					if ( !Util.isEmptyString(myFavRegionList.get(i).get("lRegionName") ))
						regionName += myFavRegionList.get(i).get("lRegionName").toString();
					if ( !Util.isEmptyString(myFavRegionList.get(i).get("mRegionName") ))
						regionName += " " + myFavRegionList.get(i).get("mRegionName").toString();
					if ( !Util.isEmptyString(myFavRegionList.get(i).get("sRegionName") ))
						regionName += " " + myFavRegionList.get(i).get("sRegionName").toString();
					if ( !Util.isEmptyString(myFavRegionList.get(i).get("tRegionName") ))
						regionName += " " + myFavRegionList.get(i).get("tRegionName").toString();
					
					myFavRegionList.get(i).put("regionName", regionName);
				}
				
				model.addAttribute("myFavRegionList", myFavRegionList);
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/moreFavoriteMeeting.do", null , null , null, null );
		
		return new ModelAndView("cafe/moreFavoriteMeeting", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/newCafe.do")
	public ModelAndView newCafe ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/newCafe.do", null , null , null, null );
		
		return new ModelAndView("cafe/newCafe", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/newCafeResult.do")
	public ModelAndView newCafeResult ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/newCafeResult.do", null , null , null, null );
		
		return new ModelAndView("cafe/newCafeResult", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/{cafeID}")
	public ModelAndView cafeHome ( @PathVariable(value="cafeID") String cafeID , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			
			HashMap cafeMainInfoParam = new HashMap();
			cafeMainInfoParam.put("cafeID", cafeID);
			HashMap cafeMainInfo = cafeBiz.getCafeMainInfo(cafeMainInfoParam);
			
			model.addAttribute("cafeMainInfo", cafeMainInfo);
			
			List<HashMap> cafePublicMeetingList = cafeBiz.getCafePublicMeetingList(cafeMainInfoParam);
			
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
			
			for ( int i = 0; i < cafePublicMeetingList.size(); i++ )
			{
				String regionNo = cafePublicMeetingList.get(i).get("regionNo").toString();
				cafePublicMeetingList.get(i).put("regionName", regionBiz.getFullRegionNameByRegionNo(regionNo));
			}
			
			model.addAttribute("cafePublicMeetingList", cafePublicMeetingList);
			
			List<HashMap> cafeMemberList = cafeBiz.getCafeMemberList(cafeMainInfoParam);
			model.addAttribute("cafeMemberList", cafeMemberList);
			
			String cafeMemberCount = cafeBiz.getCafeMemberCount(cafeMainInfoParam);
			model.addAttribute("cafeMemberCount", cafeMemberCount);
			
			model.addAttribute("cafeID", cafeID );
			
			HashMap tmp = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

			if ( tmp != null )
			{
				tmp.put("cafeID", cafeID);
				model.addAttribute("cafeUserInfo", CafeBiz.getInstance(sqlSession).getCafeUserInfo(tmp) );
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/" + cafeID, null , null , null, null );
		
		return new ModelAndView("cafe/cafeHome", model);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/board/{boardNo}")
	public ModelAndView boardHome ( @PathVariable(value="boardNo") String boardNo , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("boardNo", boardNo);
			
			HashMap boardInfo = cafeBiz.getCafeBoardInfo(param);
			model.addAttribute("boardInfo", boardInfo);
			
			List<HashMap> boardPostList = cafeBiz.getBoardPostList(param);
			model.addAttribute("boardPostList", boardPostList);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/board/" + boardNo, null , null , null, null );
		
		return new ModelAndView("board/boardHome", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/boardPost/detail/{postNo}")
	public ModelAndView detail ( @PathVariable(value="postNo") String postNo , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("postNo", postNo);
			
			HashMap postInfo = cafeBiz.getCafeBoardPostInfo(param);
			model.addAttribute("postInfo", postInfo);
			
			List<HashMap> contentList = cafeBiz.getCafeBoardPostContent(param);
			model.addAttribute("contentList", contentList);
			
			param.put("startIndex", "0");
			param.put("showCount", "5");
			List<HashMap> postReplyList = cafeBiz.getCafeBoardPostReplyList(param);
			model.addAttribute("postReplyList", postReplyList);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/boardPost/detail/" + postNo, null , null , null, null );
		
		return new ModelAndView("boardPost/detail", model);
	}
	
	@RequestMapping( value ="/cafe/terms.do")
	public ModelAndView terms ( String userID, String name, String version, ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/meetingDetail.do")
	public ModelAndView meetingDetail ( String cafeID , String meetingNo, String userID, ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("cafeID", cafeID);
			param.put("meetingNo", meetingNo);
			
			HashMap meetingInfo = cafeBiz.getCafeMeetingInfo(param);
			model.addAttribute("meetingInfo", meetingInfo);
			
			List<HashMap> meetingMembers = cafeBiz.getCafeMeetingMembers(param);
			model.addAttribute("meetingMembers", meetingMembers);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/meetingDetail.do", cafeID , meetingNo , userID, null );
		
		return new ModelAndView("cafe/meetingDetail", model);
	}
}
