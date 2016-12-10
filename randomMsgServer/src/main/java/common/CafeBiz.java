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
	
	public List<HashMap> getMyCafeList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getMyCafeList", userID);
		return myCafeList;
	}
	
	public List<HashMap> getUpcomingCafeMeetingList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getUpcomingCafeMeetingList", userID);
		return myCafeList;
	}
	
	public int makeCafe( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.makeCafe", param);
		return result;
	}
}
