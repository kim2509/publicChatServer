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

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.neighborhood.domain.Post;
import com.neighborhood.domain.PostLike;
import com.neighborhood.domain.PostReply;
import com.neighborhood.domain.User;

@Controller
public class NeighborhoodController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping( value ="/getPosts.do")
	public @ResponseBody List<Post> getPosts( ModelMap model, @RequestBody String bodyString )
	{
		List<Post> lists = null;
		try
		{			
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(bodyString, new TypeReference<User>(){});
			
			/*
			user.setLatitude("37.484722");
			user.setLongitude("126.902695");
			*/
			
			lists = sqlSession.selectList("com.tessoft.neighborhood.getAllPosts", user );
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return lists;
	}
	
	@RequestMapping( value ="/sendPush.do")
	public @ResponseBody String sendPush( ModelMap model, @RequestBody String bodyString )
	{
		try
		{
			Sender sender = new Sender("AIzaSyD_T1vjJnwwOojOjCJW_yQvwckWuY6c6yY");
			
			Message message = new Message.Builder().addData("title", "신규 글 등록")
					.addData("message", "[500m]근처에 순대국밥집 잘하는데 있을까요?").build();
			
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
}
