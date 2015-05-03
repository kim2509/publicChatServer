package com.tessoft.nearhere.taxi;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.Util;
import com.nearhere.domain.Post;
import com.nearhere.domain.User;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	protected static Logger logger = Logger.getLogger(AdminController.class.getName());
	
	@RequestMapping( value ="/admin")
	public ModelAndView index ()
	{
		String message = "Hello World, Spring 3.0!";
		
		try
		{
			/*
			List<Post> postList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.getAllPosts" );
			
			if ( postList == null )
				message = "null";
			else
				message = "not null";
			
			logger.info( "postList Size:" + postList.size() );

			for ( int i = 0; i < postList.size(); i++ )
			{
				Post post = postList.get(i);
				
//				if ( Util.isEmptyString( post.getDepartureDateTime() ) == false ) continue;
				
				Date dDepartureDateTime = null;
				Date dCreatedDateTime = new Date();
				Date temp = null;
				
//				post.setCreatedDate( Util.getDateStringFromDate( dCreatedDateTime, "yyyy-MM-dd HH:mm:ss") );
				
				if ( Util.isEmptyString(post.getCreatedDate()) == false )
					dCreatedDateTime = Util.getDateFromString(post.getCreatedDate(), "yyyy-MM-dd HH:mm:ss");
				
				// 출발일자 설정
				if (post.getDepartureDate().indexOf("오늘") >= 0)
					dDepartureDateTime = dCreatedDateTime;
				else
					dDepartureDateTime = Util.getDateFromString(post.getDepartureDate(), "yyyy-MM-dd");
										
				if ( post.getDepartureTime().indexOf( "지금" ) >= 0)
					temp = dCreatedDateTime;
				else
					temp = Util.getDateFromString( post.getDepartureTime(), "HH:mm");
										
				// 출발시간 설정
				dDepartureDateTime.setHours(temp.getHours());
				dDepartureDateTime.setMinutes(temp.getMinutes());
				dDepartureDateTime.setSeconds(0);
				
				post.setDepartureDateTime( Util.getDateStringFromDate( dDepartureDateTime, "yyyy-MM-dd HH:mm:ss"));
				
				sqlSession.update("com.tessoft.nearhere.taxi.admin.updatePostDepartureDateTime", post );
				
			}
			
			*/
		}
		catch(Exception ex )
		{
			
		}
		
		
		return new ModelAndView("index", "message", message);
	}
}
