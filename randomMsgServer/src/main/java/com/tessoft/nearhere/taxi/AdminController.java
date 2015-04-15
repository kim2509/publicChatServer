package com.tessoft.nearhere.taxi;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.getAllUsers" );
		
		if ( userList == null )
			message = "null";
		else
			message = "not null";
		
		logger.info( "userSize:" + userList.size() );
		
		return new ModelAndView("index", "message", message);
	}
}
