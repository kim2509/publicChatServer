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
					operatorID, regID, msg, url, "알림센터", "newMember", cafeID );
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
					operatorID, regID, msg, url, "알림센터", "memberLeave", cafeID );
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
			
			String url = Constants.getServerURL() + "/boardPost/detail/" + postNo + "?isApp=Y";
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification("댓글 알림", 
					targetUserID, regID, userName + ":" + content, url, "게시 글 상세", "newCafeBoardPostReply", postNo );
		}
	}
}
