package com.dy.common;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.Post;
import com.nearhere.domain.User;
import com.nearhere.domain.UserPushMessage;

import common.BackgroundJobBiz;
import common.NewsBiz;

public class ScheduledTasks {

	protected static Logger logger = Logger.getLogger(ScheduledTasks.class.getName());

	ObjectMapper mapper = null;

	BackgroundJobBiz jobBiz = null;

	@Autowired
	private SqlSession sqlSession;

	public ScheduledTasks() {
		// TODO Auto-generated constructor stub
		mapper = new ObjectMapper();

		logger.info( "ScheduledTasks created." );
	}

	// 자동종료처리 매일 오전 오후 5시 정각에 실행
	@Scheduled(cron="0 0 5,17 * * ?") // 오전 오후 5시 정각에 실행
	public void updatePostAsFinished() {
		//		System.out.println("The time is now " + dateFormat.format(new Date()));

		try
		{
			logger.info( "updatePostAsFinished start !!!!!!!!!!!!!!!!" );

			// 50개씩
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.getPostsNotYetFinished");

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
						if ( diffDays <= 1 || post.getMessage().indexOf("매일") >= 0 || "Y".equals( post.getRepetitiveYN() ) )
						{
							// 출발일이 2일이내 인 것은 삭제목록에서 제거
							postList.remove(i);
						}
					}

					logger.info( "final postList size: " + postList.size() );

					// 남은 postList 는 모두 종료처리
					if ( postList.size() > 0 )
						result = sqlSession.update("com.tessoft.nearhere.taxi.background.updatePostAsFinished", postList );

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

	// 합승글 지역 null 일때 알아서 업데이트 (1시간마다)
	@Scheduled(fixedRate = 1000 * 60 * 60 ) // 1시간마다
	public void updatePostResgion() {

		try
		{
			logger.info( "updatePostResgion start !!!!!!!!!!!!!!!!" );

			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.background.selectPostsRegionNull" );

			int result = 0;

			for ( int i = 0; i < postList.size(); i++ )
			{
				Post post = postList.get(i);

				String regionName = Util.getRegionName( post.getToAddress() );

				if ( !Util.isEmptyString( regionName ) )
				{
					String region = sqlSession.selectOne("com.tessoft.nearhere.taxi.background.selectRegionNo", regionName );
					post.setRegion( region );
					result += sqlSession.update("com.tessoft.nearhere.taxi.background.updatePostRegion", post );
				}
			}

			logger.info( "update total count:" + result );

			logger.info( "updatePostResgion ended !!!!!!!!!!!!!!!!" );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
	}

	// 고객 현재위치 읽어옴 매일 오전 6 오후 8시 정각에 실행
	@Scheduled(cron="0 0 6,20 * * ?") //
	public void updateAllUsersCurrentLocation() {

		try
		{
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectUsersForLocationUpdate");

			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);

				logger.info( "[sendEventPushToAllUsers] sent to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );

				sendPushMessage(receiver, "locationUpdate", "고객상태 업데이트", "", true );
			}			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
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
			logger.error( ex );
		}
	}

	// 새 글 push 매 1분마다
	@Scheduled(fixedRate = 1000 * 60 * 5)
	public void sendPushUsersOnNewPost()
	{
		try
		{
			BackgroundJobBiz.getInstance(sqlSession).sendPushMessageToUsersOnNewPost();
		}
		catch(Exception ex )
		{
			logger.error( ex );
		}
	}

	// 뉴스 읽어오기 (1시간마다)
	@Scheduled(fixedRate = 1000 * 60 * 60 )
	public void scrapNews() {
		try
		{
			if ( Constants.bReal )
				NewsBiz.getInstance(sqlSession).scrapNews();
		}
		catch(Exception ex )
		{
			logger.error( ex );
		}
	}
}
