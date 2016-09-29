package com.tessoft.nearhere.taxi;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.codehaus.jackson.type.TypeReference;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

@Controller
public class NewsController extends BaseController{

	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/news/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model ) throws IOException
	{
		try
		{
			List list = (List) sqlSession.selectList("com.tessoft.nearhere.region.getFavoriteRegionByUser", userID );
			String favoriteRegions = "";
			
			if ( list != null && list.size() > 0 )
			{
				for ( int i = 0; i < list.size(); i++ )
				{
					HashMap region = (HashMap) list.get(i);
					favoriteRegions += region.get("regionName1") + ",";
				}
				
				if ( favoriteRegions.endsWith(",") )
					favoriteRegions = favoriteRegions.substring(0, favoriteRegions.length() - 1 );
			}
			else
			{
				HashMap region = new HashMap();
				region.put("regionNo", "40");
				region.put("regionName", "서울");
				list.add(region);
				
				region = new HashMap();
				region.put("regionNo", "18");
				region.put("regionName", "경기도");
				list.add(region);
			}
			
			request.setAttribute("favoriteRegions", favoriteRegions);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return new ModelAndView("news/list", model);
	}
	
	XPath xPath =  XPathFactory.newInstance().newXPath();
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/news/getRegionNews.do")
	public @ResponseBody APIResponse getRegionNews( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		StringBuffer resultText = new StringBuffer();
		
		try
		{
			HashMap requestHash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String url = "https://openapi.naver.com";
			String apiURL = "/v1/search/news.xml";
			url += apiURL + "?query=" + requestHash.get("regionName") + "&display=10&start=1&sort=sim";
			
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet req = new HttpGet(url);
			
			req.addHeader("X-Naver-Client-Id", "CWvII64L7EVDwJBZhXqo");
			req.addHeader("X-Naver-Client-Secret", "xhRYo0GFE_");
			req.addHeader("Content-Type", "application/xml");
			
			// add request header
			HttpResponse res = null;

			res = client.execute(req);

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

			NodeList nodeList = (NodeList) xPath.compile("/rss/channel/item").evaluate(doc, XPathConstants.NODESET);
			
			ArrayList result = new ArrayList();
			for ( int i = 0; i < nodeList.getLength(); i++ )
			{
				HashMap hash = new HashMap();
				hash.put("title", getXmlText("title", nodeList.item(i) ) );
				hash.put("originallink", getXmlText("originallink", nodeList.item(i)));
				hash.put("link", getXmlText("link", nodeList.item(i)));
				hash.put("description", getXmlText("description", nodeList.item(i)));
				hash.put("pubDate", getXmlText("pubDate", nodeList.item(i)));
				result.add(hash);
			}
			
			response.setData( result );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
	
	private String getXmlText( String keyName, Object obj ) throws Exception
	{
		String result = xPath.compile(keyName).evaluate(obj);
		result = result.replaceAll("&gt;", ">");
		result = result.replaceAll("&lt;", "<");
		return result;
	}
}
