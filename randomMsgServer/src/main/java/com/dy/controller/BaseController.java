package com.dy.controller;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dy.domain.User;

@Controller
public class BaseController implements BeanFactoryAware {
	
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;
	
	@RequestMapping( value ="/getMetaInfo.do", method = RequestMethod.GET)
	public @ResponseBody User getMetaInfo(ModelMap model, @RequestParam("userNo") String userNo) {
		
		User user = new User();
		
		if ( userNo == null || userNo.trim().equals(""))
		{
			sqlSession.insert("com.dy.mapper.insertUser", user );
		}
		else
		{
			user = sqlSession.selectOne( "com.dy.mapper.getUser",  userNo );
		}
		
//		int userCount = sqlSession.selectOne("com.dy.mapper.getUserCount");
		
//		model.addAttribute("message", "welcome !!! " + userNo  + " count:" + userCount );
		
//		return "index";
		
		return user;
	}
	
	public void setBeanFactory(BeanFactory context) throws BeansException {
		// TODO Auto-generated method stub
		Object obj = context.getBean("sqlSession");
//		
		if ( obj == null )
			System.out.println("null");
		else
			sqlSession = (SqlSession) obj;
	}
 
}