package common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.android.gcm.server.Message;
import com.nearhere.domain.UserSetting;

public class NewsBiz extends CommonBiz{

	private static NewsBiz newsBiz = null;

	public static NewsBiz getInstance( SqlSession sqlSession )
	{
		if ( NewsBiz.newsBiz == null )
			NewsBiz.newsBiz = new NewsBiz( sqlSession );

		return NewsBiz.newsBiz;
	}

	public NewsBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}

	public void scrapNews() throws Exception
	{
		getSeoulCityNews();
		getGangnamGuNews();
		getGwanakNews();
		getGwangjinGuNews();
		getGeumcheonGuNews();
		
		// 도봉구 추가
		getSimpleScrapingItems( "http://m.dobong.go.kr/", "http://m.dobong.go.kr/", ".notice_list ul li a", "38", false );
		
		// 동작구 추가
		getSimpleScrapingItems( "http://m.dongjak.go.kr/m/main.do", "http://m.dongjak.go.kr/", ".lastest1 li a", "7", false );
		
		// 송파구 추가
		getSimpleScrapingItems( "http://m.songpa.go.kr/index.do", "http://m.songpa.go.kr/", ".easy_board ul li a", "9", false );
		
	}

	public void getSeoulCityNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.seoul.go.kr/mw/topmenu.do").timeout(5000).get();
		Elements newsHeadlines = doc.select("#container .grid ul[class=txt_section] li a[class=ts_a]");

		String host = "http://m.seoul.go.kr/";
		String regionNo = "40";

		ArrayList<HashMap> items = new ArrayList<HashMap>();

		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = "";

			if ( newsHeadlines.get(i).childNodes().size() > 1 )
			{
				for ( int j = 0; j < newsHeadlines.get(i).childNodes().size(); j++ )
				{
					Node node = newsHeadlines.get(i).childNodes().get(j);

					title = "";
					if ( "#text".equals( node.nodeName() ) )
					{
						title = node.outerHtml();
					}
				}
			}
			else
				title = newsHeadlines.get(i).html();
			
			title = title.replaceAll("\\'", "");
			
			String link = newsHeadlines.get(i).attr("href");

			if ( link.startsWith("javascript:") ) continue;

			if ( link.toLowerCase().startsWith("http") == false )
				link = host + link;

			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			hash.put("regionNo", regionNo );
			hash.put("host", host );
			items.add( hash );
		}

		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}

	}
	
	public ArrayList<HashMap> getGangnamGuNews() throws Exception
	{
		Document doc = Jsoup.connect("http://www.gangnam.go.kr/portal/main/portalMain.do").timeout(5000).get();
		Elements newsHeadlines = doc.select(".tabList").get(1).select("li a");
		newsHeadlines.addAll( doc.select(".tabList").get(3).select("li a") );
		
		String host = "http://www.gangnam.go.kr/";
		String regionNo = "1";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, false );
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	public ArrayList<HashMap> getGwanakNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.gwanak.go.kr/infor/infor.jsp?tab_depth1=infor_main&tab_depth2=infor")
				.timeout(5000).get();
		Elements newsHeadlines = doc.select(".bb_list li a");
		
		String host = "http://m.gwanak.go.kr/";
		String regionNo = "3";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, true );
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	public ArrayList<HashMap> getGwangjinGuNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.gwangjin.go.kr/board/MIT038/list#")
				.timeout(5000).get();
		Elements newsHeadlines = doc.select(".bbs_list a");
		
		String host = "http://m.gwangjin.go.kr/";
		String regionNo = "4";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, false );
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	public ArrayList<HashMap> getGeumcheonGuNews() throws Exception
	{
		Document doc = Jsoup.connect("http://m.geumcheon.go.kr/html/046/046.jsp")
				.timeout(5000).get();
		Elements newsHeadlines = doc.select("#mainContent .bbs-con li a");
		
		String host = "http://m.geumcheon.go.kr/";
		String regionNo = "6";
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, regionNo, false );
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	private ArrayList<HashMap> getSimpleScrapingItems( String homeURL, String hostURL, String scrapingRule, String regionNo, boolean bScriptHTMLTitle ) throws Exception
	{
		Document doc = Jsoup.connect( homeURL ).timeout(5000).get();
		Elements newsHeadlines = doc.select( scrapingRule );
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, hostURL, regionNo, false );
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	private ArrayList<HashMap> getHashMapList(Elements newsHeadlines, String host, String regionNo, boolean bStripHTMLTitle ) {
		ArrayList<HashMap> items = new ArrayList<HashMap>();
		
		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = "";
			if ( bStripHTMLTitle )
				title =  Jsoup.parse(newsHeadlines.get(i).html()).text();
			else
				title = newsHeadlines.get(i).html();
			
			String link = newsHeadlines.get(i).attr("href");
			
			if ( link.startsWith("javascript:") ) continue;
			
			if ( link.toLowerCase().startsWith("http") == false )
				link = host + link;
			
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			hash.put("regionNo", regionNo);
			hash.put("host", host );
			items.add( hash );
		}
		return items;
	}
}
