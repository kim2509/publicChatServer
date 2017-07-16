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
import common.CafeBoardPostBiz;
import common.CafeMemberBiz;
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
				List<HashMap> myFavRegionList = RegionBiz.getInstance(sqlSession).getFavoriteRegionNoByUserID(userID);
				
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
				model.addAttribute("loginUserID", userID);
				model.addAttribute("loginUserType", Util.getStringFromHash(userInfo, "type"));
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/index.do", userID , null , null, null );
		
		return new ModelAndView("cafe/index", model);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/searchCafe.do")
	public ModelAndView searchCafe ( HttpServletRequest request, HttpServletResponse response , 
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
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/moreCafePublicMeetingList.do")
	public ModelAndView moreCafePublicMeetingList ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
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
		
		insertHistory("/cafe/moreCafePublicMeetingList.do", null , null , null, null );
		
		return new ModelAndView("cafe/moreCafePublicMeetingList", model);
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
			model.addAttribute("cafeID", cafeID );
			
			if ( cafeMainInfo != null )
			{
				model.addAttribute("cafeMainInfo", cafeMainInfo);
				
				List<HashMap> cafePublicMeetingList = cafeBiz.getCafePublicMeetingListByCafeID(cafeMainInfoParam);
				
				RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
				
				for ( int i = 0; i < cafePublicMeetingList.size(); i++ )
				{
					if ( !Util.isEmptyString(cafePublicMeetingList.get(i).get("regionNo")) )
					{
						String regionNo = cafePublicMeetingList.get(i).get("regionNo").toString();
						cafePublicMeetingList.get(i).put("regionName", regionBiz.getFullRegionNameByRegionNo(regionNo));	
					}
					else
					{
						cafePublicMeetingList.get(i).put("regionName", "");
					}
				}
				
				model.addAttribute("cafePublicMeetingList", cafePublicMeetingList);
				model.addAttribute("totalCafeMeetingCount", cafeBiz.getTotalCafeMeetingCountByCafeID(cafeMainInfoParam));
				model.addAttribute("upcomingCafePublicMeetingCount", cafeBiz.getUpcomingCafePublicMeetingCount(cafeMainInfoParam));
				
				List<HashMap> cafeMemberList = CafeMemberBiz.getInstance(sqlSession).getCafeMemberList(cafeMainInfoParam);
				model.addAttribute("cafeMemberList", cafeMemberList);
				
				String cafeMemberCount = CafeMemberBiz.getInstance(sqlSession).getCafeMemberCount(cafeMainInfoParam);
				model.addAttribute("cafeMemberCount", cafeMemberCount);
				
				HashMap tmp = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

				if ( tmp != null )
				{
					tmp.put("cafeID", cafeID);
					model.addAttribute("cafeUserInfo", CafeBiz.getInstance(sqlSession).getCafeUserInfo(tmp) );
				}	
				
				String loginUserID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
				model.addAttribute("loginUserID", loginUserID);
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/" + cafeID, null , null , null, null );
		
		return new ModelAndView("cafe/cafeHome", model);
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
	public ModelAndView meetingDetail ( String cafeID , String meetingNo, ModelMap model,
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
			
			String loginUserID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			model.addAttribute("loginUserID", loginUserID);
			
			HashMap cafeMainInfo = cafeBiz.getCafeMainInfo(param);
			model.addAttribute("cafeMainInfo", cafeMainInfo);
			param.put("userID", loginUserID);
			model.addAttribute("cafeUserInfo", CafeBiz.getInstance(sqlSession).getCafeUserInfo(param) );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/meetingDetail.do", cafeID , meetingNo , null , null );
		
		return new ModelAndView("cafe/meetingDetail", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/manage.do")
	public ModelAndView manage ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID ) 
	{
		String userID = "";
		
		try
		{
			if ( !CafeBiz.getInstance(sqlSession).isCafeManager(cafeID, userToken) )
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
		}
		catch( Exception ex )
		{
			
		}
		
		insertHistory("/cafe/manage.do", userID , null , null, null );
		
		return new ModelAndView("cafe/manage", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/manageBoard.do")
	public ModelAndView manageBoard ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID ) 
	{
		String userID = "";
		
		try
		{
			if ( !CafeBiz.getInstance(sqlSession).isCafeManager(cafeID, userToken) )
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
			
			if ( !Util.isEmptyString(cafeID) )
			{
				HashMap param = new HashMap();
				param.put("cafeID", cafeID);
				List<HashMap> boardList = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardList(param);
				model.addAttribute("cafeBoardListJSON", mapper.writeValueAsString(boardList));
			}
		}
		catch( Exception ex )
		{
			
		}
		
		insertHistory("/cafe/manageBoard.do", userID , null , null, null );
		
		return new ModelAndView("cafe/manageBoard", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/manageMember.do")
	public ModelAndView manageMember ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID ) 
	{
		String userID = "";
		
		try
		{
			if ( !CafeBiz.getInstance(sqlSession).isCafeManager(cafeID, userToken) )
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			
			HashMap param = new HashMap();
			param.put("cafeID", cafeID);
			param.put("userID", userInfo.get("userID") );

			List<HashMap> cafeMemberList = CafeMemberBiz.getInstance(sqlSession).getCafeMemberListForManage(param);
			model.addAttribute("cafeMemberListJSON", mapper.writeValueAsString(cafeMemberList) );
		}
		catch( Exception ex )
		{
			
		}
		
		insertHistory("/cafe/manageMember.do", userID , null , null, null );
		
		return new ModelAndView("cafe/manageMember", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/setLocation.do")
	public ModelAndView setLocation ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID ) 
	{
		String userID = "";
		
		try
		{
			if ( !CafeBiz.getInstance(sqlSession).isCafeManager(cafeID, userToken) )
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
		}
		catch( Exception ex )
		{
			
		}
		
		insertHistory("/cafe/setLocation.do", userID , null , null, null );
		
		return new ModelAndView("cafe/setLocation", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/moreCafeList.do")
	public ModelAndView moreCafeList ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
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
		
		insertHistory("/cafe/moreCafeList.do", null , null , null, null );
		
		return new ModelAndView("cafe/moreCafeList", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked"})
	@RequestMapping( value ="/cafe/makePublicMeeting.do")
	public ModelAndView makePublicMeeting ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID, String meetingNo ) 
	{
		String userID = "";
		
		try
		{
			if ( !CafeBiz.getInstance(sqlSession).isCafeManager(cafeID, userToken) )
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
		}
		catch( Exception ex )
		{
			
		}
		
		insertHistory("/cafe/makePublicMeeting.do", userID , null , null, null );
		
		return new ModelAndView("cafe/makePublicMeeting", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/moreCafeMeetingList.do")
	public ModelAndView moreCafeMeetingList ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID )
	{
		try
		{
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("cafeID", cafeID);
			HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
			model.addAttribute("cafeMainInfo", cafeMainInfo);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/moreCafeMeetingList.do", null , null , null, null );
		
		return new ModelAndView("cafe/cafeMeetingList", model);
	}
	
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/moreCafeMemberList.do")
	public ModelAndView moreCafeMemberList ( HttpServletRequest request, HttpServletResponse response , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken, String cafeID )
	{
		try
		{
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("cafeID", cafeID);
			HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
			model.addAttribute("cafeMainInfo", cafeMainInfo);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/moreCafeMemberList.do", null , null , null, null );
		
		return new ModelAndView("cafe/moreCafeMemberList", model);
	}
}
