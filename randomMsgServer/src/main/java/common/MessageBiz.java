package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.dy.common.Constants;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.UserPushMessage;

public class MessageBiz extends CommonBiz{

	private static MessageBiz messageBiz = null;
	
	public static MessageBiz getInstance( SqlSession sqlSession )
	{
		if ( MessageBiz.messageBiz == null )
			MessageBiz.messageBiz = new MessageBiz( sqlSession );
		
		return MessageBiz.messageBiz;
	}
	
	public MessageBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	public String sendPushForNewPost(String regID, String msg , String postID )
	{
		try
		{
			Message message = new Message.Builder().addData("title", "신규 카풀정보 알림" )
					.addData("message",  msg )
					.addData("type",  "newPostByDistance" )
					.addData("postID",  postID )
					.build();
			
			String result = sendGCMPush(regID, message);
			
			return result;
		}
		catch( Exception ex)
		{
			return ex.getMessage();
		}
	}
	
	public String sendFriendRequestMessage(String regID, String msg , String userID )
	{
		try
		{
			Message message = new Message.Builder().addData("title", "친구요청" )
					.addData("message",  msg )
					.addData("type",  "friendRequest" )
					.addData("userID",  userID )
					.addData("sound", "on")
					.addData("vibrate", "on")
					.build();
			
			String result = sendGCMPush(regID, message);
			
			return result;
		}
		catch( Exception ex)
		{
			return ex.getMessage();
		}
	}
	
	public String sendAcceptFriendRequest(String regID, String msg , String userID )
	{
		try
		{
			Message message = new Message.Builder().addData("title", "친구요청" )
					.addData("message",  msg )
					.addData("type",  "acceptFriendRequest" )
					.addData("userID",  userID )
					.addData("sound", "on")
					.addData("vibrate", "on")
					.build();
			
			String result = sendGCMPush(regID, message);
			
			return result;
		}
		catch( Exception ex)
		{
			return ex.getMessage();
		}
	}
	
	public String sendAskLocationRequest(String regID, String msg , String userID, String userName, String locationID )
	{
		try
		{
			Message message = new Message.Builder().addData("title", "현재위치 요청" )
					.addData("message",  msg )
					.addData("type",  "askLocationRequest" )
					.addData("userID",  userID )
					.addData("userName",  userName )
					.addData("locationID",  locationID )
					.addData("sound", "on")
					.addData("vibrate", "on")
					.build();
			
			String result = sendGCMPush(regID, message);
			
			return result;
		}
		catch( Exception ex)
		{
			return ex.getMessage();
		}
	}
	
	public String sendResponseLocationRequest(String regID, String msg , String userID, String toUserID, String locationID )
	{
		try
		{
			Message message = new Message.Builder().addData("title", "현재위치 요청" )
					.addData("message",  msg )
					.addData("type",  "sendLocationRequestResponse" )
					.addData("userID",  userID )
					.addData("toUserID",  toUserID)
					.addData("locationID",  locationID )
					.addData("sound", "on")
					.addData("vibrate", "on")
					.build();
			
			String result = sendGCMPush(regID, message);
			
			return result;
		}
		catch( Exception ex)
		{
			return ex.getMessage();
		}
	}
	
	public void insertUserPushMessage( String userID, String type, String msg, String param )
	{
		UserPushMessage pushMessage = new UserPushMessage();
		pushMessage.setToUserID( userID );
		pushMessage.setType(type);
		pushMessage.setMessage( msg );
		pushMessage.setParam1(param);
		
		sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );
	}
	
	public String sendCafeNotification(String title, String userID, String regID, 
			String msg , String url, String popupTitle, String messageType, String param1, String titleBarHiddenYN )
	{
		try
		{
			Message message = new Message.Builder().addData("title", title )
					.addData("message",  msg )
					.addData("type",  "webView" )
					.addData("url",  url )
					.addData("param",  popupTitle )
					.addData("sound", "on")
					.addData("vibrate", "on")
					.addData("titleBarHidden", titleBarHiddenYN )
					.build();
			
			String result = sendGCMPush(regID, message);
			
			UserPushMessage pushMessage = new UserPushMessage();
			pushMessage.setToUserID( userID );
			pushMessage.setType(messageType);
			pushMessage.setMessage( msg );
			pushMessage.setParam1(param1);
			sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );
			
			return result;
		}
		catch( Exception ex)
		{
			return ex.getMessage();
		}
	}
}
