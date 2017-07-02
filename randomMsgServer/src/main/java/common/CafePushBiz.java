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
		String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + Util.getStringFromHash(param, "userID");
		
		List<HashMap> operatorList = getCafeOperatorList(param);
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		for ( int i = 0; i < operatorList.size(); i++ )
		{
			String regID = Util.getStringFromHash( operatorList.get(i), "regID");
			String userName = Util.getStringFromHash( userInfo, "userName");
			String cafeName = Util.getStringFromHash( operatorList.get(i), "cafeName");
			String msg = userName + "님이 " + cafeName + "카페에 가입하셨습니다.";
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification("신규회원 알림", 
					Util.getStringFromHash(param, "userID"), regID, msg, url, "알림센터");
		}
	}
	
	@SuppressWarnings("rawtypes")
	public void sendCafeMemberLeaveNotification(HashMap param) throws Exception
	{
		String url = Constants.getServerURL() + "/notification/list.do?isApp=Y&userID=" + Util.getStringFromHash(param, "userID");
		
		List<HashMap> operatorList = getCafeOperatorList(param);
		HashMap userInfo = UserBiz.getInstance(sqlSession).getUserInfo(Util.getStringFromHash(param, "userID"));
		for ( int i = 0; i < operatorList.size(); i++ )
		{
			String regID = Util.getStringFromHash( operatorList.get(i), "regID");
			String userName = Util.getStringFromHash( userInfo, "userName");
			String cafeName = Util.getStringFromHash( operatorList.get(i), "cafeName");
			String msg = userName + "님이 " + cafeName + "카페를 탈퇴하셨습니다.";
			
			MessageBiz.getInstance(sqlSession).sendCafeNotification("회원탈퇴 알림", 
					Util.getStringFromHash(param, "userID"), regID, msg, url, "알림센터");
		}
	}
}
