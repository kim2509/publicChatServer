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
import common.UserBiz;

@Controller
public class BoardPostConroller extends BaseController {

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
}
