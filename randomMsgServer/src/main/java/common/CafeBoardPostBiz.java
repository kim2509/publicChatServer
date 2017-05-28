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
}
