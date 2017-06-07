package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.User;

public class CafeBoardPostBiz extends CommonBiz{

	private static CafeBoardPostBiz cafeBiz = null;

	public static CafeBoardPostBiz getInstance( SqlSession sqlSession )
	{
		if ( CafeBoardPostBiz.cafeBiz == null )
			CafeBoardPostBiz.cafeBiz = new CafeBoardPostBiz( sqlSession );

		return CafeBoardPostBiz.cafeBiz;
	}
	
	public CafeBoardPostBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getBoardPostList(HashMap param)
	{
		List<HashMap> postList = sqlSession.selectList("com.tessoft.nearhere.cafe.board.getBoardPostList", param);
		return postList;
	}
	
	@SuppressWarnings("rawtypes")
	public int getBoardPostListCount(HashMap param)
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.board.getBoardPostListCount", param);
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeBoardPostInfo(HashMap param)
	{
		HashMap postInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.board.getCafeBoardPostInfo", param);
		return postInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeBoardPostContent(HashMap param)
	{
		List<HashMap> content = sqlSession.selectList("com.tessoft.nearhere.cafe.board.getCafeBoardPostContent", param);
		return content;
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCafeBoardPostMaster( HashMap param ) throws Exception
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.board.insertCafeBoardPostMaster", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCafeBoardPostDetail( HashMap param ) throws Exception
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.board.insertCafeBoardPostDetail", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafeBoardPostMaster( HashMap param ) throws Exception
	{
		int result = sqlSession.update("com.tessoft.nearhere.cafe.board.updateCafeBoardPostMaster", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafeBoardPostDetail( HashMap param ) throws Exception
	{
		int result = sqlSession.update("com.tessoft.nearhere.cafe.board.updateCafeBoardPostDetail", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteCafeBoardPost( HashMap param )
	{
		CafeLocationBiz.getInstance(sqlSession).deleteCafeLocation(param);
		int result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeBoardReplies", param);
		result += sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeBoardPostDetailEach", param);
		result += sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeBoardPostEach", param);
		
		return result;
	}
}
