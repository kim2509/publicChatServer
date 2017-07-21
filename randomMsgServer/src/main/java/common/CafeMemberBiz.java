package common;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.Constants;
import com.dy.common.Util;

public class CafeMemberBiz extends CommonBiz{

	private static CafeMemberBiz cafeBiz = null;

	public static CafeMemberBiz getInstance( SqlSession sqlSession )
	{
		if ( CafeMemberBiz.cafeBiz == null )
			CafeMemberBiz.cafeBiz = new CafeMemberBiz( sqlSession );

		return CafeMemberBiz.cafeBiz;
	}
	
	public CafeMemberBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}

	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMemberListForManage(HashMap param)
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> cafeMemberList = sqlSession.selectList("com.tessoft.nearhere.cafe.member.getCafeMemberListForManage", param);
		return cafeMemberList;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMemberList(HashMap param)
	{
		List<HashMap> cafeMemberList = sqlSession.selectList("com.tessoft.nearhere.cafe.member.getCafeMemberList", param);
		return cafeMemberList;
	}
	
	@SuppressWarnings("rawtypes")
	public String getCafeMemberCount(HashMap param)
	{
		String cafeMemberCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.member.getCafeMemberCount", param);
		return cafeMemberCount;
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafeMemberType(HashMap param)
	{
		if ( Util.isEmptyForKey(param, "cafeID") || 
			Util.isEmptyForKey(param, "userID") ||
			Util.isEmptyForKey(param, "memberType") ) return -1;
		
		if ( "1".equals( param.get("memberType") ) )
			param.put("memberType", Constants.CafeMemberTypeOperator);
		else
			param.put("memberType", "회원");
		
		return sqlSession.update("com.tessoft.nearhere.cafe.member.updateCafeMemberType", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int updateMemberAsDeleted(HashMap param)
	{
		if ( Util.isEmptyForKey(param, "cafeID") || 
			Util.isEmptyForKey(param, "userID") ) return -1;
		
		return sqlSession.update("com.tessoft.nearhere.cafe.member.updateMemberAsDeleted", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int registerCafeMember( HashMap param )
	{
		if ( Util.isEmptyForKey(param, "memberType") )
			param.put("memberType", "회원");
		
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.member.insertCafeMember", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int cancelCafeMember( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.member.deleteCafeMember", param);
		return result;
	}
}
