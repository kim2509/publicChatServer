package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.android.gcm.server.Message;

public class BackgroundJobBiz extends CommonBiz{

	private static BackgroundJobBiz backgroundJobBiz = null;
	
	public static BackgroundJobBiz getInstance( SqlSession sqlSession )
	{
		if ( BackgroundJobBiz.backgroundJobBiz == null )
			BackgroundJobBiz.backgroundJobBiz = new BackgroundJobBiz( sqlSession );
		
		return BackgroundJobBiz.backgroundJobBiz;
	}
	
	public BackgroundJobBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	public List<HashMap> getPushJobList() throws Exception
	{
		List<HashMap> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.getPushJobList");
		
		MessageBiz messageBiz = MessageBiz.getInstance(sqlSession);
		
		if ( postList == null || postList.size() < 1 )
		{
			logger.info("userList is null or empty.");
			return null;
		}
		
		for ( int i = 0; i < postList.size(); i++ )
		{
			HashMap temp = new HashMap();
			temp.put("latitude", postList.get(i).get("latitude") );
			temp.put("longitude", postList.get(i).get("longitude") );
			
			List<HashMap> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.getUserListAroundPost", temp );
			
			if ( userList == null || userList.size() < 1 )
				logger.info("userList is null.");
			else
			{
				logger.info("userList size is " + userList.size() );
				
				for ( int j = 0; j < userList.size(); j++ )
				{
					//messageBiz.insertUserPushMessage(userID, type, msg, param);
					
					/*
					
					messageBiz.sendPushForNewPost(regID, msg, postID);
					*/	
				}
			}
			
			sqlSession.update("com.tessoft.nearhere.taxi.background.updatePushJobAsFinished", postList.get(i));
		}
		
		return null;
	}
}
