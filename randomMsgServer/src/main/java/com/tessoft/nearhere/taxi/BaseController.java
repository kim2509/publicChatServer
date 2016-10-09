package com.tessoft.nearhere.taxi;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.dy.common.Constants;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.User;
import com.nearhere.domain.UserPushMessage;

@Controller
public class BaseController {

	@Autowired
	public SqlSession sqlSession;
	protected static Logger logger = Logger.getLogger(BaseController.class.getName());
	ObjectMapper mapper = null;
	
	public BaseController()
	{
		mapper = new ObjectMapper();
	}
	
	private SecureRandom random = new SecureRandom();
	
	protected String getLogIdentifier() {
		return new BigInteger(130, random).toString(32);
	}
	
	public static String makeUrl(HttpServletRequest request)
	{
		return request.getRequestURL().toString() + "?" + request.getQueryString();
	}
	
	protected String requestLogging(HttpServletRequest request, String bodyString) {
		
		String logIdentifier = "";
		
		try
		{
			logIdentifier = getLogIdentifier();
			logger.info( "REQUEST URL [" + request.getRemoteAddr() + "][" + logIdentifier + "]:" + makeUrl( request ) );
			logger.info( "REQUEST[" + logIdentifier + "]:" + bodyString );	
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return logIdentifier;
	}

	protected User selectUser(User user) {
		user = sqlSession.selectOne("com.tessoft.nearhere.taxi.selectUser", user );
		return user;
	}
	
	protected void sendPushMessage( User receiver, String type, String msg, String param, boolean bSendPush ) throws Exception
	{
		try
		{
			logger.info( "sendPushMessage[" + bSendPush + "]: " + mapper.writeValueAsString(receiver) );

			receiver = selectUser(receiver);

			UserPushMessage pushMessage = new UserPushMessage();
			pushMessage.setToUserID( receiver.getUserID() );
			pushMessage.setType(type);
			if ( "message".equals( type ) )
				pushMessage.setMessage("메시지가 도착하였습니다.");
			else if ( "postReply".equals( type ) )
				pushMessage.setMessage("댓글이 등록되었습니다.");
			else if ("newPostByDistance".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("event".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("eventssl".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("inquiryUser".equals( type ) )
				pushMessage.setMessage( msg );
			else if ("locationUpdate".equals( type ) )
				pushMessage.setMessage( msg );

			pushMessage.setParam1(param);
			
			int result = 0;
			
			if ( !"locationUpdate".equals( type ) )
			{
				result = sqlSession.insert("com.tessoft.nearhere.taxi.insertUserPushMessage", pushMessage );
				logger.info( "insertUserPushMessage result : " + result );
			}

			if ( bSendPush )
			{
				Sender sender = new Sender( Constants.GCM_API_KEY );

				Message message = null;

				if ( !Util.isEmptyString( receiver.getRegID() ) )
				{
					if ( "message".equals( type ) )
					{
						message = new Message.Builder().addData("title", pushMessage.getMessage() )
								.addData("message",  msg )
								.addData("type",  type )
								.addData("toUserID",  receiver.getUserID() )
								.addData("fromUserID",  param )
								.build();	
					}
					else if ( "postReply".equals( type ) )
					{
						message = new Message.Builder().addData("title", pushMessage.getMessage() )
								.addData("message",  msg )
								.addData("type",  type )
								.addData("postID",  param )
								.build();	
					}
					else if ( "newPostByDistance".equals( type ) )
					{
						message = new Message.Builder().addData("title", "신규 합승정보 알림" )
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("postID",  param )
								.build();	
					}
					else if ( "event".equals( type ) || "eventssl".equals( type ) )
					{
						message = new Message.Builder().addData("title", "이벤트")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("eventSeq",  param )
								.addData("pushNo",  pushMessage.getPushNo() )
								.addData("sound", "on")
								.addData("vibrate", "on")
								.build();
					}
					else if ( "inquiryUser".equals( type ) )
					{
						message = new Message.Builder().addData("title", "프로필 조회 알림")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("userID",  param )
								.addData("pushNo",  pushMessage.getPushNo() )
								.build();
					}
					else if ( "locationUpdate".equals( type ) )
					{
						message = new Message.Builder().addData("title", "프로필 조회 알림")
								.addData("message",  pushMessage.getMessage() )
								.addData("type",  type )
								.addData("userID",  param )
								.addData("pushNo",  pushMessage.getPushNo() == null ? "": pushMessage.getPushNo() )
								.build();
					}

					logger.info( "push message[" + receiver.getRegID() + "]:" + message.toString() );
					
					Result pushResult = sender.send(message, receiver.getRegID() , Constants.push_retry_count);

					logger.info( "push result[" + receiver.getRegID() + "]:" + pushResult.toString() + 
							" errorCode:[" + pushResult.getErrorCodeName() + "]");
					
					try
					{
						if ( "NotRegistered".equalsIgnoreCase( pushResult.getErrorCodeName() ) )
						{
							sqlSession.update("com.tessoft.nearhere.taxi.updateUserAsDeleted", receiver );
							logger.info( "update user as deleted.[" + receiver.getUserID() + "]");
						}
					}
					catch( Exception ex )
					{
						logger.error( new Exception("update user as deleted error", ex ));
					}
				}
				else
				{
					logger.info( "push regID is null." );		
				}
			}
			
		}
		catch( Exception ex )
		{
			logger.error( ex );;
		}
	}
	
	public String getFullAddress( String latitude, String longitude ) throws Exception
	{
		String url = "http://apis.daum.net/maps/coord2detailaddr?apikey=" + Constants.DAUM_API_KEY + "&x=" + longitude + "&y=" + latitude + "&inputCoordSystem=WGS84&output=xml";
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet req = new HttpGet(url.trim());
		
		StringBuffer resultText = new StringBuffer();
		
		// add request header
		HttpResponse res = null;

		if ( Constants.bReal )
			res = client.execute(req);
		else
		{
			HttpHost proxy = new HttpHost("localhost", 8888);
			CloseableHttpClient wf_client = HttpClients.custom().setProxy(proxy).build();
			res = wf_client.execute(req);
		}

		BufferedReader rd = new BufferedReader(
				new InputStreamReader(res.getEntity().getContent(), "utf-8"));

		String line = "";
		while ((line = rd.readLine()) != null) {
			resultText.append(line);
		}
		
		DocumentBuilderFactory factory =
				DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		ByteArrayInputStream input =  new ByteArrayInputStream(
				resultText.toString().getBytes("UTF-8"));
		Document doc = builder.parse(input);

		XPath xPath =  XPathFactory.newInstance().newXPath();
		
		NodeList list = doc.getElementsByTagName("old").item(0).getChildNodes();

		String address = "";
		
		for ( int i = 0; i < list.getLength(); i++ )
		{
			Node node = list.item(i);
			if ("name".equals(node.getNodeName()) )
			{
				address = node.getAttributes().item(0).getNodeValue();
				break;
			}
			
		}
		
		return address;
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
			}
		}
		
		return regionInfo;
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
	
	protected int insertHistory( String name, String param1, String param2, String param3, String param4 )
	{
		try
		{
			HashMap params = new HashMap();
			params.put("name", name);
			params.put("param1", param1);
			params.put("param2", param2);
			params.put("param3", param3);
			params.put("param4", param4);
			return sqlSession.insert("com.tessoft.nearhere.taxi.admin.insertHistory", params);
		}
		catch( Exception ex )
		{
			logger.error(ex);
			return -1;
		}
	}
}
