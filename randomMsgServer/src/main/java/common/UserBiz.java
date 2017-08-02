package common;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.Util;
import com.nearhere.domain.APIResponse;
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
	
	public List<HashMap> getUserLocation( String userID )
	{
		List<HashMap> userLocationList = sqlSession.selectList("com.tessoft.nearhere.user.getUserLocation", userID);
		return userLocationList;
	}
	
	public List<HashMap> getFriendList( String userID , boolean bAll )
	{
		List<HashMap> friendList = null;
		
		if ( bAll ) friendList = sqlSession.selectList("com.tessoft.nearhere.user.getAllFriendList", userID);
		else friendList = sqlSession.selectList("com.tessoft.nearhere.user.getFriendList", userID);
		
		return friendList;
	}
	
	public List<HashMap> getUserPushMessage( String userID )
	{
		List<HashMap> userPushMessageList = sqlSession.selectList("com.tessoft.nearhere.user.getUserPushMessage", userID);
		return userPushMessageList;
	}
	
	@SuppressWarnings("rawtypes")
	public void updateUserPushMessageAsRead( HashMap param )
	{
		sqlSession.update("com.tessoft.nearhere.user.updateUserPushMessageAsRead", param );
	}
	
	@SuppressWarnings("rawtypes")
	public void updateAllUserPushMessageAsRead( HashMap param )
	{
		sqlSession.update("com.tessoft.nearhere.user.updateAllUserPushMessageAsRead", param );
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap selectUserByUserToken( String userToken ) throws Exception
	{
		HashMap userInfo = sqlSession.selectOne("com.tessoft.nearhere.user.selectUserByUserToken", userToken );
		return userInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public String getUserIDByUserToken( String userToken ) throws Exception
	{
		HashMap userInfo = sqlSession.selectOne("com.tessoft.nearhere.user.selectUserByUserToken", userToken );
		if ( Util.isEmptyForKey(userInfo, "userID") ) return null;
		return userInfo.get("userID").toString();
	}
	
	@SuppressWarnings({ "unchecked" })
	public void getRandomIDCommon( HashMap requestHash, User user, APIResponse response,
			String logIdentifier ) throws Exception {
		
		HashMap addInfo = new HashMap();
		addInfo.put("alreadyExistsYN", "N");
		addInfo.put("hash", "");
		
		//Guest 로그인 or 카카오로그인
		String userType = user.getType();
		String facebookID = user.getFacebookID();
		String facebookProfileImageURL = user.getFacebookProfileImageURL();
		String facebookURL = user.getFacebookURL();
		String kakaoID = user.getKakaoID();
		String kakaoThumbnail = user.getKakaoThumbnailImageURL();
		String kakaoProfileImageURL = user.getKakaoProfileImageURL();
		String gender = user.getSex();
		
		double appVersion = 0.0;
		if ( requestHash != null && requestHash.containsKey("AppVersion") )
			appVersion = Double.parseDouble( requestHash.get("AppVersion").toString() );
		
		// 기존에 카카오 계정 연동을 한 경우.(삭제후 재설치 케이스)
		if ( !Util.isEmptyString( user.getKakaoID() ) )
		{
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByKakaoID", user);
			if ( tempUser != null )
			{
				user = tempUser;
				
				if ( !Util.isEmptyString( facebookID ) )
				{
					user.setFacebookID(facebookID);
					user.setFacebookProfileImageURL(facebookProfileImageURL);
					user.setSex(gender);
					user.setFacebookURL(facebookURL);
				}
			}
		}
		
		// 기존에 facebook 계정 연동을 한 경우.(삭제후 재설치 케이스)
		if ( !Util.isEmptyString( facebookID ) )
		{
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByFacebookID", user);
			if ( tempUser != null )
			{
				user = tempUser;
				
				if ( !Util.isEmptyString( kakaoID ) )
				{
					user.setKakaoID(kakaoID);
					user.setKakaoThumbnailImageURL(kakaoThumbnail);
					user.setKakaoProfileImageURL(kakaoProfileImageURL);
				}
			}
		}
		
		if ( user.getUserNo() != null && !user.getUserNo().isEmpty())
		{
			logger.info( "[" + logIdentifier + "]: userNo is not null.");
			User tempUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUserByUserNo", user);
			if ( tempUser == null || tempUser.getUserID() == null || tempUser.getUserID().isEmpty() )
			{
				// 신규회원
				user.setUserNo(null);
				logger.info( "[" + logIdentifier + "]: userNo set null.");
			}
			else
			{
				// 기존회원
				addInfo.put("alreadyExistsYN", "Y");
				addInfo.put("registerUserFinished", getRegisterUserFinishedYN(tempUser, appVersion) );
				
				// 게스트에서 카카오 연동을 할 경우.
				if ( !Util.isEmptyString( user.getKakaoID() ) )
				{
					sqlSession.update("com.tessoft.nearhere.taxi.updateKakaoInfo", user);
					userType = "Normal";
				}
				
				// 게스트에서 페이스북 연동을 할 경우.
				if ( !Util.isEmptyString( user.getFacebookID() ) )
				{
					sqlSession.update("com.tessoft.nearhere.taxi.updateFacebookInfo", user);
					userType = "Normal";
				}
				
				user = selectUser( tempUser, false );
				
				String profilePoint = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectProfilePoint", user);
				if ( profilePoint == null || "".equals( profilePoint ) )
					profilePoint = "0";
				user.setProfilePoint(profilePoint);
			}
		}
		
		// 신규일 경우.(게스트모드 포함)
		if ( user.getUserNo() == null || user.getUserNo().isEmpty())
		{
			logger.info( "[" + logIdentifier + "]: userNo is null.");

			// 신규 user 생성해서 리턴된 userNo 앞에 'user' 를 붙여서 userID 로 사용.
			sqlSession.insert("com.tessoft.nearhere.taxi.insertUser", user);
			user.setUserID( "user" + user.getUserNo() );

			logger.info( "[" + logIdentifier + "]: new userID:" + user.getUserID() );
			
			// 해당 userID 가 있는지 검사.
			User existingUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);

			// 해당 userID 가 이미 존재하면, userID 를 랜덤하게 다르게 변경해서 다시 검사. 5회
			int retryCount = 0; 
			while ( existingUser != null && !"".equals( existingUser.getUserID() ) )
			{
				if ( retryCount == 5 ) break;

				Random rand = new Random();
				int  n = rand.nextInt(99998) + 1;
				user.setUserID("user" + n );
				existingUser = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user);
				retryCount++;
			}
			
			logger.info( "[" + logIdentifier + "]: retryCount:" + retryCount );
			
			// 임시 userID 생성완료. userID db 업데이트
			sqlSession.update("com.tessoft.nearhere.taxi.updateUserID", user);
		}
		
		sqlSession.delete("com.tessoft.nearhere.taxi.deleteUserToken", user );
		String randomSeed = Util.getRandomSeed();
		String hashString = Util.getShaHashString( user.getUserID() + randomSeed );
		HashMap userHash = new HashMap();
		userHash.put("seed", randomSeed );
		userHash.put("hash", hashString );
		userHash.put("userID", user.getUserID() );
		sqlSession.insert("com.tessoft.nearhere.taxi.insertUserToken", userHash );
		
		addInfo.put("hash", hashString );
		
		user.setUserToken(hashString);
		user.setType( userType );
		sqlSession.update("com.tessoft.nearhere.taxi.updateUserType", user );
		
		response.setData( user );
		response.setData2( addInfo );
	}
	
	public String getRegisterUserFinishedYN(User user, double appVersion) {
		String registerUserFinished = "Y";
		
		HashMap registerUserInfo = sqlSession.selectOne("com.tessoft.nearhere.taxi.registerUserFinishedInfo", user);
		if ( Util.isEmptyString( registerUserInfo.get("sex") ))
			registerUserFinished = "N";
		
		if ( Util.isEmptyString( registerUserInfo.get("userName") ))
			registerUserFinished = "N";
		
		if ( Util.isEmptyString( registerUserInfo.get("agreementUserID") ))
			registerUserFinished = "N";
		
		// 1.39 부터 카카오 ID 적용
//		if ( appVersion > 1.38 && Util.isEmptyString( registerUserInfo.get("kakaoID") ))
//			registerUserFinished = "N";
		
		if ( !"Y".equals( registerUserInfo.get("registerUserFinished") ) )
			registerUserFinished = "N";
		
		return registerUserFinished;
	}
	
	public User selectUser(User user, boolean bRequireMobileNo ) {
		user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
		
		if ( bRequireMobileNo == false )
			user.setMobileNo("");
		
		return user;
	}
}
