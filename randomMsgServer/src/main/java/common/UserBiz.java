package common;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.nearhere.domain.User;

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
	
	public User selectUser( String userID , boolean bRequireMobileNo ) {
		
		User user = new User();
		user.setUserID(userID);
		
		user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
		
		if ( bRequireMobileNo == false )
			user.setMobileNo("");
		
		return user;
	}
	
	public HashMap getUserInfo( String userID )
	{
		HashMap userInfo = sqlSession.selectOne("com.tessoft.nearhere.user.getUserInfo", userID);
		return userInfo;
	}
}
