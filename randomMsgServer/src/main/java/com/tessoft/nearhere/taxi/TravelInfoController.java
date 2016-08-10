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
import java.util.Map;

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
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.dy.common.Constants;
import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;

import common.UserBiz;

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
			HashMap result = callAPI("areaCode", 20, 10, 1, 1, null );
			ArrayList<HashMap> provinces = null;
					
			if ( result != null && result.get("items") != null )
				provinces = (ArrayList<HashMap>) result.get("items");
			
			request.setAttribute("provinces", provinces);
			
			String regionName = "";
			
			// 최근위치 조회
			if ( !Util.isEmptyString(userID) )
			{
				// favorite region 을 가져옴.
				List list = (List) sqlSession.selectList("com.tessoft.nearhere.news.getFavoriteRegionByUser", userID );
				if ( list != null && list.size() > 0 )
				{
					HashMap hash = (HashMap) list.get(0);
					if ( hash.containsKey("parentNo") && !Util.isEmptyString(hash.get("parentNo")))
					{
						List tmp = (List) sqlSession.selectList("com.tessoft.nearhere.news.getParentRegion", hash.get("parentNo").toString() );
						if ( tmp != null && tmp.size() > 0 )
							regionName = ((HashMap) tmp.get(0)).get("regionName").toString();
					}
					else
					{
						regionName = hash.get("regionName").toString(); 
					}
				}
				
				if ( Util.isEmptyString( regionName ) )
				{
					// user_location 테이블을 가져옴.
					
					List<HashMap> userLocations = UserBiz.getInstance(sqlSession).getUserLocation(userID);
					if ( userLocations != null && userLocations.size() > 0 )
					{
						for ( int i = 0; i < userLocations.size(); i++ )
						{
							HashMap region = userLocations.get(i);
							if ( region.containsKey("address") && !Util.isEmptyString( region.get("address") ) )
							{
								regionName = region.get("address").toString();
								break;
							}
						}
					}
				}
			}
		
			request.setAttribute("selectedAreaCode", getAreaCodeByName(regionName));
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}

		return new ModelAndView("travelInfo/index", model);
	}
	
	public String getAreaCodeByName( String regionName )
	{
		if ( Util.isEmptyString( regionName ) ) return "";
		
		if (regionName.startsWith("서울")) return "1";
		if (regionName.startsWith("인천")) return "2";
		if (regionName.startsWith("대전")) return "3";
		if (regionName.startsWith("대구")) return "4";
		if (regionName.startsWith("광주")) return "5";
		if (regionName.startsWith("부산")) return "6";
		if (regionName.startsWith("울산")) return "7";
		if (regionName.startsWith("세종")) return "8";
		if (regionName.startsWith("경기")) return "31";
		if (regionName.startsWith("강원")) return "32";
		if (regionName.startsWith("충청북")) return "33";
		if (regionName.startsWith("충청남")) return "34";
		if (regionName.startsWith("경상북")) return "35";
		if (regionName.startsWith("경상남")) return "36";
		if (regionName.startsWith("전라북")) return "37";
		if (regionName.startsWith("전라남")) return "38";
		if (regionName.startsWith("제주")) return "39";
		
		return "";
	}
	
	@RequestMapping( value ="/travelInfo/getCityList.do")
	public @ResponseBody APIResponse getCityList( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();

		try
		{	
			Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
			
			HashMap params = new HashMap();
			params.put("areaCode", requestInfo.get("areaCode"));
			HashMap result = callAPI("areaCode", 20, 10, 1, 1, params );
			ArrayList<HashMap> cityList = null;
			
			if ( result != null && result.get("items") != null )
				cityList = (ArrayList<HashMap>) result.get("items");
				
			response.setData(cityList);
			
			return response;

		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("회원검색 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
			return response;
		}
	}

	@RequestMapping( value ="/travelInfo/getTravelInfo.do")
	public @ResponseBody APIResponse getTravelInfo( HttpServletRequest request, @RequestBody String bodyString ) throws Exception {
		
		APIResponse response = new APIResponse();
		
		Map<String, String> requestInfo = mapper.readValue(bodyString, new TypeReference<Map<String, String>>(){});
		
		HashMap params = new HashMap();
		
		int pageNo = 1;
		
		if ( requestInfo.containsKey("areaCode") && !Util.isEmptyString(requestInfo.get("areaCode") ) )
			params.put("areaCode", requestInfo.get("areaCode"));
		if ( requestInfo.containsKey("cityCode") && !Util.isEmptyString(requestInfo.get("cityCode") ) )
			params.put("sigunguCode", requestInfo.get("cityCode"));
		if ( requestInfo.containsKey("pageNo") && !Util.isEmptyString(requestInfo.get("pageNo") ) )
			pageNo = Integer.parseInt( requestInfo.get("pageNo") );
		if ( requestInfo.containsKey("contentTypeID") && !Util.isEmptyString(requestInfo.get("contentTypeID") ) )
			params.put("contentTypeId", requestInfo.get("contentTypeID"));
		
		params.put("arrange", "P");
		HashMap travelInfo = callAPI("areaBasedList", 20, 10, pageNo , 1, params);
		
		response.setData(travelInfo);
		
		return response;
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
				
				HashMap detailIntro = callAPI( "detailIntro", 999, 999, 1, 1, params );
				model.addAttribute("detailIntro", detailIntro);
				
				HashMap detailImage = callAPI( "detailImage", 999, 999, 1, 1, params );
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
				HashMap detailCommon = callAPI( "detailCommon", 999, 999, 1, 1, params );
				model.addAttribute("detailCommon", detailCommon );
			}
			
		}
		catch(Exception ex )
		{
			logger.error( ex );
		}
		
		return new ModelAndView("travelInfo/detail");
	}

	private HashMap callAPI( String apiName, int numOfRows, int pageSize, int pageNo, int startPage, HashMap params ) throws Exception {
		String url = "http://api.visitkorea.or.kr/openapi/service";
		String apiURL = "/rest/KorService/" + apiName;
		url += apiURL + "?numOfRows=" + numOfRows + "&pageSize=" + pageSize + "&pageNo=" + pageNo + "&startPage=" + startPage + "&MobileOS=ETC";
		
		if ( params != null )
		{
			Iterator it = params.keySet().iterator();
			while( it.hasNext() )
			{
				String key = it.next().toString();
				url += "&" + key + "=" + params.get(key);	
			}	
		}
		
		List<HashMap> data = sqlSession.selectList("com.tessoft.nearhere.travel.getCachedData", url);
		
		StringBuffer resultText = new StringBuffer();
		
		if ( Constants.bReal == false || data == null || data.size() < 1 )
		{
			HashMap cacheData = new HashMap();
			cacheData.put("fullURL", url);
			cacheData.put("apiName", apiName);
			
			url += "&ServiceKey=" + serverKey + "&MobileApp=공유자원포털";
			
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet req = new HttpGet(url);
			
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
			
			cacheData.put("response", resultText.toString());
			
			sqlSession.insert("com.tessoft.nearhere.travel.deleteCachedData", cacheData.get("fullURL"));
			sqlSession.insert("com.tessoft.nearhere.travel.insertApiData", cacheData);
		}
		else
		{
			resultText.append(data.get(0).get("response"));
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
		String sPageNo = xPath.compile("response/body/pageNo").evaluate(doc);
		String sNumOfRows = xPath.compile("response/body/numOfRows").evaluate(doc);
		String totalCount = xPath.compile("response/body/totalCount").evaluate(doc);
		
		HashMap result = new HashMap();
		
		result.put("resultCode", resultCode);
		result.put("resultMsg", resultMsg);
		result.put("pageNo", sPageNo);
		result.put("numOfRows", sNumOfRows);
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
			}
			
			items.add(itemDetail);
		}
		
		result.put("items", items);
		
		return result;
	}
}
