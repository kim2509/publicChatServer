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
public class CafeAjaxController extends BaseController {
	

	@RequestMapping( value ="/cafe/makeCafeAjax.do")
	public @ResponseBody APIResponse makeCafeAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			if ( userInfo != null )
			{
				userID = userInfo.get("userID").toString();
			}
			
			HashMap info = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			String cafeName = info.get("cafeName").toString();
			String cafeID = info.get("cafeID").toString();
			
			if ( Util.isEmptyString(userID))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 아이디가 올바르지 않습니다.");
			}
			
			info.put("userID", userID);
			
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
			
			insertHistory("/cafe/getCafeMeetingsByRegionAjax.do", null , null , null, "exception" );
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
			
			insertHistory("/cafe/getCafeBoardListAjax.do", null , null , null, "exception" );
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
			
			insertHistory("/cafe/getMoreRepliesAjax.do", null , null , null, "exception" );
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
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/searchCafeAjax.do")
	public @ResponseBody APIResponse searchCafeAjax(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String keyword = param.get("keyword").toString();
			String level = param.get("level").toString();
			String regionNo = param.get("regionNo").toString();
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> cafeMeetings = cafeBiz.searchCafe(param);
			response.setData(cafeMeetings);
			response.setData2( cafeBiz.searchCafeCount(param) );
			
			insertHistory("/cafe/searchCafeAjax.do", keyword , level , regionNo, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/searchCafeAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/searchCafePostsAjax.do")
	public @ResponseBody APIResponse searchCafePostsAjax(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String keyword = param.get("keyword").toString();
			String level = param.get("level").toString();
			String regionNo = param.get("regionNo").toString();
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			List<HashMap> cafeMeetings = cafeBiz.searchCafePosts(param);
			response.setData(cafeMeetings);
			response.setData2( cafeBiz.searchCafePostsCount(param) );
			
			insertHistory("/cafe/searchCafePostsAjax.do", keyword , level , regionNo, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/searchCafePostsAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	

	@RequestMapping( value ="/cafe/cafeMainInfoAjax.do")
	public @ResponseBody APIResponse cafeMainInfoAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}

			HashMap info = new HashMap();
			info.put("cafeMainInfo", CafeBiz.getInstance(sqlSession).getCafeMainInfo(param) );
			response.setData(info);
			
			insertHistory("/cafe/cafeMainInfoAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 게시판 생성도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/cafeMainInfoAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/cafe/createBoardAjax.do")
	public @ResponseBody APIResponse createBoardAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
				
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			int dbResult = cafeBiz.insertCafeBoard(param);
			
			HashMap info = new HashMap();
			info.put("boardList", cafeBiz.getCafeBoardList(param) );
			info.put("dbResult", String.valueOf( dbResult ));
			
			response.setData(info);
			
			insertHistory("/cafe/createBoardAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 게시판 생성도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/createBoardAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/cafe/modifyBoardAjax.do")
	public @ResponseBody APIResponse modifyBoardAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
				
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			int dbResult = cafeBiz.modifyCafeBoard(param);
			
			HashMap info = new HashMap();
			info.put("boardList", cafeBiz.getCafeBoardList(param) );
			info.put("dbResult", String.valueOf( dbResult ));
			
			response.setData(info);
			
			insertHistory("/cafe/modifyBoardAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 게시판 수정도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/makeCafe.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/cafe/deleteBoardAjax.do")
	public @ResponseBody APIResponse deleteBoardAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
				
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			int dbResult = cafeBiz.deleteCafeBoard(param);
			
			HashMap info = new HashMap();
			info.put("boardList", cafeBiz.getCafeBoardList(param) );
			info.put("dbResult", String.valueOf( dbResult ));
			
			response.setData(info);
			
			insertHistory("/cafe/deleteBoardAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 게시판 생성도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/makeCafe.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/cafe/getCafeMembersForManageAjax.do")
	public @ResponseBody APIResponse getCafeMembersForManageAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
			
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			
			HashMap info = new HashMap();
			
			HashMap tmp = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
			tmp.put("cafeID", param.get("cafeID"));
			tmp.put("startIndex", param.get("startIndex"));
			tmp.put("showCount", param.get("showCount"));
			
			info.put("memberList", cafeBiz.getCafeMemberListForManage(tmp) );
			info.put("TotalMembersCount", cafeBiz.getCafeMemberCount(tmp) );
			
			response.setData(info);
			
			insertHistory("/cafe/getCafeMembersForManageAjax.do", param.get("cafeID").toString() , null , null, null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("처리도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/getCafeMembersForManageAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/updateCafeMemberTypeAjax.do")
	public @ResponseBody APIResponse updateCafeMemberTypeAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "userID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "memberType") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
			else
			{
				CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
				int dbResult = cafeBiz.updateCafeMemberType(param);
				
				HashMap info = new HashMap();
				
				HashMap tmp = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
				tmp.put("cafeID", param.get("cafeID"));
				info.put("dbResult", String.valueOf( dbResult ));
				response.setData(info);
			}
			
			insertHistory("/cafe/updateCafeMemberTypeAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 멤버 권한 업데이트 도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/updateCafeMemberTypeAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/deleteCafeMemberAjax.do")
	public @ResponseBody APIResponse deleteCafeMemberAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "userID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
			else
			{
				CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
				int dbResult = cafeBiz.updateCafeAsDeleted(param);
				
				HashMap info = new HashMap();
				
				HashMap tmp = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
				tmp.put("cafeID", param.get("cafeID"));
				info.put("dbResult", String.valueOf( dbResult ));
				response.setData(info);
			}
			
			insertHistory("/cafe/deleteCafeMemberAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 멤버 탈퇴 도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/deleteCafeMemberAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/cafe/saveCafeInfoAjax.do")
	public @ResponseBody APIResponse saveCafeInfoAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeManager( param.get("cafeID").toString() , userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 대해 권한이 없습니다.");
			}
			else
			{
				CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
				int dbResult = cafeBiz.updateCafeInfo(param);
				
				HashMap info = new HashMap();
				
				HashMap tmp = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
				tmp.put("cafeID", param.get("cafeID"));
				info.put("dbResult", String.valueOf( dbResult ));
				response.setData(info);
			}
			
			insertHistory("/cafe/saveCafeInfoAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 정보 저장중 오류가 발생했습니다.");
			
			insertHistory("/cafe/safeCafeInfoAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/cafe/deleteCafeAjax.do")
	public @ResponseBody APIResponse deleteCafeAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( Util.isEmptyForKey(param, "cafeID") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( !CafeBiz.getInstance(sqlSession).isCafeOwner( param.get("cafeID").toString(), userToken) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("고객님은 해당메뉴에 권한이 없습니다.");
			}

			int dbResult = CafeBiz.getInstance(sqlSession).deleteCafe(param);
			HashMap info = new HashMap();
			info.put("dbResult", String.valueOf( dbResult ));
			response.setData(info);
			
			insertHistory("/cafe/deleteCafeAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 삭제도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/deleteCafeAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
}
