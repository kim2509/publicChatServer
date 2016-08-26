package com.tessoft.nearhere.taxi;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
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
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.dy.common.Constants;
import com.dy.common.Util;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.User;
import com.nearhere.domain.UserPushMessage;

@Controller
public class AdminController extends BaseController{

	@RequestMapping( value ="/admin/index.do")
	public ModelAndView index ( HttpServletRequest request )
	{
		try
		{
			ModelAndView mav = new ModelAndView();
	        mav.setViewName("redirect:login.do");
			if ( request.getSession().getAttribute("id") == null )
				return mav;
		}
		catch(Exception ex )
		{
			logger.error(ex);
		}
		
		return new ModelAndView("admin/index");
	}
	
	@RequestMapping( value ="/admin/test.do")
	public ModelAndView test ( HttpServletRequest request )
	{
		try
		{
			HashMap result = getSidoList(0, null, null, null );
			
			List<HashMap> list = (List<HashMap>) result.get("items");
			
			for ( int i = 0; i < list.size(); i++ )
			{
				HashMap item = list.get(i);
				
				if ( "서울특별시".equals( item.get("sidonm") ) )
					item.put("sidonm", "서울");
				else if ( "세종특별자치시".equals( item.get("sidonm") ) )
					item.put("sidonm", "세종시");
				else if ( "제주특별자치도".equals( item.get("sidonm") ) )
					item.put("sidonm", "제주도");
				
				HashMap temp = new HashMap();
				temp.put("regionName", item.get("sidonm") );
				temp.put("level", 1);
				
				HashMap region = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getRegionByName", temp);
				
				if ( region == null )
				{
					logger.info("sido:" + item.get("sido") + " name:" + item.get("sidonm") );	
				}
				else
				{
					region.put("code", item.get("sido") );
					sqlSession.update("com.tessoft.nearhere.taxi.admin.updateCodeByRegionNo", region );
				}
			}
		}
		catch(Exception ex )
		{
			logger.error(ex);
		}
		
		return new ModelAndView("admin/test");
	}
	
	@SuppressWarnings("rawtypes")
	private HashMap getSidoList( int level, String sido, String sigungu, String lgdong ) throws Exception
	{
		String url = "";
		
		if ( level == 0 )
			url = "http://www.nsic.go.kr/ndsi/openapi/sido.do";
		else if ( level == 1 )
		{
			if ( Util.isEmptyString( sido ) ) return null;
			url = "http://www.nsic.go.kr/ndsi/openapi/sigungu.do?sido=" + sido;
		}
		else if ( level == 2 )
		{
			if ( Util.isEmptyString( sido ) || Util.isEmptyString( sigungu ) ) return null;
			url = "http://www.nsic.go.kr/ndsi/openapi/lgdong.do?sido=" + sido + "&sigungu=" + sigungu;
		}
		else if ( level == 3 )
		{
			if ( Util.isEmptyString( sido ) || Util.isEmptyString( sigungu ) || Util.isEmptyString( lgdong ) ) return null;
			url = "http://www.nsic.go.kr/ndsi/openapi/ri.do?sido=" + sido + "&sigungu=" + sigungu + "&lgdong=" + lgdong;
		}
			
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet req = new HttpGet(url);
		
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
		
		String elementName = "";
		if ( level == 0 )
			elementName = "sidolist";
		else if ( level == 1 )
			elementName = "sigungulist";
		else if ( level == 2 )
			elementName = "lgdonglist";
		else if ( level == 3 )
			elementName = "rilist";
		
		NodeList nodeList = (NodeList) xPath.compile("/list/" + elementName ).evaluate(doc, XPathConstants.NODESET);
		
		HashMap result = new HashMap();
		
		ArrayList items = new ArrayList();
		
		for ( int i = 0; i < nodeList.getLength(); i++ )
		{
			Node node = nodeList.item(i);

			HashMap itemDetail = new HashMap();
			for ( int j = 0; j < node.getChildNodes().getLength(); j++ )
			{
				Node childNode = node.getChildNodes().item(j);
				itemDetail.put(childNode.getNodeName(), childNode.getTextContent());
			}
			
			items.add(itemDetail);
		}
		
		result.put("items", items);
		
		return result;
	}
	
	@RequestMapping( value ="/admin/login.do")
	public ModelAndView login ( HttpServletRequest request )
	{
		try
		{
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			
			if ( "admin".equals( id ) && "fdsa4321".equals( pw ) )
			{
				ModelAndView mav = new ModelAndView();
				request.getSession().setAttribute("id", "admin");
				mav.setViewName("redirect:index.do");
				return mav;
			}
		}
		catch(Exception ex )
		{
			
		}
		
		return new ModelAndView("admin/login");
	}
	
	@RequestMapping( value ="/admin/allUsers.do")
	public ModelAndView allUsers ( HttpServletRequest request )
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			if ( request.getSession().getAttribute("id") == null )
			{
				mav.setViewName("redirect:login.do");
				return mav;
			}
			else
			{
				mav.setViewName("admin/allUsers");
				
				List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectAllUsers");
				mav.addObject("userList", userList);
			}
		}
		catch(Exception ex )
		{
			
		}
		
		return mav;
	}
	
	@RequestMapping( value ="/admin/allUsersOnMap.do")
	public ModelAndView allUsersOnMap ( HttpServletRequest request )
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			mav.setViewName("admin/allUsersOnMap");
		}
		catch(Exception ex )
		{
			
		}
		
		return mav;
	}
	
	@RequestMapping( value ="/admin/allUsersWithLocationAjax.do")
	public @ResponseBody APIResponse allUsersWithLocationAjax( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			List<HashMap> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectAllUsersWithLocation");
			
			response.setData(userList);
			
			response.setResCode("0000");
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendEventPushToAllUsers.do")
	public @ResponseBody APIResponse sendEventPushToAllUsers( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectUsersForEventPush");
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);
				
				logger.info( "[sendEventPushToAllUsers] sent to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );
				
				sendPushMessage(receiver, "event", requestInfo.get("title"), requestInfo.get("eventID"), true );
			}
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendEventPushToAllUsers]" + ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendEventPushToAdmin.do")
	public @ResponseBody APIResponse sendEventPushToAdmin( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectAdminForEventPush");
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);
				
				logger.info( "[sendEventPushToAdmin] sending to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );
				
				sendPushMessage(receiver, "event", requestInfo.get("title"), requestInfo.get("eventID"), true );
			}
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendEventPushToAdmin]" + ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendEventResult.do")
	public @ResponseBody APIResponse sendEventResult(HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			HashMap hash = new HashMap();
			
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap data = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			List<String> usersToSend = (List<String>) data.get("userList");
			String eventSeq = data.get("eventSeq").toString();
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.selectUsersWithUserID", usersToSend );
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				sendPushMessage(userList.get(i), "eventssl", data.get("title").toString() , eventSeq + "Result", true );
			}
			
			response.setData(userList);
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendLocationUpdateToUser.do")
	public @ResponseBody APIResponse sendLocationUpdateToUser( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			logger.error( "[sendLocationUpdateToUser] body String : " + bodyString );
			
			String logIdentifier = requestLogging(request, bodyString);
			
			logger.error( "[sendLocationUpdateToUser] logIdentifier : " + logIdentifier );
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			logger.error( "[sendLocationUpdateToUser] requestInfo : " + requestInfo );
			
			User user = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.selectUserForLocationUpdate", requestInfo );
			
			logger.error( "[sendLocationUpdateToUser]" + user );
			
			sendPushMessage( user, "locationUpdate", "합승 등록 이벤트를 진행합니다!!!", "", true );
			
			logger.error( "[sendLocationUpdateToUser] finished");
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendLocationUpdateToUser]" + ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/admin/sendLocationUpdateToAllUsers.do")
	public @ResponseBody APIResponse sendLocationUpdateToAllUsers( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			List<User> userList = sqlSession.selectList("com.tessoft.nearhere.taxi.admin.selectUsersForLocationUpdate");
			
			for ( int i = 0; i < userList.size(); i++ )
			{
				User receiver = userList.get(i);
				
				logger.info( "[sendEventPushToAllUsers] sent to user " + 
						receiver.getUserID() + " " + receiver.getUserName() );
				
				sendPushMessage(receiver, "locationUpdate", "합승 등록 이벤트를 진행합니다!!!", "", true );
			}
			
			response.setData( "success" );
		}
		catch(Exception ex )
		{
			logger.error( "[sendEventPushToAllUsers]" + ex.getMessage());
		}
		
		return response;
	}
}
