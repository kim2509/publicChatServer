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
public class CafeAjaxController extends BaseController {
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/getCafeMeetingsByRegionAjax.do")
	public @ResponseBody APIResponse getCafeMeetingsByRegionAjax(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String level = param.get("level").toString();
			String regionNo = param.get("regionNo").toString();
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> cafeMeetings = cafeBiz.getCafeMeetingsByRegion(param);
			response.setData(cafeMeetings);
			response.setData2( cafeBiz.getTotalCafeMeetingsCountByRegion(param) );
			
			insertHistory("/cafe/getCafeMeetingsByRegionAjax.do", level , regionNo , null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/makeCafe.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
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
