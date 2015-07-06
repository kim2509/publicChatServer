package com.tessoft.nearhere.taxi;

import java.math.BigInteger;
import java.security.SecureRandom;

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
			int result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );

			logger.info( "insertUserPushMessage result : " + result );

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
								.addData("pushNo",  pushMessage.getPushNo() )
								.build();
					}

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
}
