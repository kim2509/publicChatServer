package com.tessoft.nearhere;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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
import org.xml.sax.SAXException;

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

import common.RegionBiz;
import common.UserBiz;

@Controller
public class NewsController extends BaseController{

	@SuppressWarnings({ "unused", "rawtypes", "unchecked", "unchecked" })
	@RequestMapping( value ="/news/list.do")
	public ModelAndView list ( HttpServletRequest request, HttpServletResponse response , 
			String userID, ModelMap model, @CookieValue(value = "userToken", defaultValue = "") String userToken ) throws IOException
	{
		try
		{
			if ( Util.isEmptyString(userID) && !Util.isEmptyString(userToken) )
				userID = UserBiz.getInstance(sqlSession).getUserIDByUserToken(userToken);
			
			HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);

			if ( userInfo != null )
			{
				userID = userInfo.get("userID").toString();
				List<HashMap> myFavRegionList = RegionBiz.getInstance(sqlSession).getFavoriteRegionNoByUserID(userID);
				
				for ( int i = 0; i < myFavRegionList.size(); i++ )
				{
					String regionName = "";

					if ( !Util.isEmptyString(myFavRegionList.get(i).get("lRegionName") ))
						regionName += myFavRegionList.get(i).get("lRegionName").toString();
					if ( !Util.isEmptyString(myFavRegionList.get(i).get("mRegionName") ))
						regionName += " " + myFavRegionList.get(i).get("mRegionName").toString();
					if ( !Util.isEmptyString(myFavRegionList.get(i).get("sRegionName") ))
						regionName += " " + myFavRegionList.get(i).get("sRegionName").toString();
					if ( !Util.isEmptyString(myFavRegionList.get(i).get("tRegionName") ))
						regionName += " " + myFavRegionList.get(i).get("tRegionName").toString();
					
					myFavRegionList.get(i).put("regionName", regionName);
				}
				
				model.addAttribute("myFavRegionList", myFavRegionList);
				model.addAttribute("loginUserID", userID);
				model.addAttribute("loginUserType", Util.getStringFromHash(userInfo, "type"));
			}
			
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
		
		insertHistory("/news/list.do", userID , null , null, null );
		
		return new ModelAndView("news/list", model);
	}
	
	XPath xPath =  XPathFactory.newInstance().newXPath();
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/news/getRegionNews.do")
	public @ResponseBody APIResponse getRegionNews( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		StringBuffer resultText = new StringBuffer();
		HashMap requestHash = null;
		
		String regionName = "";
		
		try
		{
			requestHash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String startIndex = Util.getStringFromHash(requestHash, "startIndex");
			if ( Util.isEmptyString(startIndex))
				startIndex = "0";
			String showCount = Util.getStringFromHash(requestHash, "showCount");
			if ( Util.isEmptyString(showCount))
				showCount = "5";
			
			// 페이지수 기반이 아니라 수 기반이라서
			int pageIndex = Integer.parseInt(startIndex) + 1;
			int pageSize = Integer.parseInt(showCount);
			int itemIndex = 1 + ( pageSize * (pageIndex - 1 ));
			
			startIndex = String.valueOf(itemIndex);
						
			HashMap apiResult = callNaverAPI(resultText, requestHash, 1, showCount, startIndex );
			
			resultText = new StringBuffer();
			
			regionName = URLDecoder.decode( requestHash.get("regionName").toString(), "UTF-8");
			
			HashMap result = new HashMap();
			result.put("newsList", apiResult.get("items"));
			result.put("regionName", regionName );
			
			response.setData( result );
			response.setData2( Util.getStringFromHash(apiResult, "total") );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		insertHistory("/news/getRegionNews.do", regionName , null , null, null );
		
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping( value ="/news/getRegionBlogList.do")
	public @ResponseBody APIResponse getRegionBlogList( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		StringBuffer resultText = new StringBuffer();
		HashMap requestHash = null;
		
		String regionName = "";
		
		try
		{
			requestHash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String startIndex = Util.getStringFromHash(requestHash, "startIndex");
			if ( Util.isEmptyString(startIndex))
				startIndex = "1";
			String showCount = Util.getStringFromHash(requestHash, "showCount");
			if ( Util.isEmptyString(showCount))
				showCount = "5";
			
			// 페이지수 기반이 아니라 수 기반이라서
			int pageIndex = Integer.parseInt(startIndex);
			int pageSize = Integer.parseInt(showCount);
			int itemIndex = 1 + ( pageSize * (pageIndex - 1 ));
			
			startIndex = String.valueOf(itemIndex);
			
			resultText = new StringBuffer();
			
			HashMap apiResult = callNaverAPI(resultText, requestHash, 2, showCount, startIndex );
			
			regionName = URLDecoder.decode( requestHash.get("regionName").toString(), "UTF-8");
			
			HashMap result = new HashMap();
			result.put("blogList", apiResult.get("items"));
			result.put("regionName", regionName );
			
			response.setData( result );
			response.setData2( Util.getStringFromHash(apiResult, "total") );
			
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		insertHistory("/news/getRegionNews.do", regionName , null , null, null );
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	private HashMap callNaverAPI(StringBuffer resultText, HashMap requestHash, int type
			, String pageSize, String startIndex ) {
		
		HashMap result = new HashMap();
		
		try
		{
			String url = "https://openapi.naver.com";
			String apiURL = "";
			
			if ( type == 1 )
				apiURL = "/v1/search/news.xml";
			else if ( type == 2 )
				apiURL = "/v1/search/blog.xml";
			
			url += apiURL + "?query=" + requestHash.get("regionName") + "&display=" + pageSize + "&start=" + startIndex + "&sort=sim";
			
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet req = new HttpGet(url);
			
			logger.info("callNaver url:" + url);
			
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
			
			String responseString = resultText.toString();
			
			DocumentBuilderFactory factory =
					DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			ByteArrayInputStream input =  new ByteArrayInputStream(
					responseString.getBytes("UTF-8"));
			Document doc = builder.parse(input);

			String total = xPath.compile("/rss/channel/total").evaluate(doc);
			String start = xPath.compile("/rss/channel/start").evaluate(doc);
			String display = xPath.compile("/rss/channel/display").evaluate(doc);
			
			NodeList nodeList = (NodeList) xPath.compile("/rss/channel/item").evaluate(doc, XPathConstants.NODESET);
			
			ArrayList items = new ArrayList();
			for ( int i = 0; i < nodeList.getLength(); i++ )
			{
				HashMap hash = new HashMap();
				
				if ( type == 1 )
				{
					hash.put("title", getXmlText("title", nodeList.item(i), false ) );
					hash.put("originallink", getXmlText("originallink", nodeList.item(i), false));
					hash.put("link", getXmlText("link", nodeList.item(i) , false ));
					hash.put("description", getXmlText("description", nodeList.item(i), false ));
					hash.put("pubDate", getXmlText("pubDate", nodeList.item(i), true ));	
				}
				else if ( type == 2 )
				{
					hash.put("title", getXmlText("title", nodeList.item(i), false ) );
					hash.put("link", getXmlText("link", nodeList.item(i), false));
					hash.put("description", getXmlText("description", nodeList.item(i), false ));
					hash.put("bloggername", getXmlText("bloggername", nodeList.item(i), false ));
					hash.put("bloggerlink", getXmlText("bloggerlink", nodeList.item(i), false ));
				}
				
				items.add(hash);
			}
			
			result.put("total", total);
			result.put("start", start);
			result.put("display", display);
			result.put("items", items);
			
			return result;
		}
		catch( Exception ex )
		{
			logger.error(ex);
			return result;
		}
	}
	
	private String getXmlText( String keyName, Object obj, boolean bDate ) throws Exception
	{
		String result = xPath.compile(keyName).evaluate(obj);
		result = result.replaceAll("&gt;", ">");
		result = result.replaceAll("&lt;", "<");
		
		if ( bDate )
		{
			DateFormat sdf = new SimpleDateFormat( "EEE, dd MMM yyyy HH:mm:ss", Locale.US );
			Date date = sdf.parse(result);
			result = Util.getDateStringFromDate(date, "yyyy-MM-dd");
		}
		
		return result;
	}
}
