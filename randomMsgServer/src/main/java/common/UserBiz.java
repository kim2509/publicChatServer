package common;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class UserBiz extends CommonBiz{

	private static UserBiz userBiz = null;

	public static UserBiz getInstance( SqlSession sqlSession )
	{
		if ( UserBiz.userBiz == null )
			UserBiz.userBiz = new UserBiz( sqlSession );

		return UserBiz.userBiz;
	}

	public UserBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}

	@SuppressWarnings("rawtypes")
	public void updateUserAsDeleted( HashMap receiver )
	{
		sqlSession.update("com.tessoft.nearhere.user.updateUserAsDeleted", receiver );
		logger.info( "update user as deleted.[" + receiver.get("userID") + "]");
	}
}
