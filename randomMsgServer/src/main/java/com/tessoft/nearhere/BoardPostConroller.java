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

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;

import common.CafeBiz;
import common.CafeBoardPostBiz;
import common.RegionBiz;
import common.UserBiz;

@Controller
public class BoardPostConroller extends BaseController {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/boardPost/boardHome.do")
	public ModelAndView boardHome ( String boardNo , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken )
	{
		try
		{
			CafeBoardPostBiz cafeBoardPostBiz = CafeBoardPostBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("boardNo", boardNo);
			
			String loginUserID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", loginUserID);
			
			HashMap boardInfo = cafeBoardPostBiz.getCafeBoardInfo(param);
			model.addAttribute("boardInfo", boardInfo);
			String cafeID = Util.getStringFromHash(boardInfo, "cafeID");
			param.put("cafeID", cafeID);
			
			HashMap cafeUserInfo = CafeBiz.getInstance(sqlSession).getCafeUserInfo(param);
			model.addAttribute("cafeUserInfo", cafeUserInfo );
			
			String readPermission = Util.getStringFromHash(boardInfo, "readPermission");
			String ownerYN = Util.getStringFromHash(cafeUserInfo, "ownerYN");
			String memberType = Util.getStringFromHash(cafeUserInfo, "memberType");
			
			if ("1".equals(readPermission) && (!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType)))  // 운영진 이상
			{
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
			}
			else if ("2".equals(readPermission) && !"Y".equals(ownerYN) )  // 카페 주인만
			{
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
			}			
			else if ("3".equals(readPermission) && cafeUserInfo == null )  // 회원이상
			{
				return new ModelAndView("error", "errMsg", "고객님은 해당메뉴에 권한이 없습니다.");
			}
			
			HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
			model.addAttribute("cafeMainInfo", cafeMainInfo);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/board/" + boardNo, null , null , null, null );
		
		return new ModelAndView("board/boardHome", model);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/detail.do")
	public ModelAndView detail ( String postNo , ModelMap model,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		try
		{
			CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
			HashMap param = new HashMap();
			param.put("postNo", postNo);
			
			String loginUserID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			model.addAttribute("loginUserID", loginUserID);
			param.put("userID", loginUserID);
			
			// 조회 수 증가
			if ( !Util.isEmptyString(loginUserID) )
			{
				CafeBoardPostBiz.getInstance(sqlSession).insertCafeBoardPostHistory(param);
				CafeBoardPostBiz.getInstance(sqlSession).updateCafeBoardPostReadCount(param);	
			}
						
			HashMap postInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostInfo(param);
			model.addAttribute("postInfo", postInfo);
			
			List<HashMap> contentList = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostContent(param);
			model.addAttribute("contentList", contentList);
			
			param.put("startIndex", "0");
			param.put("showCount", "5");
			List<HashMap> postReplyList = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostReplyList(param);
			model.addAttribute("postReplyList", postReplyList);
			
			param.put("cafeID", Util.getStringFromHash(postInfo, "cafeID"));
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
			
			HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
			model.addAttribute("cafeMainInfo", cafeMainInfo);
			
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
			
			HashMap boardInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardInfo(param);
			model.addAttribute("boardInfo", boardInfo);

			param.put("cafeID", Util.getStringFromHash(boardInfo, "cafeID"));
			
			HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
			model.addAttribute("cafeMainInfo", cafeMainInfo);
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

			if ( userInfo != null )
			{
				model.addAttribute("loginUserID", Util.getStringFromHash(userInfo, "userID") );
				userID = Util.getStringFromHash(userInfo, "userID");
				param.put("userID", userID);
			}
			
			HashMap cafeUserInfo = CafeBiz.getInstance(sqlSession).getCafeUserInfo(param);
			model.addAttribute("cafeUserInfo", cafeUserInfo);
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
