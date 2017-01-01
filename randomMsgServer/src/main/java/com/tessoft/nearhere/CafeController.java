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

@Controller
public class CafeController extends BaseController {

	private boolean IsFavRegion( String userID, String regionInfo )
	{
		RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
		
		if ( regionInfo == null || "".equals( regionInfo ) ) return false;
	
		// 관심지역 리스트
		List<String> favRegionNos = regionBiz.getFavoriteRegionNoByUserID(userID);
		
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
			
			// 내 카페 리스트
			List<HashMap> myCafeList = cafeBiz.getMyCafeList(userID);
			model.addAttribute("myCafeList", myCafeList);
			
			
			ArrayList<HashMap> favoriteCafeMeetingList = new ArrayList<HashMap>();
			List<HashMap> temp = cafeBiz.getUpcomingCafeMeetingList(userID);
			
			RegionBiz regionBiz = RegionBiz.getInstance(sqlSession);
			
			for ( int i = 0; i < temp.size(); i++ )
			{
				String regionNo = temp.get(i).get("regionNo").toString();
				String regionInfo = regionBiz.getRegionInfoByRegionNo(regionNo);
				
				if ( IsFavRegion(userID, regionInfo) )
				{
					temp.get(i).put("regionName", regionBiz.getFullRegionNameByRegionNo(regionNo));
					favoriteCafeMeetingList.add( temp.get(i) );
				}
			}
			
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
	
	@RequestMapping( value ="/cafe/makeCafe.do")
	public @ResponseBody APIResponse makeCafe(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			String userID = info.get("userID").toString();
			String cafeName = info.get("cafeName").toString();
			String cafeID = info.get("cafeID").toString();
			
			if ("".equals(userID))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 아이디가 올바르지 않습니다.");
			}
			
			if ("".equals(cafeName))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("카페 이름을 입력해 주십시오.");
			}
			
			if ("".equals(cafeID))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("카페 아이디를 입력해 주십시오.");
			}
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			int dbResult = cafeBiz.makeCafe(info);
			info.put("dbResult", String.valueOf( dbResult ));
			
			response.setData(info);
			
			insertHistory("/cafe/makeCafe.do", userID , cafeName , cafeID, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 아이디가 중복됩니다.\r\n다시 한번 확인해 주시기 바랍니다.");
			
			insertHistory("/cafe/makeCafe.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/{cafeID}")
	public ModelAndView cafeHome ( @PathVariable(value="cafeID") String cafeID , String userID, ModelMap model ) throws IOException
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
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/" + cafeID, userID , null , null, null );
		
		return new ModelAndView("cafe/cafeHome", model);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/getCafeBoardListAjax.do")
	public @ResponseBody APIResponse getCafeBoardListAjax(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			String userID = info.get("userID").toString();
			String cafeID = info.get("cafeID").toString();
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> cafeBoardList = cafeBiz.getCafeBoardList(info);
			
			response.setData(cafeBoardList);
			
			insertHistory("/cafe/getCafeBoardListAjax.do", userID , cafeID , null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg( ex.getMessage() );
			
			insertHistory("/cafe/makeCafe.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/getCafeBoardImagePostListAjax.do")
	public @ResponseBody APIResponse getCafeBoardImagePostListAjax(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyString(info.get("cafeID")))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("카페 아이디가 올바르지 않습니다.");
			}
			else if ( Util.isEmptyString(info.get("startIndex")))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("startIndex 가 올바르지 않습니다.");
			}
			else if ( Util.isEmptyString(info.get("showCount")))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("조회 갯수가 올바르지 않습니다.");
			}
			else
			{
				String cafeID = info.get("cafeID").toString();
				String boardNo = null;
				if ( !Util.isEmptyString( info.get("boardNo") ) )
					boardNo = info.get("boardNo").toString();
				
				String startIndex = info.get("startIndex").toString();
				String showCount = info.get("showCount").toString();
				
				CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
				List<HashMap> boardList = cafeBiz.getCafeBoardList(info);
				List<HashMap> postList = cafeBiz.getCafeBoardPostImageList(info);
				int totalCount = cafeBiz.getCafeBoardPostImageCount(info);
				
				HashMap resultData = new HashMap();
				resultData.put("boardList", boardList);
				resultData.put("postList", postList);
				resultData.put("totalCount", totalCount );
				resultData.put("startIndex", startIndex );
				resultData.put("showCount", showCount );
				
				response.setData(resultData);
				
				insertHistory("/cafe/getCafeBoardImagePostListAjax.do", cafeID , boardNo , startIndex, showCount );
			}
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg( ex.getMessage() );
			
			insertHistory("/cafe/getCafeBoardImagePostListAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/cafe/board/{boardNo}")
	public ModelAndView boardHome ( @PathVariable(value="boardNo") String boardNo , String userID, ModelMap model ) throws IOException
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
		
		insertHistory("/board/" + boardNo, userID , null , null, null );
		
		return new ModelAndView("board/boardHome", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/boardPost/detail/{postNo}")
	public ModelAndView detail ( @PathVariable(value="postNo") String postNo , String userID, ModelMap model ) throws IOException
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
		
		insertHistory("/cafe/boardPost/detail/" + postNo, userID , null , null, null );
		
		return new ModelAndView("boardPost/detail", model);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/boardPost/getMoreRepliesAjax.do")
	public @ResponseBody APIResponse getMoreReplies(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			String postNo = info.get("postNo").toString();
			String startIndex = info.get("startIndex").toString();
			String showCount = info.get("showCount").toString();
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> replyList = cafeBiz.getCafeBoardPostReplyList(info);
			
			response.setData(replyList);
			
			insertHistory("/cafe/getMoreRepliesAjax.do", postNo , startIndex , showCount, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg( ex.getMessage() );
			
			insertHistory("/cafe/makeCafe.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/meetingDetail.do")
	public ModelAndView meetingDetail ( String cafeID , String meetingNo, String userID, ModelMap model ) throws IOException
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
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/joinCafeMeeting.do")
	public @ResponseBody APIResponse joinCafeMeeting(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			String meetingNo = param.get("meetingNo").toString();
			String userID = param.get("userID").toString();
			String joinYN = param.get("joinYN").toString();
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			
			int result = 0;
			
			if ("Y".equals( joinYN ) )
				result = cafeBiz.insertCafeMeeting(param);
			else if ("N".equals( joinYN ) )
				result = cafeBiz.deleteCafeMeeting(param);
			
			response.setData(result);
			
			insertHistory("/cafe/joinCafeMeeting.do", meetingNo , userID , null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg( ex.getMessage() );
			
			insertHistory("/cafe/joinCafeMeeting.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
}
