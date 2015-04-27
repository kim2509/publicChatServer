package com.dy.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.nearhere.domain.NewUser;
import com.nearhere.domain.Post;
import com.nearhere.domain.User;
import com.tessoft.nearhere.taxi.TaxiController;

public class ScheduledTasks {

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	protected static Logger logger = Logger.getLogger(ScheduledTasks.class.getName());
	
	ObjectMapper mapper = null;
	
	@Autowired
	private SqlSession sqlSession;
	
	public ScheduledTasks() {
		// TODO Auto-generated constructor stub
		mapper = new ObjectMapper();
		
		logger.info( "ScheduledTasks created." );
	}
	
	/*
	@Scheduled(fixedRate = 10000)
	public void sendPushMessageByNewPost() {
//		System.out.println("The time is now " + dateFormat.format(new Date()));
		
		try
		{
			logger.info( "sendPushMessageByNewPost start !!!!!!!!!!!!!!!!" );
			User user = new User();
			user.setUserID("kim2509");
			User existingUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
			
			logger.info( "query: " + mapper.writeValueAsString(existingUser) );
			
			logger.info( "sendPushMessageByNewPost ended !!!!!!!!!!!!!!!!" );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
	}
	*/
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	//@Scheduled(initialDelay=5000,fixedDelay = 5000)
	public void notifyNewUserToNearUsers() {
//		System.out.println("The time is now " + dateFormat.format(new Date()));
		
		try
		{
//			if ( ScheduledTasks.bExecuting ) return;
			
			logger.info( "notifyNewUserToNearUsers start !!!!!!!!!!!!!!!!" );
		
			/*
			int maxUserNo = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectLastNewUser");
					
			logger.info( "maxUserNo:" + maxUserNo );
			
			HashMap hash = new HashMap();
			hash.put("maxUserNo", maxUserNo);
			
			int resultCount = sqlSession.insert("com.tessoft.nearhere.taxi.insertNewUsers", hash);
			
			logger.info( "resultCount:" + resultCount );
			
			if ( resultCount > 0 )
			{
				List<NewUser> newUsers = sqlSession.selectList("com.tessoft.nearhere.taxi.selectNewUsers");
				
				for ( int i = 0; i < newUsers.size() ; i++ )
				{
					NewUser user = newUsers.get(i);
					
					List<HashMap> usersToSend = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersNearNewUser", user );
					
					logger.info( "usersToSend count:" + usersToSend.size() );
					
					for ( int j = 0; j < usersToSend.size(); j++ )
					{
						
					}
					
					logger.info( "sent successfully" );
					
					int updateResult = sqlSession.update("com.tessoft.nearhere.taxi.updateNewUserChecked", user );
					
					logger.info( "userNo:" + user.getUserNo() + " updateResult:" + updateResult );
					
				}
			}
			
			Thread.sleep(2000);
			ScheduledTasks.bExecuting = false;
			*/
			
			logger.info( "notifyNewUserToNearUsers end !!!!!!!!!!!!!!!!" );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
	}
	
	@Scheduled(cron="* 0 21 * * ?") // 밤 9시 정각에 실행
	public void updatePostAsFinished() {
//		System.out.println("The time is now " + dateFormat.format(new Date()));
		
		try
		{
			logger.info( "updatePostAsFinished start !!!!!!!!!!!!!!!!" );
			
			// 30개씩
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.getPostsNotYetFinished");
			
			if ( postList == null )
			{
				logger.info( "postList is null.");
			}
			else
			{
				logger.info( "postList.size : " + postList.size() );
				
				int result = 0;
				
				Date now = new Date();
				
				if ( postList != null && postList.size() > 0 )
				{
					for ( int i = postList.size() - 1 ; i >= 0 ; i-- )
					{
						Post post = postList.get(i);
						
						if ( Util.isEmptyString( post.getDepartureDateTime() ) )
						{
							Util.setPostDepartureDateTime(logger, "", post);
							
							// departureDateTime update
							sqlSession.update("com.tessoft.nearhere.taxi.updatePostDepartureDateTime", post );	
						}
						
						Date dDepartureDateTime = Util.getDateFromString(post.getDepartureDateTime(), "yyyy-MM-dd HH:mm:ss");
						
						long diff = now.getTime() - dDepartureDateTime.getTime();
						long diffDays = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
						if ( diffDays <= 1 )
						{
							// 출발일이 2일이내 인 것은 삭제목록에서 제거
							postList.remove(i);
						}
					}
					
					// 남은 postList 는 모두 종료처리
					result = sqlSession.update("com.tessoft.nearhere.taxi.admin.updatePostAsFinished", postList );
					logger.info( "update result : " + result );
				}
			}
			
			logger.info( "updatePostAsFinished end !!!!!!!!!!!!!!!!" );
		}
		catch( Exception ex )
		{
			logger.error( new Exception("scheduledTask", ex ) );
		}
	}
}
