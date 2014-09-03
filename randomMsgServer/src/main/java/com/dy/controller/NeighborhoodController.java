package com.dy.controller;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neighborhood.domain.Post;
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
			User user = new User();
			user.setLatitude("37.484722");
			user.setLongitude("126.902695");
			
			lists = sqlSession.selectList("com.dy.mapper.getAllPosts", user );
		}
		catch( Exception ex )
		{
			System.out.println( ex.getMessage() );
		}
		
		return lists;
	}
}
