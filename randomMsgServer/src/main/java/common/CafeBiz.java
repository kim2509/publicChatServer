package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
	
	public List<HashMap> getFavoriteCafeMeetingList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getFavoriteCafeMeetingList", userID);
		return myCafeList;
	}
}
