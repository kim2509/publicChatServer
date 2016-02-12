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
	
	public String sendPushForNewPost(String regID, String msg , String postID ) throws Exception
	{
		Message message = new Message.Builder().addData("title", "신규 합승정보 알림" )
				.addData("message",  msg )
				.addData("type",  "newPostByDistance" )
				.addData("postID",  postID )
				.build();
		
		return sendGCMPush(regID, message);
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
}
