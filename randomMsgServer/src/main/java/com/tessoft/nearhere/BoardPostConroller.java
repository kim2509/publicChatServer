package com.tessoft.nearhere;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.Util;

import common.CafeBiz;
import common.CafeBoardPostBiz;
import common.RegionBiz;
import common.UserBiz;

@Controller
public class BoardPostConroller extends BaseController {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/boardPost/{boardNo}")
	public ModelAndView boardHome ( @PathVariable(value="boardNo") String boardNo , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			CafeBoardPostBiz cafeBoardPostBiz = CafeBoardPostBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("boardNo", boardNo);
			
			HashMap boardInfo = cafeBoardPostBiz.getCafeBoardInfo(param);
			model.addAttribute("boardInfo", boardInfo);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/board/" + boardNo, null , null , null, null );
		
		return new ModelAndView("board/boardHome", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/detail/{postNo}")
	public ModelAndView detail ( @PathVariable(value="postNo") String postNo , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("postNo", postNo);
			
			HashMap postInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostInfo(param);
			model.addAttribute("postInfo", postInfo);
			
			List<HashMap> contentList = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostContent(param);
			model.addAttribute("contentList", contentList);
			
			param.put("startIndex", "0");
			param.put("showCount", "5");
			List<HashMap> postReplyList = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostReplyList(param);
			model.addAttribute("postReplyList", postReplyList);
			
			String loginUserID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			model.addAttribute("loginUserID", loginUserID);
			
			param.put("userID", loginUserID);
			HashMap cafeUserInfo = CafeBiz.getInstance(sqlSession).getCafeUserInfo(param);
			
			String ownerYN = "N";
			String memberYN = "N";
			String memberType = "";
			if ( cafeUserInfo != null )
			{
				ownerYN = cafeUserInfo.get("ownerYN").toString();
				memberYN = cafeUserInfo.get("memberYN").toString();
				memberType = cafeUserInfo.get("memberType").toString();
			}
			
			model.addAttribute("ownerYN", ownerYN);
			model.addAttribute("memberYN", memberYN);
			model.addAttribute("memberType", memberType);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/cafe/boardPost/detail/" + postNo, null , null , null, null );
		
		return new ModelAndView("boardPost/detail", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/newBoardPost.do")
	public ModelAndView newBoardPost ( String boardNo, ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		String userID = "";
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("boardNo", boardNo);
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

			if ( userInfo != null )
			{
				model.addAttribute("loginUserID", Util.getStringFromHash(userInfo, "userID") );
				userID = Util.getStringFromHash(userInfo, "userID");
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/boardPost/newBoardPost.do", boardNo , userID , null , null );
		
		return new ModelAndView("boardPost/newBoardPost", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/newBoardPostReply.do")
	public ModelAndView newBoardPostReply ( String boardNo, ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		String userID = "";
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("boardNo", boardNo);
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

			if ( userInfo != null )
			{
				model.addAttribute("loginUserID", Util.getStringFromHash(userInfo, "userID") );
				userID = Util.getStringFromHash(userInfo, "userID");
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/boardPost/newBoardPostReply.do", boardNo , userID , null , null );
		
		return new ModelAndView("boardPost/newBoardPostReply", model);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping( value ="/boardPost/searchCafeBoard.do")
	public ModelAndView searchCafeBoard ( HttpServletRequest request, HttpServletResponse response , 
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
		
		insertHistory("/cafe/searchCafeBoard.do", userID , null , null, null );
		
		return new ModelAndView("boardPost/searchCafeBoard", model);
	}
}
