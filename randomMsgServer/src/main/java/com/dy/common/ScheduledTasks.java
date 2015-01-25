package com.dy.common;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.nearhere.domain.User;
import com.tessoft.nearhere.taxi.TaxiController;

@EnableScheduling
public class ScheduledTasks {

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	protected static Logger logger = Logger.getLogger(ScheduledTasks.class.getName());
	
	ObjectMapper mapper = null;
	
	@Autowired
	private SqlSession sqlSession;
	
	public ScheduledTasks() {
		// TODO Auto-generated constructor stub
		mapper = new ObjectMapper();
	}
	
	@Scheduled(fixedRate = 60000)
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
}
