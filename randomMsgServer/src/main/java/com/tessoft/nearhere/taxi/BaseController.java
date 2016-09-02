package com.tessoft.nearhere.taxi;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dy.common.Constants;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.User;
import com.nearhere.domain.UserPushMessage;

@Controller
public class BaseController {

	@Autowired
	public SqlSession sqlSession;
	protected static Logger logger = Logger.getLogger(BaseController.class.getName());
	ObjectMapper mapper = null;
	
	public BaseController()
	{
		mapper = new ObjectMapper();
	}
	
	private SecureRandom random = new SecureRandom();
	
	protected String getLogIdentifier() {
		return new BigInteger(130, random).toString(32);
	}
	
	public static String makeUrl(HttpServletRequest request)
	{
		return request.getRequestURL().toString() + "?" + request.getQueryString();
	}
	
	protected String requestLogging(HttpServletRequest request, String bodyString) {
		
		String logIdentifier = "";
		
		try
		{
			logIdentifier = getLogIdentifier();
			logger.info( "REQUEST URL [" + request.getRemoteAddr() + "][" + logIdentifier + "]:" + makeUrl( request ) );
			logger.info( "REQUEST[" + logIdentifier + "]:" + bodyString );	
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return logIdentifier;
	}

	protected User selectUser(User user) {
		user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
		return user;
	}
	
	protected void sendPushMessage( User receiver, String type, String msg, String param, boolean bSendPush ) throws Exception
	{
		try
		{
			logger.info( "sendPushMessage[" + bSendPush + "]: " + mapper.writeValueAsString(receiver) );

			receiver = selectUser(receiver);

			UserPushMessage pushMessage = new UserPushMessage();
			pushMessage.setToUserID( receiver.getUserID() );
			pushMessage.setType(type);
			if ( "message".equals( type ) )
				pushMessage.setMessage("메시지가 도착하였습니다.");
			else if ( "postReply".equals( type ) )
				pushMessage.setMessage("댓글이 등록되었습니다.");
			else if ("newPostByDistance".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("event".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("eventssl".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("inquiryUser".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("locationUpdate".equals( type ) )
				pushMessage.setMessage( msg );

			pushMessage.setParam1(param);
			
			int result = 0;
			
			if ( !"locationUpdate".equals( type ) )
			{
				result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );
				logger.info( "insertUserPushMessage result : " + result );
			}

			if ( bSendPush )
			{
				Sender sender = new Sender( Constants.GCM_API_KEY );

				Message message = null;

				if ( !Util.isEmptyString( receiver.getRegID() ) )
				{
					if ( "message".equals( type ) )
					{
						message = new Message.Builder().addData("title", pushMessage.getMessage() )
								.addData("message",  msg )
								.addData("type",  type )
								.addData("toUserID",  receiver.getUserID() )
								.addData("fromUserID",  param )
								.build();	
					}
					else if ( "postReply".equals( type ) )
					{
						message = new Message.Builder().addData("title", pushMessage.getMessage() )
								.addData("message",  msg )
								.addData("type",  type )
								.addData("postID",  param )
								.build();	
					}
					else if ( "newPostByDistance".equals( type ) )
					{
						message = new Message.Builder().addData("title", "신규 합승정보 알림" )
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("postID",  param )
								.build();	
					}
					else if ( "event".equals( type ) || "eventssl".equals( type ) )
					{
						message = new Message.Builder().addData("title", "이벤트")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("eventSeq",  param )
								.addData("pushNo",  pushMessage.getPushNo() )
								.addData("sound", "on")
								.addData("vibrate", "on")
								.build();
					}
					else if ( "inquiryUser".equals( type ) )
					{
						message = new Message.Builder().addData("title", "프로필 조회 알림")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("userID",  param )
								.addData("pushNo",  pushMessage.getPushNo() )
								.build();
					}
					else if ( "locationUpdate".equals( type ) )
					{
						message = new Message.Builder().addData("title", "프로필 조회 알림")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("userID",  param )
								.addData("pushNo",  pushMessage.getPushNo() == null ? "": pushMessage.getPushNo() )
								.build();
					}

					logger.info( "push message[" + receiver.getRegID() + "]:" + message.toString() );
					
					Result pushResult = sender.send(message, receiver.getRegID() , Constants.push_retry_count);

					logger.info( "push result[" + receiver.getRegID() + "]:" + pushResult.toString() + 
							" errorCode:[" + pushResult.getErrorCodeName() + "]");
					
					try
					{
						if ( "NotRegistered".equalsIgnoreCase( pushResult.getErrorCodeName() ) )
						{
							sqlSession.update("com.tessoft.nearhere.taxi.updateUserAsDeleted", receiver );
							logger.info( "update user as deleted.[" + receiver.getUserID() + "]");
						}
					}
					catch( Exception ex )
					{
						logger.error( new Exception("update user as deleted error", ex ));
					}
				}
				else
				{
					logger.info( "push regID is null." );		
				}
			}
			
		}
		catch( Exception ex )
		{
			logger.error( ex );;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public HashMap getRegionInfo( String address ) throws Exception
	{
		HashMap regionInfo = new HashMap();
		
		if ( Util.isEmptyString(address) ) return null;
		
		address = stripBunji( address );
		
		String[] regionTokens = splitRegions( address );
		
		if ( regionTokens == null || regionTokens.length < 1 ) return null;
		
		for ( int i = 0; i < regionTokens.length; i++ )
		{
			String level = String.valueOf(i + 1);
			HashMap param = new HashMap();
			
			String regionName = regionTokens[i].trim();
			param.put("regionName", getRegionName( regionName, level ) );
			param.put("level", level);
			
			HashMap region = null;
			
			if ("1".equals(level) )
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName3", param);
			else if ("2".equals(level) && regionInfo.get("lRegion") != null )
			{
				param.put("parentNo", ((HashMap) regionInfo.get("lRegion")).get("regionNo") );
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName4", param);
			}
			else if ("3".equals(level) && regionInfo.get("mRegion") != null )
			{
				param.put("parentNo", ((HashMap) regionInfo.get("mRegion")).get("regionNo") );
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName4", param);
			}
			else if ("4".equals(level) && regionInfo.get("sRegion") != null )
			{
				param.put("parentNo", ((HashMap) regionInfo.get("sRegion")).get("regionNo") );
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName4", param);
			}
			
			if ( region != null )
			{
				if ( i == 0 )
					regionInfo.put("lRegion", region );
				else if ( i == 1 )
					regionInfo.put("mRegion", region );
				else if ( i == 2 )
					regionInfo.put("sRegion", region );
				else if ( i == 3 )
					regionInfo.put("tRegion", region );
			}
		}
		
		return regionInfo;
	}
	
	public String getRegionName( String name, String level )
	{
		String result = name;
		
		if ("1".equals(level))
		{
			if ( result.startsWith("충청북") || result.startsWith("충북") )
				return "충청북도";
			else if ( result.startsWith("충청남") || result.startsWith("충남") )
				return "충청남도";
			else if ( result.startsWith("경상북") || result.startsWith("경북") )
				return "경상북도";
			else if ( result.startsWith("경상남") || result.startsWith("경남") )
				return "경상남도";
			else if ( result.startsWith("전라북") || result.startsWith("전북") )
				return "전라북도";
			else if ( result.startsWith("전라남") || result.startsWith("전남") )
				return "전라남도";
			else if ( result.startsWith("제주") )
				return "제주도";
			else if ( result.startsWith("세종특별자치시"))
				return "세종시";	
			
			result = result.replaceAll("특별시", "");
			result = result.replaceAll("광역시", "");
		}

		/*
		if ( !"대구".equals( result ) && result.endsWith("구") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("군") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("시") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("동") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("읍") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("면") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("리") )
			result = result.substring(0,  result.length() - 1 );
		
		result = result.replaceAll("\\d","");	
		*/
		
		return result;
	}
	
	public String stripBunji( String address ) throws Exception
	{
		String result = "";
		
		String[] tokens = address.split(" ");
		
		int gu = 0;
		int si = 0;
		int dong = 0;
		int myeon = 0;
		int li = 0;
		
		for( int i = 0; i < tokens.length; i++ )
		{
			String token = tokens[i].trim();
			
			if ( token.endsWith("구") && gu == 0 ) gu = i;
			if ( token.endsWith("시") && si == 0 ) si = i;
			if ( ( token.endsWith("동") || token.indexOf("동") >= 0 && token.indexOf("가") >= 0 || token.indexOf("로") >= 0 && token.indexOf("가") >= 0 ) && dong == 0 ) dong = i;
			if ( token.endsWith("면") && myeon == 0 ) myeon = i;
			if ( token.endsWith("리") && li == 0 ) li = i;
		}
		
		if ( li > 0 )
		{
			for ( int i = 0; i <= li; i++ )
				result += tokens[i].trim() + " ";
		}
		else if ( dong > 0 )
		{
			for ( int i = 0; i <= dong; i++ )
				result += tokens[i].trim() + " ";
		}
		else if ( si > 0 )
		{
			for ( int i = 0; i <= si; i++ )
				result += tokens[i].trim() + " ";
		}
		else if ( gu > 0 )
		{
			for ( int i = 0; i <= gu; i++ )
				result += tokens[i].trim() + " ";
		}
		else
			throw new Exception( address );
		
		return result.trim();
	}
	
	public String[] splitRegions( String address )
	{
		String[] tokens = address.split(" ");
		
		for( int i = 0; i < tokens.length; i++ )
			tokens[i] = tokens[i].trim();
		
		ArrayList list = new ArrayList();
		
		// 리 가 있는지 체크
		if ( !Util.isEmptyString( tokens[tokens.length - 1 ] ) && tokens[tokens.length - 1 ].endsWith("리"))
		{
			if ( tokens.length == 4 )
			{
				list.add(tokens[0]);
				list.add(tokens[1]);
				list.add(tokens[2]);
				list.add(tokens[3]);
			}
			else if ( tokens.length == 5 )
			{
				list.add(tokens[0]);
				list.add(tokens[1] + " " + tokens[2]);
				list.add(tokens[3]);
				list.add(tokens[4]);
			}
			else
			{
				logger.error("tokens.length(리) " + tokens.length + " is strange for " + address );
				
				for ( int i = 0; i < tokens.length; i++ )
					list.add(tokens[i]);

			}
		}
		else
		{
			if ( tokens.length == 3 )
			{
				list.add(tokens[0]);
				list.add(tokens[1]);
				list.add(tokens[2]);
			}
			else if ( tokens.length == 4 )
			{
				list.add(tokens[0]);
				list.add(tokens[1] + " " + tokens[2]);
				list.add(tokens[3]);
			}
			else
			{
				logger.error("tokens.length " + tokens.length + " is strange for " + address);

				for ( int i = 0; i < tokens.length; i++ )
					list.add(tokens[i]);
			}
		}
		
		
		String[] result = (String[]) list.toArray(new String[list.size()]);
		
		return result;
	}
}
