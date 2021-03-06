package common;

import java.util.HashMap;
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
	
	public String getFullRegionNameByRegionNo( String regionNo )
	{
		String regionInfo = sqlSession.selectOne("com.tessoft.nearhere.region.getFullRegionNameByRegionNo", regionNo);
		return regionInfo.trim();
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getFavoriteRegionNoByUserID( String userID )
	{
		List<HashMap> regionInfo = sqlSession.selectList("com.tessoft.nearhere.region.getFavoriteRegionNoByUserID", userID);
		return regionInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getBigCities()
	{
		List<HashMap> cities = sqlSession.selectList("com.tessoft.nearhere.region.getBigCities");
		return cities;
	}
}
