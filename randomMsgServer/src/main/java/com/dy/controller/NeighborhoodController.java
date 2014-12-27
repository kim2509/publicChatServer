package com.dy.controller;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dy.domain.MainInfo;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.neighborhood.domain.Post;
import com.neighborhood.domain.PostLike;
import com.neighborhood.domain.PostReply;
import com.neighborhood.domain.User;
import com.neighborhood.domain.UserLocation;

@Controller
public class NeighborhoodController {

	@Autowired
	private SqlSession sqlSession;
	
	private String GCM_API_KEY = "AIzaSyD_T1vjJnwwOojOjCJW_yQvwckWuY6c6yY";
	
	@RequestMapping( value ="/getMainInfo.do")
	public @ResponseBody MainInfo getMainInfo( ModelMap model, @RequestBody String bodyString )
	{
		MainInfo result = new MainInfo();
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			int postCount = sqlSession.selectOne("com.tessoft.neighborhood.getPostCount", user );
			result.setPostCount(postCount);
			
			List<Post> lists = sqlSession.selectList("com.tessoft.neighborhood.getAllPosts", user );
			result.setPostList(lists);
			
			List<User> userList = sqlSession.selectList("com.tessoft.neighborhood.getAllUsers" );
			result.setUserList(userList);
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return result;
	}
	
	@RequestMapping( value ="/getPosts.do")
	public @ResponseBody List<Post> getPosts( ModelMap model, @RequestBody String bodyString )
	{
		List<Post> lists = null;
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			lists = sqlSession.selectList("com.tessoft.neighborhood.getAllPosts", user );
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return lists;
	}
	
	@RequestMapping( value ="/getAllUsers.do")
	public @ResponseBody List<User> getAllUsers( ModelMap model, @RequestBody String bodyString )
	{
		List<User> userList = null;
		try
		{			
			
			userList = sqlSession.selectList("com.tessoft.neighborhood.getAllUsers" );
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return userList;
	}
	
	@RequestMapping( value ="/getAllUserLocation.do")
	public @ResponseBody List<UserLocation> getAllUserLocation( ModelMap model, @RequestBody String bodyString )
	{
		List<UserLocation> locations = null;
		try
		{			
			
			locations = sqlSession.selectList("com.tessoft.neighborhood.getAllUserLocation" );
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return locations;
	}
	
	private String sendPushMessage( String regID, String msg, String postID,
			String latitude, String longitude ) throws Exception
	{
		Sender sender = new Sender(GCM_API_KEY);
		
		Message message = new Message.Builder().addData("title", "신규 글 등록")
				.addData("message",  msg )
				.addData("postID",  postID )
				.addData("latitude",  latitude )
				.addData("longitude",  longitude ).build();
		
        Result result = sender.send(message, regID , 5);
        
        return result.toString();
	}
	
	@RequestMapping( value ="/sendPush.do")
	public @ResponseBody String sendPush( ModelMap model, @RequestBody String bodyString )
	{
		try
		{
			Sender sender = new Sender(GCM_API_KEY);
			
			String postID = "25";
			String latitude = "37.369351999808515";
			String longitude = "126.9383371520184";
			
			Message message = new Message.Builder().addData("title", "신규 글 등록")
					.addData("message", "[500m]근처에 순대국밥집 잘하는데 있을까요?")
					.addData("postID",  postID )
					.addData("latitude",  latitude )
					.addData("longitude",  longitude ).build();
			
	        Result result = sender.send(message, "APA91bEdwb3wjwa24JN99CiG8AFVVKJK2tZ7EGmyiDM0MnrrYGQauHDc_WC0zAmDIA3O_ZYM14QB2TVBn_gIzgt70R0L61gIzAsEZCk9xN5_yeL0O9SlrzyelUFIVdnhS9GSwH2c7BVEPVQwWc5F0MVPr8OcEAW8nwvE8xLs-9HjM_-cHTRptnE", 5);
	        String status = "Sent message to one device: " + result;
			
	        return status;
			
		}
		catch( Exception ex )
		{
			return ex.getMessage();
		}
	}
	
	@RequestMapping( value ="/getPostDetail.do")
	public @ResponseBody Post getPostDetail( ModelMap model, @RequestBody String bodyString )
	{
		Post post = null;
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			post = mapper.readValue(bodyString, new TypeReference<Post>(){});
			
			post = sqlSession.selectOne("com.tessoft.neighborhood.getPostDetail", post );
			
			List<PostLike> postLikes = sqlSession.selectList("com.tessoft.neighborhood.getPostLikes", post );
			post.setPostLikes(postLikes);
			
			List<PostReply> postReplies = sqlSession.selectList("com.tessoft.neighborhood.getPostReplies", post );
			post.setPostReplies(postReplies);
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return post;
	}
	
	@RequestMapping( value ="/addPostReply.do")
	public @ResponseBody Post addPostReply( ModelMap model, @RequestBody String bodyString )
	{
		PostReply postReply = null;
		Post post = null;
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			postReply = mapper.readValue(bodyString, new TypeReference<PostReply>(){});
		
			sqlSession.insert("com.tessoft.neighborhood.addPostReply", postReply );
			
			post = new Post();
			post.setPostID(postReply.getPostID());
			post = sqlSession.selectOne("com.tessoft.neighborhood.getPostDetail", post );
			
			List<PostLike> postLikes = sqlSession.selectList("com.tessoft.neighborhood.getPostLikes", post );
			post.setPostLikes(postLikes);
			
			List<PostReply> postReplies = sqlSession.selectList("com.tessoft.neighborhood.getPostReplies", post );
			post.setPostReplies(postReplies);
			
			User author = sqlSession.selectOne("com.tessoft.neighborhood.getPostAuthor", postReply);
			
			List<User> replyUserList = sqlSession.selectList("com.tessoft.neighborhood.getPostReplyUsers", postReply);
			
			ArrayList<String> pushRegIDs = new ArrayList<String>();
			
			// 저자가 댓글다는 사람이 아니면
			if ( author != null && !author.getUserID().equals(postReply.getUserID()) &&
					!"".equals( author.getRegID() ) )
				pushRegIDs.add( author.getRegID() );
			
			if ( replyUserList != null && replyUserList.size() > 0 )
			{
				for ( int i = 0; i < replyUserList.size(); i++ )
				{
					// 기존에 댓글을 단 사람들이 지금 댓글 다는 사람이 아니면 추가
					if ( !replyUserList.get(i).getUserID().equals( postReply.getUserID() ) &&
							!"".equals( replyUserList.get(i).getRegID() ) )
						pushRegIDs.add( replyUserList.get(i).getRegID());
				}
			}

			//푸시메시지 전송.
			for ( int i = 0; i < pushRegIDs.size(); i++ )
			{
				sendPushMessage( pushRegIDs.get(i), postReply.getMessage(), post.getPostID(), post.getLatitude(), post.getLongitude());
			}
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return post;
	}
	
	@RequestMapping( value ="/addPostLike.do")
	public @ResponseBody Post addPostLike( ModelMap model, @RequestBody String bodyString )
	{
		PostLike postLike = null;
		Post post = null;
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			postLike = mapper.readValue(bodyString, new TypeReference<PostLike>(){});
		
			sqlSession.insert("com.tessoft.neighborhood.addPostLike", postLike );
			
			post = new Post();
			post.setPostID(postLike.getPostID());
			post = sqlSession.selectOne("com.tessoft.neighborhood.getPostDetail", post );
			
			List<PostLike> postLikes = sqlSession.selectList("com.tessoft.neighborhood.getPostLikes", post );
			post.setPostLikes(postLikes);
			
			List<PostReply> postReplies = sqlSession.selectList("com.tessoft.neighborhood.getPostReplies", post );
			post.setPostReplies(postReplies);
			
			User author = sqlSession.selectOne("com.tessoft.neighborhood.getPostAuthor2", postLike);
			
			if ( author != null )
				sendPushMessage(author.getRegID(), postLike.getUserName() + "님이 좋아합니다.", post.getPostID(),
						post.getLatitude(), post.getLongitude());
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return post;
	}
	
	@RequestMapping( value ="/addPost.do")
	public @ResponseBody Post addPost( ModelMap model, @RequestBody String bodyString )
	{
		Post post = null;
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			post = mapper.readValue(bodyString, new TypeReference<Post>(){});
		
			sqlSession.insert("com.tessoft.neighborhood.addPost", post );
			
			List<User> userList = sqlSession.selectList("com.tessoft.neighborhood.getNearUsers", post );
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				sendPushMessage( userList.get(i).getRegID(), "[" + userList.get(i).getDistance() + "]" + post.getMessage(), 
						post.getPostID(), post.getLatitude(), post.getLongitude() );
			}
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return post;
	}
	
	@RequestMapping( value ="/login.do")
	public @ResponseBody User login( ModelMap model, @RequestBody String bodyString )
	{
		User user = null;
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
		
			List<User> userList = sqlSession.selectList("com.tessoft.neighborhood.getUser", user );
			
			if ( userList == null || userList.size() == 0 )
			{
				sqlSession.insert("com.tessoft.neighborhood.insertUser", user);
				UserLocation userLocation = new UserLocation();
				userLocation.setUserID(user.getUserID());
				userLocation.setLatitude(user.getLatitude());
				userLocation.setLongitude(user.getLongitude());
				userLocation.setLocationName("현재위치");
				userLocation.setPriority("0");
				sqlSession.insert("com.tessoft.neighborhood.insertUserLocation", userLocation);
			}
			else if ( userList.size() > 0 )
			{
				sqlSession.update("com.tessoft.neighborhood.updateUserRegID", user);
				sqlSession.update("com.tessoft.neighborhood.updateUserLocation", user);
				return userList.get(0);
			}
	
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return user;
	}
	
	@RequestMapping( value ="/updateUserLocation.do")
	public @ResponseBody String updateUserLocation( ModelMap model, @RequestBody String bodyString )
	{
		User user = null;
		
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			user = mapper.readValue(bodyString, new TypeReference<User>(){});
		
			sqlSession.update("com.tessoft.neighborhood.updateUserLocation", user);
			return "true";
	
		}
		catch( Exception ex )
		{
			return "false";
		}
	}
}
