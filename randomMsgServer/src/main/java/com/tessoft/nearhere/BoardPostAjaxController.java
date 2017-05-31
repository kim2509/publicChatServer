package com.tessoft.nearhere;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

import common.CafeBiz;
import common.CafeBoardPostBiz;
import common.UserBiz;

@Controller
public class BoardPostAjaxController extends BaseController {
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/saveCafeBoardPostAjax.do")
	public @ResponseBody APIResponse saveCafePublicMeetingAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", userID);
			
			if ( Util.isEmptyForKey(param, "boardNo") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "title") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("제목을 입력해 주십시오.");
			}
			else if ( Util.isEmptyString(userID) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 정보가 올바르지 않습니다.");
			}
			else
			{
				HashMap cafeBoardInfo = CafeBiz.getInstance(sqlSession).getCafeBoardInfo(param);
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
				
				String writePermission = Util.getStringFromHash(cafeBoardInfo, "writePermission");
				
				if ("1".equals(writePermission) && (!"Y".equals(ownerYN) && !"운영자".equals(memberType)))  // 운영진 이상
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("글쓰기 권한이 없는 사용자입니다.");
				}
				else if ("2".equals(writePermission) && !"Y".equals(ownerYN) )  // 카페 주인만
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("글쓰기 권한이 없는 사용자입니다.");
				}			
				else
				{
					CafeBoardPostBiz cafeBoardPostBiz = CafeBoardPostBiz.getInstance(sqlSession);
					
					int dbResult = 0;
					
					if ( Util.isEmptyForKey(param, "postNo") )
					{
						dbResult = cafeBoardPostBiz.insertCafeBoardPostMaster(param);
						dbResult = cafeBoardPostBiz.insertCafeBoardPostDetail(param);
					}
					
					HashMap info = new HashMap();
					info.put("dbResult", String.valueOf( dbResult ));
					response.setData(info);
				}
				
				insertHistory("/cafe/saveCafeBoardPostAjax.do", param.get("cafeID").toString() , null , null , null );
			}

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("게시글 저장 중 오류가 발생했습니다.");
			
			insertHistory("/cafe/saveCafeBoardPostAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/deleteBoardPostAjax.do")
	public @ResponseBody APIResponse deleteCafePublicMeetingAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", userID);
			
			if ( Util.isEmptyForKey(param, "boardNo") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyForKey(param, "title") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("제목을 입력해 주십시오.");
			}
			else if ( Util.isEmptyString(userID) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 정보가 올바르지 않습니다.");
			}
			else
			{
				HashMap cafeBoardInfo = CafeBiz.getInstance(sqlSession).getCafeBoardInfo(param);
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
				
				String writePermission = Util.getStringFromHash(cafeBoardInfo, "writePermission");
				
				if ("1".equals(writePermission) && (!"Y".equals(ownerYN) && !"운영자".equals(memberType)))  // 운영진 이상
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("글쓰기 권한이 없는 사용자입니다.");
				}
				else if ("2".equals(writePermission) && !"Y".equals(ownerYN) )  // 카페 주인만
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("글쓰기 권한이 없는 사용자입니다.");
				}			
				else
				{
					CafeBoardPostBiz cafeBiz = CafeBoardPostBiz.getInstance(sqlSession);
					int dbResult = cafeBiz.deleteCafeBoardPost(param);
					
					HashMap info = new HashMap();
					info.put("dbResult", String.valueOf( dbResult ));
					response.setData(info);
				}
			}
			
			insertHistory("/boardPost/deleteBoardPostAjax.do", userID , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("게시글 삭제도중 오류가 발생했습니다.");
			
			insertHistory("/boardPost/deleteBoardPostAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
}
