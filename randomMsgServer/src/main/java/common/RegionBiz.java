package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class RegionBiz extends CommonBiz{

	private static RegionBiz regionBiz = null;

	public static RegionBiz getInstance( SqlSession sqlSession )
	{
		if ( RegionBiz.regionBiz == null )
			RegionBiz.regionBiz = new RegionBiz( sqlSession );

		return RegionBiz.regionBiz;
	}
	
	public RegionBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	public String getRegionInfoByRegionNo( String regionNo )
	{
		String regionInfo = sqlSession.selectOne("com.tessoft.nearhere.region.getRegionInfoByRegionNo", regionNo);
		return regionInfo;
	}
	
	public List<String> getFavoriteRegionNoByUserID( String userID )
	{
		List<String> regionInfo = sqlSession.selectList("com.tessoft.nearhere.region.getFavoriteRegionNoByUserID", userID);
		return regionInfo;
	}
}
