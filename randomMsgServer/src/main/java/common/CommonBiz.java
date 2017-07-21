package common;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.dy.common.Constants;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class CommonBiz {

	protected static Logger logger = Logger.getLogger(CommonBiz.class.getName());

	protected ObjectMapper mapper = null;
	protected SqlSession sqlSession = null;
	private Sender sender = null;
	
	public CommonBiz( SqlSession sqlSession )
	{
		mapper = new ObjectMapper();
		this.sqlSession = sqlSession;
		sender = new Sender( Constants.GCM_API_KEY );
	}
	
	public String sendGCMPush( String regID, Message message ) throws Exception
	{
		Result pushResult = sender.send(message, regID , Constants.push_retry_count);
		
		if ( pushResult == null ) return "";
		
		return pushResult.toString();
	}
	
	public String getRegionName( String name, String level )
	{
		String result = name;
		
		if ("1".equals(level))
		{
			if ( result.startsWith("충청북") || result.startsWith("충북") )
				return "충청북도";
			else if ( result.startsWith("충청남") || result.startsWith("충남") )
				return "충청남도";
			else if ( result.startsWith("경상북") || result.startsWith("경북") )
				return "경상북도";
			else if ( result.startsWith("경상남") || result.startsWith("경남") )
				return "경상남도";
			else if ( result.startsWith("전라북") || result.startsWith("전북") )
				return "전라북도";
			else if ( result.startsWith("전라남") || result.startsWith("전남") )
				return "전라남도";
			else if ( result.startsWith("제주") )
				return "제주도";
			else if ( result.startsWith("세종특별자치시"))
				return "세종시";	
			
			result = result.replaceAll("특별시", "");
			result = result.replaceAll("광역시", "");
		}

		/*
		if ( !"대구".equals( result ) && result.endsWith("구") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("군") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("시") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("동") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("읍") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("면") )
			result = result.substring(0,  result.length() - 1 );
		else if ( result.endsWith("리") )
			result = result.substring(0,  result.length() - 1 );
		
		result = result.replaceAll("\\d","");	
		*/
		
		return result;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public HashMap getRegionInfo( String address ) throws Exception
	{
		HashMap regionInfo = new HashMap();
		
		if ( Util.isEmptyString(address) ) return null;
		
		address = Util.stripBunji( address );
		
		String[] regionTokens = Util.splitRegions( address );
		
		if ( regionTokens == null || regionTokens.length < 1 ) return null;
		
		for ( int i = 0; i < regionTokens.length; i++ )
		{
			String level = String.valueOf(i + 1);
			HashMap param = new HashMap();
			
			String regionName = regionTokens[i].trim();
			param.put("regionName", getRegionName( regionName, level ) );
			param.put("level", level);
			
			HashMap region = null;
			
			if ("1".equals(level) )
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName3", param);
			else if ("2".equals(level) && regionInfo.get("lRegion") != null )
			{
				param.put("parentNo", ((HashMap) regionInfo.get("lRegion")).get("regionNo") );
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName4", param);
			}
			else if ("3".equals(level) && regionInfo.get("mRegion") != null )
			{
				param.put("parentNo", ((HashMap) regionInfo.get("mRegion")).get("regionNo") );
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName4", param);
			}
			else if ("4".equals(level) && regionInfo.get("sRegion") != null )
			{
				param.put("parentNo", ((HashMap) regionInfo.get("sRegion")).get("regionNo") );
				region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName4", param);
			}
			
			if ( region != null )
			{
				if ( i == 0 )
					regionInfo.put("lRegion", region );
				else if ( i == 1 )
					regionInfo.put("mRegion", region );
				else if ( i == 2 )
					regionInfo.put("sRegion", region );
				else if ( i == 3 )
					regionInfo.put("tRegion", region );
				
				// 가장 작은 단위의 region 이 되게끔 설정.
				regionInfo.put("region", region);
			}
		}
		
		return regionInfo;
	}
}
