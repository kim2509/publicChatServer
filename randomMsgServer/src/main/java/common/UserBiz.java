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
	
	public HashMap getDriverInfo( String userID )
	{
		HashMap driverInfo = sqlSession.selectOne("com.tessoft.nearhere.user.getDriverInfo", userID );
		return driverInfo;
	}
	
	public void removeDriverInfo( String userID )
	{
		sqlSession.delete("com.tessoft.nearhere.user.removeDriverInfo", userID );
	}
}
