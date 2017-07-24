package com.tessoft.nearhere;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
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

import common.TaxiBiz;

@Controller
public class AdminAjaxController extends BaseController{
	
	@RequestMapping( value ="/admin/installRates.do")
	public @ResponseBody APIResponse installRates( HttpServletRequest request, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			ArrayList rates = new ArrayList();
			for ( int i = 0; i < 10; i++ )
			{
				HashMap data = sqlSession.selectOne("com.tessoft.nearhere.taxi.admin.getInstallCountByDay", i);
				rates.add(data);
			}
			
			response.setData(rates);
			
			response.setResCode("0000");
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		return response;
	}
	
}
