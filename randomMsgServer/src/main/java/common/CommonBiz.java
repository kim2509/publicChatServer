package common;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonBiz {

	protected static Logger logger = Logger.getLogger(CommonBiz.class.getName());
	@Autowired
	private SqlSession sqlSession;
	
	public CommonBiz()
	{
		logger.info( "CommonBiz created." );
		logger.info( "sqlSession is " + sqlSession == null ? "null":"not null" );
	}
}
