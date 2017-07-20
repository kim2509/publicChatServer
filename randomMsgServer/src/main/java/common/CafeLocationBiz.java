package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.User;

public class CafeLocationBiz extends CommonBiz{

	private static CafeLocationBiz cafeBiz = null;

	public static CafeLocationBiz getInstance( SqlSession sqlSession )
	{
		if ( CafeLocationBiz.cafeBiz == null )
			CafeLocationBiz.cafeBiz = new CafeLocationBiz( sqlSession );

		return CafeLocationBiz.cafeBiz;
	}
	
	public CafeLocationBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteCafeLocation( HashMap param )
	{
		int result = sqlSession.delete("com.tessoft.nearhere.cafe.location.deleteCafeLocationByPostNo", param);
		
		return result;
	}
}
