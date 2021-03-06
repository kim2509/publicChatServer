package com.tessoft.nearhere;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

import common.CafeBiz;
import common.CafeBoardPostBiz;
import common.CafePushBiz;
import common.UserBiz;

@Controller
public class BoardPostAjaxController extends BaseController {
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/getRecentCafeBoardPostListAjax.do")
	public @ResponseBody APIResponse getRecentCafeBoardPostListAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap resultData = new HashMap();
			
			HashMap boardInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardInfo(param);
			resultData.put("boardInfo", boardInfo);
			
			List<HashMap> boardPostList = CafeBoardPostBiz.getInstance(sqlSession).getRecentCafeBoardPostList(param);
			resultData.put("boardPostList", boardPostList);
			
			response.setData( resultData );
			
			insertHistory("/boardPost/getRecentCafeBoardPostListAjax.do", userID , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("최신글 가져오는 도중 오류가 발생했습니다.");
			
			insertHistory("/boardPost/getRecentCafeBoardPostListAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/getCafeBoardPostNoticeListAjax.do")
	public @ResponseBody APIResponse getCafeBoardPostNoticeListAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap resultData = new HashMap();
			
			HashMap boardInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardInfo(param);
			resultData.put("boardInfo", boardInfo);
			
			List<HashMap> boardPostList = CafeBoardPostBiz.getInstance(sqlSession).getBoardPostNoticeList(param);
			resultData.put("boardPostList", boardPostList);
			
			response.setData( resultData );
			
			insertHistory("/boardPost/getCafeBoardPostNoticeListAjax.do", userID , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("게시글 가져오는 도중 오류가 발생했습니다.");
			
			insertHistory("/boardPost/getCafeBoardPostNoticeListAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/getCafeBoardPostListAjax.do")
	public @ResponseBody APIResponse getCafeBoardPostListAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap resultData = new HashMap();
			
			HashMap boardInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardInfo(param);
			resultData.put("boardInfo", boardInfo);
			
			List<HashMap> boardPostList = CafeBoardPostBiz.getInstance(sqlSession).getBoardPostList(param);
			resultData.put("boardPostList", boardPostList);
			
			response.setData( resultData );
			
			int totalItemCount = CafeBoardPostBiz.getInstance(sqlSession).getBoardPostListCount(param);
			
			response.setData2( totalItemCount );
			
			insertHistory("/boardPost/getCafeBoardPostListAjax.do", userID , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("게시글 가져오는 도중 오류가 발생했습니다.");
			
			insertHistory("/boardPost/getCafeBoardPostListAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
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
				HashMap cafeBoardInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardInfo(param);
				param.put("cafeID", Util.getStringFromHash(cafeBoardInfo, "cafeID"));
				HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
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
				
				if (!"Y".equals( Util.getStringFromHash(cafeMainInfo, "publishYN") ) &&
						!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType) )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("해당 카페는 비공개상태로 해당 기능이 제한되어있습니다.");
				}
				if ("N".equals(ownerYN) && "N".equals(memberYN) )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("글쓰기 권한이 없는 사용자입니다.");
				}
				else
				{
					String writePermission = Util.getStringFromHash(cafeBoardInfo, "writePermission");
					
					if ("1".equals(writePermission) && (!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType)))  // 운영진 이상
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

						CafeBiz.getInstance(sqlSession).handleLocation(param, "postLocation");
						
						int dbResult = 0;
						
						if ( Util.isEmptyForKey(param, "postNo") )
						{
							dbResult = cafeBoardPostBiz.insertCafeBoardPostMaster(param);
							dbResult = cafeBoardPostBiz.insertCafeBoardPostDetail(param);
						}
						else
						{
							dbResult = cafeBoardPostBiz.updateCafeBoardPostMaster(param);
							dbResult = cafeBoardPostBiz.updateCafeBoardPostDetail(param);
						}
						
						cafeBoardPostBiz.deleteCafeBoardPostImages(param);
						
						if ( param.get("imageList") != null )
						{
							List<HashMap> imageList = (List<HashMap>) param.get("imageList");
							for ( int i = 0; i < imageList.size(); i++ )
							{
								imageList.get(i).put("postNo", Util.getStringFromHash(param, "postNo"));
								cafeBoardPostBiz.insertCafeBoardPostDetail( imageList.get(i) );
								CafeBiz.getInstance(sqlSession).updateCafeImageAsCommitted(Util.getStringFromHash(imageList.get(i), "imageNo"));
							}
						}
						
						HashMap info = new HashMap();
						info.put("dbResult", String.valueOf( dbResult ));
						response.setData(info);
					}	
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
	public @ResponseBody APIResponse deleteBoardPostAjax(HttpServletRequest request, @RequestBody String bodyString,
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
			else if ( Util.isEmptyString(userID) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 정보가 올바르지 않습니다.");
			}
			else
			{
				HashMap postInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostInfo(param);
				
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
				
				if ("N".equals(ownerYN) && "N".equals(memberYN) )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("삭제 권한이 없는 사용자입니다.");
				}
				else
				{
					String writerUserID = Util.getStringFromHash(postInfo, "userID");
					
					if ( !userID.equals(writerUserID) && (!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType)))  // 운영진 이상
					{
						response.setResCode( ErrorCode.INVALID_INPUT );
						response.setResMsg("삭제 권한이 없는 사용자입니다.");
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/getCafeBoardPostInfoAjax.do")
	public @ResponseBody APIResponse getCafeBoardPostInfoAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			HashMap postInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostInfo(param);
			
			HashMap resultData = new HashMap();
			resultData.put("postInfo", postInfo);
			
			List<HashMap> contentList = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostContent(param);
			resultData.put("contentList", contentList);
			
			response.setData( resultData );
			
			insertHistory("/boardPost/getCafeBoardPostInfoAjax.do", userID , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("게시글 가져오는 도중 오류가 발생했습니다.");
			
			insertHistory("/boardPost/getCafeBoardPostInfoAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/saveCafeBoardPostReplyAjax.do")
	public @ResponseBody APIResponse saveCafeBoardPostReplyAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", userID);
			
			if ( Util.isEmptyForKey(param, "postNo") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyString(userID) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 정보가 올바르지 않습니다.");
			}
			else
			{
				HashMap cafeBoardInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardInfo(param);
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
				
				if ("N".equals(ownerYN) && "N".equals(memberYN) )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("글쓰기 권한이 없는 사용자입니다.");
				}
				else
				{
					String writePermission = Util.getStringFromHash(cafeBoardInfo, "writePermission");
					
					if ("1".equals(writePermission) && (!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType)))  // 운영진 이상
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
						dbResult = cafeBoardPostBiz.insertCafeBoardPostReply(param);
						cafeBoardPostBiz.increaseCafeBoardPostReplyCount(param);
						
						// 게시글 작성자와 댓글작성자에게 알림보내기
						CafePushBiz.getInstance(sqlSession).sendPushToBoardPostWriterNRepliers(param);
						
						HashMap info = new HashMap();
						info.put("dbResult", String.valueOf( dbResult ));
						response.setData(info);
					}
				}
				
				insertHistory("/cafe/saveCafeBoardPostReplyAjax.do", Util.getStringFromHash(param, "postNo") , null , null , null );
			}

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("댓글 저장 중 오류가 발생했습니다.");
			
			insertHistory("/cafe/saveCafeBoardPostReplyAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/deleteBoardPostReplyAjax.do")
	public @ResponseBody APIResponse deleteBoardPostReplyAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			param.put("userID", userID);
			
			if ( Util.isEmptyForKey(param, "replyNo") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else if ( Util.isEmptyString(userID) )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("사용자 정보가 올바르지 않습니다.");
			}
			else
			{
				HashMap replyInfo = CafeBoardPostBiz.getInstance(sqlSession).getCafeBoardPostReplyInfo(param);
				
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
				
				if ("N".equals(ownerYN) && "N".equals(memberYN) )
				{
					response.setResCode( ErrorCode.INVALID_INPUT );
					response.setResMsg("삭제 권한이 없는 사용자입니다.");
				}
				else
				{
					String writerUserID = Util.getStringFromHash(replyInfo, "userID");
					
					if ( !userID.equals(writerUserID) && (!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType)))  // 운영진 이상
					{
						response.setResCode( ErrorCode.INVALID_INPUT );
						response.setResMsg("삭제 권한이 없는 사용자입니다.");
					}
					else
					{
						CafeBoardPostBiz cafeBoardPostBiz = CafeBoardPostBiz.getInstance(sqlSession);
						int dbResult = cafeBoardPostBiz.deleteCafeBoardPostReply(param);
						cafeBoardPostBiz.decreaseCafeBoardPostReplyCount(param);
						HashMap info = new HashMap();
						info.put("dbResult", String.valueOf( dbResult ));
						response.setData(info);
					}
				}
			}
			
			insertHistory("/boardPost/deleteBoardPostReplyAjax.do", userID , null , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("댓글 삭제도중 오류가 발생했습니다.");
			
			insertHistory("/boardPost/deleteBoardPostReplyAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping( value ="/boardPost/deleteBoardImageAjax.do")
	public @ResponseBody APIResponse deleteBoardImageAjax(HttpServletRequest request, @RequestBody String bodyString,
			@CookieValue(value = "userToken", defaultValue = "") String userToken)
	{
		APIResponse response = new APIResponse();
		
		String userID = "";
		
		try
		{
			HashMap param = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			
			if ( Util.isEmptyForKey(param, "imageNo") )
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("요청값이 올바르지 않습니다.");
			}
			else
			{
				CafeBiz cafeBiz = CafeBiz.getInstance(sqlSession);
				
				HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
				
				int dbResult = 0;
				
				dbResult = cafeBiz.updateCafeImageAsDeleted( Util.getStringFromHash(param, "imageNo"));
				
				HashMap info = new HashMap();
				info.put("dbResult", String.valueOf( dbResult ));
				response.setData(info);
			}
			
			insertHistory("/cafe/deleteBoardImageAjax.do", userID , Util.getStringFromHash(param, "imageNo") , null , null );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("이미지 삭제도중 오류가 발생했습니다.");
			
			insertHistory("/cafe/deleteBoardImageAjax.do", null , null , null, "exception" );
			logger.error( ex );
		}
		
		return response;
	}
}
