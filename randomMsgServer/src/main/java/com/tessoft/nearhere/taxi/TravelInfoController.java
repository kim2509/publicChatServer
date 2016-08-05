package com.tessoft.nearhere.taxi;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.dy.common.Constants;
import com.dy.common.Util;

@Controller
public class TravelInfoController extends BaseController{

	String serverKey = "PRem9doP9qUgRcGuqNrfphUA0nH7IQfN7OXu%2BaDIdwpAWahZXfOrFNO8M6hhFU6ZIO%2BCwYQqTNb0FFNFOKp6Zg%3D%3D";

	@SuppressWarnings({ "unused", "unused" })
	@RequestMapping( value ="/travelInfo/index.do")
	public ModelAndView index ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			String url = "http://api.visitkorea.or.kr/openapi/service";

			String apiName = "/rest/KorService/areaCode";

			HttpClient client = HttpClientBuilder.create().build();
			HttpGet req = new HttpGet(url + apiName + "?ServiceKey=" + serverKey + "&numOfRows=20&pageSize=10&pageNo=1&startPage=1&MobileOS=ETC&MobileApp=공유자원포털");

			// add request header
			HttpResponse res = client.execute(req);

			BufferedReader rd = new BufferedReader(
					new InputStreamReader(res.getEntity().getContent(), "utf-8"));

			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}

			DocumentBuilderFactory factory =
					DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			ByteArrayInputStream input =  new ByteArrayInputStream(
					result.toString().getBytes("UTF-8"));
			Document doc = builder.parse(input);

			XPath xPath =  XPathFactory.newInstance().newXPath();
				
			String resultCode = xPath.compile("response/header/resultCode").evaluate(doc);
			String resultMsg = xPath.compile("response/header/resultMsg").evaluate(doc);
			String pageNo = xPath.compile("response/body/pageNo").evaluate(doc);
			String numOfRows = xPath.compile("response/body/numOfRows").evaluate(doc);
			String totalCount = xPath.compile("response/body/totalCount").evaluate(doc);
			
			//read a nodelist using xpath
			NodeList nodeList = (NodeList) xPath.compile("/response/body/items/item").evaluate(doc, XPathConstants.NODESET);
			
			for ( int i = 0; i < nodeList.getLength(); i++ )
			{
				String code = xPath.compile("code").evaluate(nodeList.item(i));
				String name = xPath.compile("name").evaluate(nodeList.item(i));
				logger.info( "[" + code + "]" + name );	
			}
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}

		return new ModelAndView("travelInfo/index", model);
	}

	@SuppressWarnings({ "unused", "unused" })
	@RequestMapping( value ="/travelInfo/detail.do")
	public ModelAndView detail ( HttpServletRequest request, HttpServletResponse response, 
			String contentTypeID , String contentID , ModelMap model) throws IOException
	{
		try
		{
			if ( !Util.isEmptyString(contentTypeID) && !Util.isEmptyString(contentID) )
			{
				HashMap params = new HashMap();
				params.put("contentTypeId", contentTypeID);
				params.put("contentId", contentID);
				
				HashMap detailIntro = callAPI( "detailIntro", params );
				model.addAttribute("detailIntro", detailIntro);
				
				HashMap detailImage = callAPI( "detailImage", params );
				model.addAttribute("detailImage", detailImage);
				
				params.put("defaultYN", "Y");
				params.put("mapImageYN", "Y");
				params.put("firstImageYN", "Y");
				params.put("areacodeYN", "Y");
				params.put("catcodeYN", "Y");
				params.put("addrinfoYN", "Y");
				params.put("mapinfoYN", "Y");
				params.put("overviewYN", "Y");
				params.put("transGuideYN", "Y");
				HashMap detailCommon = callAPI( "detailCommon", params );
				model.addAttribute("detailCommon", detailCommon );
			}
			
		}
		catch(Exception ex )
		{
			logger.error( ex );
		}
		
		return new ModelAndView("travelInfo/detail");
	}

	private HashMap callAPI( String apiName, HashMap params ) throws Exception {
		String url = "http://api.visitkorea.or.kr/openapi/service";
		String apiURL = "/rest/KorService/" + apiName;
		url += apiURL + "?ServiceKey=" + serverKey + "&numOfRows=999&pageSize=999&pageNo=1&startPage=1&MobileOS=ETC";
		
		Iterator it = params.keySet().iterator();
		while( it.hasNext() )
		{
			String key = it.next().toString();
			url += "&" + key + "=" + params.get(key);	
		}
		
		url += "&MobileApp=공유자원포털";
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet req = new HttpGet(url);
		
		HttpHost proxy = new HttpHost("localhost", 8888);
		CloseableHttpClient wf_client = HttpClients.custom().setProxy(proxy).build();

		// add request header
		HttpResponse res = null;

		if ( Constants.bReal )
			res = client.execute(req);
		else
			res = wf_client.execute(req);

		BufferedReader rd = new BufferedReader(
				new InputStreamReader(res.getEntity().getContent(), "utf-8"));

		StringBuffer resultText = new StringBuffer();
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
			
		String resultCode = xPath.compile("response/header/resultCode").evaluate(doc);
		String resultMsg = xPath.compile("response/header/resultMsg").evaluate(doc);
		String pageNo = xPath.compile("response/body/pageNo").evaluate(doc);
		String numOfRows = xPath.compile("response/body/numOfRows").evaluate(doc);
		String totalCount = xPath.compile("response/body/totalCount").evaluate(doc);
		
		HashMap result = new HashMap();
		
		result.put("resultCode", resultCode);
		result.put("resultMsg", resultMsg);
		result.put("pageNo", pageNo);
		result.put("numOfRows", numOfRows);
		result.put("totalCount", totalCount);
		
		//read a nodelist using xpath
		NodeList nodeList = (NodeList) xPath.compile("/response/body/items/item").evaluate(doc, XPathConstants.NODESET);
		
		ArrayList items = new ArrayList();
		
		for ( int i = 0; i < nodeList.getLength(); i++ )
		{
			Node node = nodeList.item(i);

			HashMap itemDetail = new HashMap();
			for ( int j = 0; j < node.getChildNodes().getLength(); j++ )
			{
				Node childNode = node.getChildNodes().item(j);
				itemDetail.put(childNode.getNodeName(), childNode.getTextContent());
				logger.info( childNode.getNodeName() + " " + childNode.getTextContent());
			}
			
			items.add(itemDetail);
		}
		
		result.put("items", items);
		
		return result;
	}
}
