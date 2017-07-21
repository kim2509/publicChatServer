package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.User;

public class TaxiBiz extends CommonBiz{

	private static TaxiBiz cafeBiz = null;

	public static TaxiBiz getInstance( SqlSession sqlSession )
	{
		if ( TaxiBiz.cafeBiz == null )
			TaxiBiz.cafeBiz = new TaxiBiz( sqlSession );

		return TaxiBiz.cafeBiz;
	}
	
	public TaxiBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
}
