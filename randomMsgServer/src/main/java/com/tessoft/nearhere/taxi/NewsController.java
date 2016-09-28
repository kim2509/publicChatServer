package com.tessoft.nearhere.taxi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.codehaus.jackson.type.TypeReference;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
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
			getRegionNews(null, null, null );
			
			List list = (List) sqlSession.selectList("com.tessoft.nearhere.region.getFavoriteRegionByUser", userID );
			String favoriteRegions = "";
			
			if ( list != null && list.size() > 0 )
			{
				for ( int i = 0; i < list.size(); i++ )
				{
					HashMap region = (HashMap) list.get(i);
					favoriteRegions += region.get("regionName") + ",";
					
					region.put("news", sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", region.get("regionNo")) );
				}
				
				if ( favoriteRegions.endsWith(",") )
					favoriteRegions = favoriteRegions.substring(0, favoriteRegions.length() - 1 );
			}
			else
			{
				HashMap region = new HashMap();
				region.put("regionNo", "40");
				region.put("regionName", "서울");
				region.put("news", sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", "40" ));
				list.add(region);
				
				region = new HashMap();
				region.put("regionNo", "18");
				region.put("regionName", "경기도");
				region.put("news", sqlSession.selectList("com.tessoft.nearhere.news.getNewsByRegion", "18" ));
				list.add(region);
			}
			
			request.setAttribute("newsList", list);
			request.setAttribute("favoriteRegions", favoriteRegions);
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return new ModelAndView("news/list", model);
	}
	
	@RequestMapping( value ="/region/getRegionNews.do")
	public @ResponseBody APIResponse getRegionNews( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		StringBuffer resultText = new StringBuffer();
		
		try
		{
//			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			String url = "https://openapi.naver.com";
			String apiURL = "/v1/search/news.xml";
			url += apiURL + "?query=%ED%8F%AC%ED%95%AD%EC%8B%9C&display=10&start=1&sort=sim";
			
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
			
			logger.info( "[getRegionNews.do]" + resultText.toString() );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg("데이터 전송 도중 오류가 발생했습니다.\r\n다시 시도해 주십시오.");
			logger.error( ex );
		}

		return response;
	}
}
