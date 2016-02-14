package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.android.gcm.server.Message;
import com.nearhere.domain.UserSetting;

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
	
	// 새 글 등록시 집,회사 근처의 사람들에게 푸쉬 메세지를 보낸다.
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<HashMap> sendPushMessageToUsersOnNewPost() throws Exception
	{
		List<HashMap> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.getPushJobList");
		
		MessageBiz messageBiz = MessageBiz.getInstance(sqlSession);
		
		if ( postList == null || postList.size() < 1 )
		{
			logger.info("postList is null or empty.");
			return null;
		}
		
		for ( int i = 0; i < postList.size(); i++ )
		{
			HashMap temp = new HashMap();
			temp.put("latitude", postList.get(i).get("latitude") );
			temp.put("longitude", postList.get(i).get("longitude") );
			temp.put("userID", postList.get(i).get("userID") );
			
			List<HashMap> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.getUserListAroundPost", temp );
			
			if ( userList == null || userList.size() < 1 )
				logger.info("userList for the pushID[" + postList.get(i).get("pushID") + "] is null.");
			else
			{
				logger.info("userList for the pushID[" + postList.get(i).get("pushID") + "] size is " + userList.size() );
				
				for ( int j = 0; j < userList.size(); j++ )
				{
					String msg = "고객님의 지역근처에 합승글이 등록되었습니다.";
					HashMap pushData = new HashMap();
					pushData.put("pushID", postList.get(i).get("pushID") );
					pushData.put("postID", postList.get(i).get("param") );
					pushData.put("userID", userList.get(j).get("userID") );
					pushData.put("locationID", userList.get(j).get("locationID") );
					pushData.put("locationName", userList.get(j).get("locationName") );
					pushData.put("regID", userList.get(j).get("regID") );
					pushData.put("address", userList.get(j).get("address") );
					pushData.put("message", msg );

					sqlSession.insert("com.tessoft.nearhere.taxi.background.insertNewPostPushData", pushData );
				}
				
				sendPushMessageOnNewPost( postList.get(i) );
			}
			
			sqlSession.update("com.tessoft.nearhere.taxi.background.updatePushJobAsFinished", postList.get(i));
		}
		
		return null;
	}
	
	public void sendPushMessageOnNewPost( HashMap postData ) throws Exception
	{
		List<HashMap> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.getNewPostPushDataByPushID", postData);

		MessageBiz messageBiz = MessageBiz.getInstance(sqlSession);
		
		for ( int i = 0; i < userList.size(); i++ )
		{
			messageBiz.insertUserPushMessage( userList.get(i).get("userID").toString() , "newPostByDistance", 
					userList.get(i).get("message").toString(), userList.get(i).get("postID").toString());
			
			UserSetting setting = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserSetting", userList.get(i) );
			
			if ( setting == null || !"N".equals( setting.getRecommendPushReceiveYN() ) )
			{
				String pushResult = messageBiz.sendPushForNewPost(userList.get(i).get("regID").toString(), 
						userList.get(i).get("message").toString(), userList.get(i).get("postID").toString());
				userList.get(i).put("pushResult", pushResult);
			}
			else
			{
				userList.get(i).put("pushResult", "푸쉬알림꺼놓음");
			}
			
			sqlSession.insert("com.tessoft.nearhere.taxi.background.updateNewPostPushData", userList.get(i) );
		}
		
		logger.info("sendPushMessageOnNewPost is finished for the pushID[" + postData.get("pushID") + "].");
	}
}
