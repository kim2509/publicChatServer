package com.dy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iamdeveloper.domain.ProjectDomain;

@Controller
public class IamDeveloperController {

	@RequestMapping( value ="/getJavaProjects.do")
	public @ResponseBody ArrayList<ProjectDomain> getJavaProjects( ModelMap model, @RequestBody String bodyString )
	{
		ArrayList<ProjectDomain> ar = new ArrayList<ProjectDomain>();

		try
		{
			for ( int i = 0; i < 3; i++ )
			{
				String url = "";
				if ( i == 0 )
					url = "http://www.okjsp.net/bbs?act=LIST&bbs=recruit";
				else
					url = "http://www.okjsp.net/bbs?act=LIST&bbs=recruit&keyfield=content&keyword=&pg=" + i ;
				
				String responseString = getHTMLStringFromUrl( url, "euc-kr" );
				
				Document doc = Jsoup.parse(responseString);
				
				Elements trs = doc.select(".mainTable .body .subject a");
				
				for ( int j = 0; j < trs.size(); j++ )
				{
					Element tr = trs.get(j);
					
					ProjectDomain projectDomain = new ProjectDomain();
					projectDomain.setProjectName( tr.html().replaceAll("&nbsp;", "") );
					
					projectDomain.setSeq(tr.attr("href"));
					
					ar.add( projectDomain );
				}	
			}
			
		}
		catch( Exception ex )
		{

		}

		return ar;
	}
	
	@RequestMapping( value ="/getJavaProjectDetail.do")
	public @ResponseBody ProjectDomain getJavaProjectDetail( ModelMap model, @RequestBody String bodyString )
	{
		ProjectDomain res = new ProjectDomain();
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			ProjectDomain req = mapper.readValue(bodyString, new TypeReference<ProjectDomain>(){});
			
			String url = "http://www.okjsp.net" + req.getSeq();
			
			String responseString = getHTMLStringFromUrl( url, "euc-kr" );
			
			Document doc = Jsoup.parse(responseString);
			
			Elements trs = doc.select(".tablestyle #centent");
			
			if ( trs.size() > 0 )
			{
				String content = trs.get(0).html();
				content = content.replaceAll("<br />", "\r\n");
				content = content.replaceAll("<[^>]*>", "");
				content = content.replaceAll("\r\n", "\n");
				content = content.replaceAll("\n", "\r\n");
				
				content = content.replaceAll("\r\n\\s+\r\n", "\r\n\r\n");
				// 두줄을 한줄로
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n\r\n", "\r\n\r\n");
				content = content.replaceAll("&nbsp;", "");

				StringBuilder sb = new StringBuilder();
				String[] lines = content.split("\r\n");
				for ( int i = 0; i < lines.length; i++ )
				{
					if ( lines[i].indexOf(";") >= 0 )
						continue;
					sb.append( lines[i] + "\r\n" );
				}
				
				req.setContent( sb.toString());
			}
			
			return req;
			
		}
		catch( Exception ex )
		{

		}

		return res;
	}

	private String getHTMLStringFromUrl( String url, String encoding ) {
		// Create an instance of HttpClient.
		HttpClient client = new HttpClient();
		
		// Create a method instance.
		GetMethod method = new GetMethod( url );

		// Provide custom retry handler is necessary
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, 
				new DefaultHttpMethodRetryHandler(3, false));

		String responseString = "";
		
		try {
			// Execute the method.
			int statusCode = client.executeMethod(method);

			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + method.getStatusLine());
			}

			// Read the response body.
			byte[] responseBody = method.getResponseBody();

			responseString = new String(responseBody, encoding );

		} catch (HttpException e) {
			System.err.println("Fatal protocol violation: " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("Fatal transport error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			// Release the connection.
			method.releaseConnection();
		}
		
		return responseString;
	}
	
	@RequestMapping( value ="/getDotNetProjects.do")
	public @ResponseBody ArrayList<ProjectDomain> getDotNetProjects( ModelMap model, @RequestBody String bodyString )
	{
		ArrayList<ProjectDomain> ar = new ArrayList<ProjectDomain>();

		try
		{
			for ( int i = 0; i < 3; i++ )
			{
				String url = "";
				if ( i == 0 )
					url = "http://www.devpia.com/MAEUL/Contents/List.aspx?BoardID=84&MAEULNo=28";
				else
					url = "http://www.devpia.com/MAEUL/Contents/List.aspx?page=" + i+1 + "&BoardID=84&MAEULNo=28" ;
				
				String responseString = getHTMLStringFromUrl( url, "euc-kr" );
				
				Document doc = Jsoup.parse(responseString);
				
				Elements trs = doc.select("#ListList tr .board_con a");
				
				for ( int j = 0; j < trs.size(); j++ )
				{
					Element tr = trs.get(j);
					
					ProjectDomain javaProjectDomain = new ProjectDomain();
					javaProjectDomain.setProjectName( tr.attr("title") );
					
					javaProjectDomain.setSeq(tr.attr("href"));
					
					ar.add( javaProjectDomain );
				}	
			}
			
		}
		catch( Exception ex )
		{

		}

		return ar;
	}
	
	@RequestMapping( value ="/getDotNetProjectDetail.do")
	public @ResponseBody ProjectDomain getDotNetProjectDetail( ModelMap model, @RequestBody String bodyString )
	{
		ProjectDomain res = new ProjectDomain();
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			ProjectDomain req = mapper.readValue(bodyString, new TypeReference<ProjectDomain>(){});
			
			String url = "http://www.devpia.com/MAEUL/Contents/" + req.getSeq();
			
			String responseString = getHTMLStringFromUrl( url, "euc-kr" );
			
			Document doc = Jsoup.parse(responseString);
			
			Elements trs = doc.select("#ForumList #Contents");
			
			if ( trs.size() > 0 )
			{
				String content = trs.get(0).html();
				content = content.replaceAll("<br />", "\r\n");
				
				Pattern style = Pattern.compile("<style[^>]*>.*</style>",Pattern.DOTALL);  
				Matcher mat = style.matcher(content);  
				content = mat.replaceAll(""); 
				
				content = content.replaceAll("<[^>]*>", "");
				content = content.replaceAll("\r\n", "\n");
				content = content.replaceAll("\n", "\r\n");
				
				content = content.replaceAll("\r\n\\s+\r\n", "\r\n\r\n");
				// 두줄을 한줄로
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n\r\n", "\r\n\r\n");
				content = content.replaceAll("&nbsp;", "");

				StringBuilder sb = new StringBuilder();
				String[] lines = content.split("\r\n");
				for ( int i = 0; i < lines.length; i++ )
				{
					if ( lines[i].trim().endsWith(";") )
						continue;
					sb.append( lines[i] + "\r\n" );
				}
				
				System.out.println( sb.toString() );
				
				req.setContent( sb.toString());
			}
			
			return req;
			
		}
		catch( Exception ex )
		{

		}

		return res;
	}
	
	
	@RequestMapping( value ="/getAndroidProjects.do")
	public @ResponseBody ArrayList<ProjectDomain> getAndroidProjects( ModelMap model, @RequestBody String bodyString )
	{
		ArrayList<ProjectDomain> ar = new ArrayList<ProjectDomain>();

		try
		{
			for ( int i = 0; i < 3; i++ )
			{
				String url = "";
				if ( i == 0 )
					url = "http://www.androidpub.com/promotion";
				else
					url = "http://www.androidpub.com/index.php?mid=promotion&page=" + (i+1) ;
				
				String responseString = getHTMLStringFromUrl( url, "utf-8" );
				
				Document doc = Jsoup.parse(responseString);
				
				Elements trs = doc.select("#content .boardList tr .title a");
				
				for ( int j = 0; j < trs.size(); j++ )
				{
					Element tr = trs.get(j);
					
					if ( tr.html().indexOf("[공지]") >= 0 ) continue;
					
					ProjectDomain javaProjectDomain = new ProjectDomain();
					javaProjectDomain.setProjectName( tr.html() );
					
					javaProjectDomain.setSeq(tr.attr("href"));
					
					ar.add( javaProjectDomain );
				}	
			}
			
		}
		catch( Exception ex )
		{

		}

		return ar;
	}
	
	@RequestMapping( value ="/getAndroidProjectDetail.do")
	public @ResponseBody ProjectDomain getAndroidProjectDetail( ModelMap model, @RequestBody String bodyString )
	{
		ProjectDomain res = new ProjectDomain();
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			ProjectDomain req = mapper.readValue(bodyString, new TypeReference<ProjectDomain>(){});
			
			String url = req.getSeq();
			
			String responseString = getHTMLStringFromUrl( url, "utf-8" );
			
			Document doc = Jsoup.parse(responseString);
			
			Elements trs = doc.select(".contentBody .xe_content");
			
			if ( trs.size() > 0 )
			{
				String content = trs.get(0).html();
				content = content.replaceAll("<br />", "\r\n");
				
				Pattern style = Pattern.compile("<style[^>]*>.*</style>",Pattern.DOTALL);  
				Matcher mat = style.matcher(content);  
				content = mat.replaceAll(""); 
				
				content = content.replaceAll("<[^>]*>", "");
				content = content.replaceAll("\r\n", "\n");
				content = content.replaceAll("\n", "\r\n");
				
				content = content.replaceAll("\r\n\\s+\r\n", "\r\n\r\n");
				// 두줄을 한줄로
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n\r\n", "\r\n\r\n");
				content = content.replaceAll("&nbsp;", "");
				content = content.replaceAll("이 게시물을...", "");
				content = content.trim();

				StringBuilder sb = new StringBuilder();
				String[] lines = content.split("\r\n");
				for ( int i = 0; i < lines.length; i++ )
				{
					if ( lines[i].indexOf(";") >= 0 )
						continue;
					sb.append( lines[i] + "\r\n" );
				}
				
				req.setContent( sb.toString());
			}
			
			return req;
			
		}
		catch( Exception ex )
		{

		}

		return res;
	}
	
	@RequestMapping( value ="/getiOSProjects.do")
	public @ResponseBody ArrayList<ProjectDomain> getiOSProjects( ModelMap model, @RequestBody String bodyString )
	{
		ArrayList<ProjectDomain> ar = new ArrayList<ProjectDomain>();

		try
		{
			for ( int i = 0; i < 3; i++ )
			{
				String url = "";
				if ( i == 0 )
					url = "http://www.iphonedev.co.kr/xe/jobOffer";
				else
					url = "http://www.iphonedev.co.kr/xe/?mid=jobOffer&page=2" + (i+1) ;
				
				String responseString = getHTMLStringFromUrl( url, "utf-8" );
				
				Document doc = Jsoup.parse(responseString);
				
				Elements trs = doc.select("#content .boardList tr .title a");
				
				for ( int j = 0; j < trs.size(); j++ )
				{
					Element tr = trs.get(j);
					
					ProjectDomain javaProjectDomain = new ProjectDomain();
					
					String html = tr.html();
					Pattern style = Pattern.compile("<style[^>]*>.*</style>",Pattern.DOTALL);  
					Matcher mat = style.matcher(html);  
					html = mat.replaceAll(""); 
					
					javaProjectDomain.setProjectName( html );
					
					javaProjectDomain.setSeq(tr.attr("href"));
					
					ar.add( javaProjectDomain );
				}	
			}
			
		}
		catch( Exception ex )
		{

		}

		return ar;
	}
	
	@RequestMapping( value ="/getiOSProjectDetail.do")
	public @ResponseBody ProjectDomain getiOSProjectDetail( ModelMap model, @RequestBody String bodyString )
	{
		ProjectDomain res = new ProjectDomain();
		try
		{
			ObjectMapper mapper = new ObjectMapper();
			ProjectDomain req = mapper.readValue(bodyString, new TypeReference<ProjectDomain>(){});
			
			String url =  "http://www.iphonedev.co.kr/" + req.getSeq();
			
			String responseString = getHTMLStringFromUrl( url, "utf-8" );
			
			Document doc = Jsoup.parse(responseString);
			
			Elements trs = doc.select(".board .xe_content");
			
			if ( trs.size() > 0 )
			{
				String content = trs.get(0).html();
				content = content.replaceAll("<br />", "\r\n");
				
				Pattern style = Pattern.compile("<style[^>]*>.*</style>",Pattern.DOTALL);  
				Matcher mat = style.matcher(content);  
				content = mat.replaceAll(""); 
				
				content = content.replaceAll("<[^>]*>", "");
				content = content.replaceAll("\r\n", "\n");
				content = content.replaceAll("\n", "\r\n");
				
				content = content.replaceAll("\r\n\\s+\r\n", "\r\n\r\n");
				// 두줄을 한줄로
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n", "\r\n");
				content = content.replaceAll("\r\n\r\n\r\n", "\r\n\r\n");
				content = content.replaceAll("&nbsp;", "");
				content = content.replaceAll("이 게시물을...", "");
				content = content.trim();

				StringBuilder sb = new StringBuilder();
				String[] lines = content.split("\r\n");
				for ( int i = 0; i < lines.length; i++ )
				{
					if ( lines[i].indexOf(";") >= 0 )
						continue;
					sb.append( lines[i] + "\r\n" );
				}
				
				req.setContent( sb.toString());
			}
			
			return req;
			
		}
		catch( Exception ex )
		{

		}

		return res;
	}
}
