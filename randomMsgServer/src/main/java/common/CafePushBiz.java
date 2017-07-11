package common;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.Constants;
import com.dy.common.Util;

public class CafePushBiz extends CommonBiz{

	private static CafePushBiz cafeBiz = null;

	public static CafePushBiz getInstance( SqlSession sqlSession )
	{
		if ( CafePushBiz.cafeBiz == null )
			CafePushBiz.cafeBiz = new CafePushBiz( sqlSession );

		return CafePushBiz.cafeBiz;
	}
	
	public CafePushBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeOperatorList(HashMap param)
	{
		List<HashMap> operatorList = sqlSession.selectList("com.tessoft.nearhere.cafe.push.getCafeOperatorList", param);
		return operatorList;
	}
	
	@SuppressWarnings("rawtypes")
	public void sendCafeNewMemberNotification(HashMap param) throws Exception
	{
		
		String cafeID = Util.getStringFromHash(param, "cafeID");
		
		List<HashMap> operatorList = getCafeOperatorList(param);
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		for ( int i = 0; i < operatorList.size(); i++ )
		{
			String regID = Util.getStringFromHash( operatorList.get(i), "regID");
			String operatorID = Util.getStringFromHash( operatorList.get(i), "userID");
			
			String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + operatorID;
			
			String userName = Util.getStringFromHash( userInfo, "userName");
			String cafeName = Util.getStringFromHash( operatorList.get(i), "cafeName");
			String msg = userName + "님이 " + cafeName + "카페에 가입하셨습니다.";
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification("신규회원 알림", 
					operatorID, regID, msg, url, "알림센터", "newMember", cafeID, "N" );
		}
	}
	
	@SuppressWarnings("rawtypes")
	public void sendCafeMemberLeaveNotification(HashMap param) throws Exception
	{
		String cafeID = Util.getStringFromHash(param, "cafeID");
		
		List<HashMap> operatorList = getCafeOperatorList(param);
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		for ( int i = 0; i < operatorList.size(); i++ )
		{
			String regID = Util.getStringFromHash( operatorList.get(i), "regID");
			String operatorID = Util.getStringFromHash( operatorList.get(i), "userID");
			
			String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + operatorID;
			
			String userName = Util.getStringFromHash( userInfo, "userName");
			String cafeName = Util.getStringFromHash( operatorList.get(i), "cafeName");
			String msg = userName + "님이 " + cafeName + "카페를 탈퇴하셨습니다.";
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification("회원탈퇴 알림", 
					operatorID, regID, msg, url, "알림센터", "memberLeave", cafeID, "N" );
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getBoardPostWriterNRepliers(HashMap param)
	{
		List<HashMap> operatorList = sqlSession.selectList("com.tessoft.nearhere.cafe.push.getBoardPostWriterNRepliers", param);
		return operatorList;
	}
	
	@SuppressWarnings("rawtypes")
	public void sendPushToBoardPostWriterNRepliers(HashMap param) throws Exception
	{
		String postNo = Util.getStringFromHash( param, "postNo" );
		String content = Util.getStringFromHash( param, "content" );
		List<HashMap> targetUserList = getBoardPostWriterNRepliers(param);
		
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		String userName = Util.getStringFromHash( userInfo, "userName");
		
		for ( int i = 0; i < targetUserList.size(); i++ )
		{
			String regID = Util.getStringFromHash( targetUserList.get(i), "regID");
			String targetUserID = Util.getStringFromHash( targetUserList.get(i), "userID");
			
			String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + targetUserID;
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification("댓글 알림", 
					targetUserID, regID, userName + ":" + content, url, "알림센터", "newCafeBoardPostReply", postNo, "N" );
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getPublicMeetingPushTargetUsers(HashMap param)
	{
		List<HashMap> operatorList = sqlSession.selectList("com.tessoft.nearhere.cafe.push.getPublicMeetingPushTargetUsers", param);
		return operatorList;
	}
	
	@SuppressWarnings("rawtypes")
	public void sendPushToPublicMeetingTargetUsers(HashMap param) throws Exception
	{
		String cafeID = Util.getStringFromHash( param, "cafeID" );
		HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
		String cafeName = Util.getStringFromHash(cafeMainInfo, "cafeName");
		String meetingTitle = Util.getStringFromHash( param, "meetingTitle" );
		List<HashMap> targetUserList = getPublicMeetingPushTargetUsers(param);
		
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		
		for ( int i = 0; i < targetUserList.size(); i++ )
		{
			String regID = Util.getStringFromHash( targetUserList.get(i), "regID");
			String targetUserID = Util.getStringFromHash( targetUserList.get(i), "userID");
			
			String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + targetUserID;
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification( cafeName + "카페 정모 알림", 
					targetUserID, regID, meetingTitle , url, "알림센터", "newCafePublicMeeting", cafeID, "N" );
		}
	}
	
	@SuppressWarnings("rawtypes")
	public void sendCafeOperatorGrantPush(HashMap param) throws Exception
	{
		String cafeID = Util.getStringFromHash( param, "cafeID" );
		String userID = Util.getStringFromHash(param, "userID");
		HashMap cafeMainInfo = CafeBiz.getInstance(sqlSession).getCafeMainInfo(param);
		String cafeName = Util.getStringFromHash(cafeMainInfo, "cafeName");
		String memberType = Util.getStringFromHash(param, "memberType");
		
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		
		String regID = Util.getStringFromHash( userInfo, "regID");
		String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + userID;
		
		if ("운영자".equals(memberType) )
		{
			MessageBiz.getInstance(sqlSession).sendCafeNotification( cafeName + "카페 공지", 
					userID, regID, cafeName + "카페에 운영진으로 임명되었습니다." , url, "알림센터", "CafeOperatorGranted", cafeID, "N" );	
		}
		else if ("회원".equals(memberType) )
		{
			MessageBiz.getInstance(sqlSession).sendCafeNotification( cafeName + "카페 공지", 
					userID, regID, cafeName + "카페에 운영진에서 해제되었습니다." , url, "알림센터", "CafeOperatorGranted", cafeID, "N" );
		}
	}
}
