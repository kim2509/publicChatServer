package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.ErrorCode;
import com.nearhere.domain.User;

public class CafeBiz extends CommonBiz{

	private static CafeBiz cafeBiz = null;

	public static CafeBiz getInstance( SqlSession sqlSession )
	{
		if ( CafeBiz.cafeBiz == null )
			CafeBiz.cafeBiz = new CafeBiz( sqlSession );

		return CafeBiz.cafeBiz;
	}
	
	public CafeBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getMyCafeList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getMyCafeList", userID);
		return myCafeList;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getUpcomingCafeMeetingList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getUpcomingCafeMeetingList", userID);
		return myCafeList;
	}
	
	@SuppressWarnings("rawtypes")
	public int makeCafe( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.makeCafe", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeMainInfo(HashMap param)
	{
		HashMap cafeMainInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeMainInfo", param);
		return cafeMainInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafePublicMeetingList(HashMap param)
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafePublicMeetingList", param);
		return myCafeList;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMemberList(HashMap param)
	{
		List<HashMap> cafeMemberList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeMemberList", param);
		return cafeMemberList;
	}
	
	@SuppressWarnings("rawtypes")
	public String getCafeMemberCount(HashMap param)
	{
		String cafeMemberCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeMemberCount", param);
		return cafeMemberCount;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeBoardList(HashMap param)
	{
		List<HashMap> boardList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeBoardList", param);
		return boardList;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeBoardInfo(HashMap param)
	{
		HashMap boardInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeBoardInfo", param);
		return boardInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getBoardPostList(HashMap param)
	{
		List<HashMap> postList = sqlSession.selectList("com.tessoft.nearhere.cafe.getBoardPostList", param);
		return postList;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeBoardPostInfo(HashMap param)
	{
		HashMap postInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeBoardPostInfo", param);
		return postInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeBoardPostReplyList(HashMap param)
	{
		List<HashMap> replyList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeBoardPostReplyList", param);
		return replyList;
	}
}
