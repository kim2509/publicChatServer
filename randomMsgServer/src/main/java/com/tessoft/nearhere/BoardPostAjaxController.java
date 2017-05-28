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
			
			HashMap cafeBoardInfo = CafeBiz.getInstance(sqlSession).getCafeBoardInfo(param);
			HashMap cafeUserInfo = CafeBiz.getInstance(sqlSession).getCafeUserInfo(param);
			
			String writePermission = Util.getStringFromHash(cafeBoardInfo, "writePermission");
			
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
			else
			{
				CafeBoardPostBiz cafeBoardPostBiz = CafeBoardPostBiz.getInstance(sqlSession);
				
				int dbResult = 0;
				
				if ( Util.isEmptyForKey(param, "postNo") )
				{
					cafeBoardPostBiz.insertCafeBoardPostMaster(param);
				}
				
				HashMap info = new HashMap();
				info.put("dbResult", String.valueOf( dbResult ));
				response.setData(info);
			}
			
			insertHistory("/cafe/saveCafePublicMeetingAjax.do", param.get("cafeID").toString() , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("카페 정보 저장중 오류가 발생했습니다.");
			
			insertHistory("/cafe/saveCafePublicMeetingAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
}
