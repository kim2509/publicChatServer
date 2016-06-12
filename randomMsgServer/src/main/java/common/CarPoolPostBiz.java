package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class CarPoolPostBiz  extends CommonBiz{
	
	private static CarPoolPostBiz carPoolPostBiz = null;

	public CarPoolPostBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	public static CarPoolPostBiz getInstance( SqlSession sqlSession )
	{
		if ( CarPoolPostBiz.carPoolPostBiz == null )
			CarPoolPostBiz.carPoolPostBiz = new CarPoolPostBiz( sqlSession );

		return CarPoolPostBiz.carPoolPostBiz;
	}
	
	public List<HashMap> getUserPosts( String userID )
	{
		List<HashMap> userPosts = sqlSession.selectList("com.tessoft.nearhere.post.getUserPosts", userID );
		
		return userPosts;
	}
}
