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

import com.dy.common.Util;
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
	
	class Host{
		String hostURL;
		ArrayList<HomeURL> homeURLs;
		
		public Host(String hostURL)
		{
			this.hostURL = hostURL;
			homeURLs = new ArrayList<HomeURL>();
		}
		
		public String getHostURL()
		{
			return hostURL;
		}
		
		public void addHomeURL(HomeURL homeURL)
		{
			homeURLs.add(homeURL);
		}
		
		public ArrayList<HomeURL> getHomeURLs()
		{
			return homeURLs;
		}
	}
	
	class HomeURL
	{
		String homeURL;
		String subDir;
		ArrayList<ScrapingRule> scrapingRules;
		
		public HomeURL(String homeURL, String subDir)
		{
			this.homeURL = homeURL;
			this.subDir = subDir;
			scrapingRules = new ArrayList<ScrapingRule>();
		}
		
		public String getHomeURL()
		{
			return homeURL;
		}
		
		public String getSubDir()
		{
			return subDir;
		}
		
		public void addScrapingRule(ScrapingRule scrapingRule )
		{
			scrapingRules.add( scrapingRule );
		}
		
		public ArrayList<ScrapingRule> getScrapingRules()
		{
			return scrapingRules;
		}
	}
	
	class ScrapingRule
	{
		String scrapingRule;
		String titleRule;
		boolean bScrapHTML;
		
		public ScrapingRule(String scrapingRule, boolean bScrapHTML, String titleRule )
		{
			this.scrapingRule = scrapingRule;
			this.bScrapHTML = true;
			this.titleRule = titleRule;
		}
		
		public String getScrapingRule()
		{
			return scrapingRule;
		}
		
		public boolean getScrapHTML()
		{
			return bScrapHTML;
		}
		
		public String getTitleRule()
		{
			return titleRule;
		}
	}

	public void scrapNews() throws Exception
	{
		logger.info("seoul");
		getSeoulCityNews();
		
		logger.info("강남");
		getGangnamGuNews();
		
		logger.info("관악");
		getGwanakNews();

		
		logger.info("광진구청");
		// 광진구청 추가
		getHashMapListWithTitleRule("http://m.gwangjin.go.kr/", "http://m.gwangjin.go.kr/board/MIT038/list#", "4", ".bbs_list a", ".bbs_list_title" );
		
		
		logger.info("금천구청");
		
		getGeumcheonGuNews();
		
		logger.info("도봉구청");
		// 도봉구 추가
		getSimpleScrapingItems( "http://m.dobong.go.kr/", "http://m.dobong.go.kr/", ".notice_list ul li a", "38", false );
		
		logger.info("동작구청");
		// 동작구 추가
		getSimpleScrapingItems( "http://m.dongjak.go.kr/m/main.do", "http://m.dongjak.go.kr/", ".lastest1 li a", "7", false );
		
		logger.info("송파구청");
		// 송파구 추가
		getSimpleScrapingItems( "http://m.songpa.go.kr/index.do", "http://m.songpa.go.kr/", ".easy_board ul li a", "9", false );
		
		logger.info("성동구청");
		// 성동구 추가
		getSimpleScrapingItems( "http://m.sd.go.kr/sd/topmenu.do?op=main#none", "http://m.sd.go.kr/", ".main_box1_con02 li a", "11", false );
		
		logger.info("서대문구청");
		// 서대문구 추가		
		getHashMapListWithTitleRule("http://m.sdm.go.kr/", "http://m.sdm.go.kr/", "36", ".innerdiv li a", ".ml_10" );
		
		// 양천구 추가 인증절차가 있어서 보류		
		//getSimpleScrapingItems("http://m.yangcheon.go.kr/", "http://m.yangcheon.go.kr/", ".view_board li a", "13", false );
		
		logger.info("영등포구청");
		// 영등포구 추가		
		getSimpleScrapingItems("http://www.ydp.go.kr/smart/main.do", "http://www.ydp.go.kr/", 
				new String[]{".inner li a"}, "14", false, null );
		
		logger.info("종로구청");
		
		// 종로구청
		getHashMapListWithTitleRule("http://m.jongno.go.kr/", "http://m.jongno.go.kr/mobile/main.do", "16", "#view1 li a", ".title" );
		
		logger.info("중구청");
		// 서울 중구 추가
		getSimpleScrapingItems("http://www.junggu.seoul.kr/index.jsp", "http://www.junggu.seoul.kr/", 
				new String[]{".board_wrap li a"}, "17", false, null );
		
		logger.info("중랑구청");
		// 중랑구청 추가
		getSimpleScrapingItems("http://m.jungnang.go.kr/mobile/main.do", "http://m.jungnang.go.kr/", 
				new String[]{".notice-tab li a"}, "37", true, null );
		
		logger.info("경기도청");
		// 경기도 뉴스포털 추가
		getSimpleScrapingItems(
				new String[]{"http://m.gnews.gg.go.kr/news/news_main.asp?s_code=C052",
						"http://m.gnews.gg.go.kr/news/news_main.asp?s_code=C048",
						"http://m.gnews.gg.go.kr/news/news_main.asp?s_code=C049"}
				, "http://m.gnews.gg.go.kr/", new String[]{"/news/", "/news/", "/news/"}, new String[]{"article dt a"}, "18", true, null );
		
		// 부산광역시 추가(서버인증서가 이상함)
		/*
		getSimpleScrapingItems(
				new String[]{"http://news.busan.go.kr/Main.bs"}
				, "http://news.busan.go.kr/", new String[]{""}, new String[]{".news_slide1 li a", ".news_slide2 li a"}, "19", false, new String[]{".tit", ".tit"} );
		*/
		
		logger.info("인천");
		// 인천광역시 추가
		getSimpleScrapingItems(
				new String[]{"http://m.incheon.go.kr/index.jsp"}
				, "http://m.incheon.go.kr/", new String[]{""}, new String[]{"#lately_post li a"}, "20", false, null );
		
		logger.info("대전");
		// 대전광역시 추가
		scrapDaejeon();
		
		logger.info("울산");
		// 울산광역시 추가
		scrapUlsan();
		
		// 대구광역시 추가 ajax임
		/*
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://info.daegu.go.kr/");
		HomeURL homeURL = new HomeURL("http://info.daegu.go.kr/mnews/list.php?key1=1&key2=bsection", "");
		homeURL.addScrapingRule(new ScrapingRule("#article_list li a", false, ".slist_title"));
		host.addHomeURL(homeURL);
		
		homeURL = new HomeURL("http://info.daegu.go.kr/mnews/list.php?key1=4&key2=bsection", "");
		homeURL.addScrapingRule(new ScrapingRule("#article_list li a", false, ".slist_title"));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "22" );
		*/
		
		logger.info("광주");
		// 광주광역시 추가
		scrapGwangju();
		
		logger.info("강원");
		// 강원도청
		scrapGangwon();
		
		logger.info("충북");
		// 충청북도청
		scrapChungBuk();
		
		// 599 에러 충남
		/*
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://www.chungnam.net/");
		HomeURL homeURL = new HomeURL("http://www.chungnam.net/main.do/", "");
		homeURL.addScrapingRule(new ScrapingRule(".mainNewsLft li a", false, ".newstit"));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "26" );
		*/
		
		logger.info("경북");
		// 경북
		scrapKyungbuk();
		
		// 경남 에러남
		/*
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://m.gsnd.net/");
		HomeURL homeURL = new HomeURL("http://m.gsnd.net/jsp/main/main.jsp", "");
		homeURL.addScrapingRule(new ScrapingRule(".m_tabborad li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "28" );
		*/
		
		logger.info("전북");
		// 전북
		scrapJeonbuk();
		
		logger.info("전남");
		// 전남
		scrapJeonnam();
		
		/* 브라우저랑 다름
		logger.info("제주");
		
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://www.jeju.go.kr/");
		HomeURL homeURL = new HomeURL("http://www.jeju.go.kr/", "");
		homeURL.addScrapingRule(new ScrapingRule(".news-list #list1-1 li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "31" );
		*/
		
		logger.info("창원시");
		// 창원시
		scrapChangwon();
		
		// 고양시
		logger.info("고양시");
		scrapGoyang();
		
		// 성남시
		logger.info("성남시");
		scrapSeongnam();
		
		// 용인시
		logger.info("용인시");
		scrapYongin();
		
		// 부천시
		logger.info("부천시");
		scrapBucheon();
		
		// 청주시
		logger.info("청주시");
		scrapCheongju();
		
		// 안산시
		logger.info("안산시");
		scrapAnsan();
		
		// 전주시
		logger.info("전주시");
		scrapJeonju();
		
		// 남양주시는 함수로 돼 있음.
		
		// 안양시
		logger.info("안양시");
		scrapAnYang();
		
		// 천안시는 복잡함.
		
		// 화성시는 javascript 에서 document.write 로 돼 있음.
		
		// 김해시
		logger.info("김해시");
		scrapGimhae();
		
		// 포항시(두번째 url 은 이상함)
		logger.info("포항시");
		scrapPohang();
	}
	
	private void scrapPohang() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.ipohang.org/");
		HomeURL homeURL = new HomeURL("http://m.ipohang.org/main.do", "");
		homeURL.addScrapingRule(new ScrapingRule(".notice dd a", true, ""));
		host.addHomeURL(homeURL);
		
		homeURL = new HomeURL("http://m.ipohang.org/bbs/selectBbsList.do?board=focus&ibCategory=&searchWrd=&mId=4120", "");
		homeURL.addScrapingRule(new ScrapingRule("#thelist .ui-btn-text a", false, ".listTit"));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "57" );
	}
	
	private void scrapGimhae() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.gimhae.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.gimhae.go.kr/", "");
		homeURL.addScrapingRule(new ScrapingRule("#bbs1 li a", true, ""));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "56" );
	}
	
	private void scrapAnYang() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.anyang.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.anyang.go.kr/m/main.do", "");
		homeURL.addScrapingRule(new ScrapingRule(".news li a", true, ""));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "55" );
	}
	
	private void scrapJeonju() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://www.jeonju.go.kr/");
		HomeURL homeURL = new HomeURL("http://www.jeonju.go.kr/index.9is", "");
		homeURL.addScrapingRule(new ScrapingRule(".board_tab li a", true, ""));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "54" );
	}
	
	private void scrapAnsan() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.iansan.net/");
		HomeURL homeURL = new HomeURL("http://m.iansan.net/", "");
		homeURL.addScrapingRule(new ScrapingRule(".listWrap li a", true, ""));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "53" );
	}
	
	private void scrapCheongju() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.cheongju.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.cheongju.go.kr/bbs/selectBoardDataList.do?bbsNo=40&mId=1310", "");
		homeURL.addScrapingRule(new ScrapingRule("#thelist li a", false, "span strong"));
		host.addHomeURL(homeURL);
		
		homeURL = new HomeURL("http://m.cheongju.go.kr/job/list.do?mId=4810", "");
		homeURL.addScrapingRule(new ScrapingRule("#thelist li a", false, "span"));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "52" );
	}
	
	private void scrapBucheon() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.bucheon.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.bucheon.go.kr/site/main/index200_sub1", "");
		homeURL.addScrapingRule(new ScrapingRule(".news_list1 li a", true, ""));
		homeURL.addScrapingRule(new ScrapingRule(".img_txt1 li a", false, ".txt"));
		homeURL.addScrapingRule(new ScrapingRule(".news_list2 li a", true, ""));
		host.addHomeURL(homeURL);
		
		homeURL = new HomeURL("http://m.bucheon.go.kr/site/main/index200_sub2", "");
		homeURL.addScrapingRule(new ScrapingRule(".news_list3 li a", true, ""));
		host.addHomeURL(homeURL);
		
		homeURL = new HomeURL("http://m.bucheon.go.kr/site/main/index200_sub3", "");
		homeURL.addScrapingRule(new ScrapingRule(".news_list3 li a", true, ""));
		host.addHomeURL(homeURL);
		
		homeURL = new HomeURL("http://m.bucheon.go.kr/site/main/index200_sub4", "");
		homeURL.addScrapingRule(new ScrapingRule(".news_list2 li a", true, ""));
		host.addHomeURL(homeURL);
		
		hostList.add(host);
		getSimpleScrapingItems( hostList, "51" );
	}
	
	private void scrapYongin() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("https://m.yongin.go.kr/");
		HomeURL homeURL = new HomeURL("https://m.yongin.go.kr/m/index.do", "");
		homeURL.addScrapingRule(new ScrapingRule(".mainTab2 .tab li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "50" );
	}
	
	private void scrapSeongnam() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.seongnam.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.seongnam.go.kr/main.do", "");
		homeURL.addScrapingRule(new ScrapingRule(".mainNews li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "49" );
	}
	
	private void scrapGoyang() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.goyang.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.goyang.go.kr/m/sm2_1.jsp", "m/");
		homeURL.addScrapingRule(new ScrapingRule(".list li a", true, ""));
		host.addHomeURL(homeURL);
		homeURL = new HomeURL("http://m.goyang.go.kr/m/sm4_1.jsp", "m/");
		homeURL.addScrapingRule(new ScrapingRule(".list li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "48" );
	}

	private void scrapChangwon() throws Exception
	{
		ArrayList<Host> hostList = new ArrayList<Host>();
		Host host = new Host("http://m.changwon.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.changwon.go.kr/", "");
		homeURL.addScrapingRule(new ScrapingRule(".notice li a", false, "b"));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "47" );
	}
	
	private void scrapJeonnam() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://www.jeonnam.go.kr/");
		HomeURL homeURL = new HomeURL("http://www.jeonnam.go.kr/", "");
		homeURL.addScrapingRule(new ScrapingRule(".tab_area .tab_con li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "30" );
	}

	private void scrapJeonbuk() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://m.jb.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.jb.go.kr/index.jeonbuk", "");
		homeURL.addScrapingRule(new ScrapingRule(".tab li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "29" );
	}

	private void scrapKyungbuk() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://www.gb.go.kr/");
		HomeURL homeURL = new HomeURL("http://www.gb.go.kr/open_content/mobile/index.html", "/open_content/mobile/");
		homeURL.addScrapingRule(new ScrapingRule(".notice_left li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "27" );
	}

	private void scrapChungBuk() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://m.cb21.net/");
		HomeURL homeURL = new HomeURL("http://m.cb21.net/main/m", "");
		homeURL.addScrapingRule(new ScrapingRule(".tab_container li a", true, ""));
		homeURL.addScrapingRule(new ScrapingRule(".culture_list li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "25" );
	}

	private void scrapGangwon() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://m.provin.gangwon.kr/");
		HomeURL homeURL = new HomeURL("http://m.provin.gangwon.kr/gw/mobile", "");
		homeURL.addScrapingRule(new ScrapingRule(".notice dt a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "24" );
	}

	private void scrapGwangju() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://m.gwangju.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.gwangju.go.kr/", "");
		homeURL.addScrapingRule(new ScrapingRule(".con1 .contentGroup .boardList li a", true, ""));
		homeURL.addScrapingRule(new ScrapingRule(".con2 .boardList li a", true, ""));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "23" );
	}

	private void scrapUlsan() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://www.ulsan.go.kr/");
		HomeURL homeURL = new HomeURL("http://www.ulsan.go.kr/rep/index", "");
		homeURL.addScrapingRule(new ScrapingRule("#news li a", false, ""));
		homeURL.addScrapingRule(new ScrapingRule("#part .holder article .hover-color a", false, "h4"));
		host.addHomeURL(homeURL);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "39" );
	}

	private void scrapDaejeon() throws Exception {
		ArrayList<Host> hostList = new ArrayList<NewsBiz.Host>();
		Host host = new Host("http://m.dj.go.kr/");
		HomeURL homeURL = new HomeURL("http://m.dj.go.kr/smart/main.do#", "");
		homeURL.addScrapingRule(new ScrapingRule("#newsList1 li a", false, ""));
		homeURL.addScrapingRule(new ScrapingRule("#newsList2 li a", false, ""));
		homeURL.addScrapingRule(new ScrapingRule("#newsList3 li a", false, ""));
		
		HomeURL homeURL2 = new HomeURL("http://m.dj.go.kr/smart/festival.do?mCode=B020000000", "/smart/");
		homeURL2.addScrapingRule(new ScrapingRule("#content dt a", false, ""));
		
		host.addHomeURL(homeURL);
		host.addHomeURL(homeURL2);
		hostList.add(host);
		getSimpleScrapingItems( hostList, "21" );
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
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, "", regionNo, false, null );
		
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
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, "", regionNo, true, null );
		
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
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, "", regionNo, false, null );
		
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
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, host, "", regionNo, false, null );
		
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
		
		ArrayList<HashMap> items = getHashMapList(newsHeadlines, hostURL, "", regionNo, false, null );
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	private ArrayList<HashMap> getSimpleScrapingItems( String[] homeURL, String hostURL, String[] subDirs, 
			String[] scrapingRule, String regionNo, boolean bScriptHTMLTitle, String[] titleRules ) throws Exception
	{
		ArrayList<HashMap> items = null;
		
		try
		{
			// titleRule 이 없을때 공백으로
			if ( titleRules == null || titleRules.length < homeURL.length )
				titleRules = new String[homeURL.length];
			
			for ( int i = 0; i < homeURL.length; i++ )
			{
				Document doc = Jsoup.connect( homeURL[i] ).timeout(5000).get();
				
				for ( int j = 0; j < scrapingRule.length; j++ )
				{
					Elements newsHeadlines = doc.select( scrapingRule[j] );
					
					if ( items == null )
						items = getHashMapList(newsHeadlines, hostURL, subDirs[i], regionNo, bScriptHTMLTitle, titleRules[i] );
					else
						items.addAll( getHashMapList(newsHeadlines, hostURL, subDirs[i], regionNo, bScriptHTMLTitle, titleRules[i] ) );
				}
			}
			
			if ( items != null && items.size() > 0 )
			{
				sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
				int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
			}	
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return items;
	}
	
	@SuppressWarnings("rawtypes")
	private ArrayList<HashMap> getSimpleScrapingItems( List<Host> hostList, String regionNo ) throws Exception
	{
		ArrayList<HashMap> items = null;

		try
		{
			if ( hostList == null || hostList.size() < 1 ) return new ArrayList<HashMap>();
			
			for ( int i = 0; i < hostList.size(); i++ )
			{
				Host host = hostList.get(i);
				
				for ( int j = 0; j < host.getHomeURLs().size(); j++ )
				{
					HomeURL homeURL = host.getHomeURLs().get(j);
					
					Document doc = Jsoup.connect( homeURL.getHomeURL() ).timeout(10000).get();
					
					for ( int k = 0; k < homeURL.getScrapingRules().size(); k++ )
					{
						ScrapingRule scrapingRule = homeURL.getScrapingRules().get(k);
						
						Elements newsHeadlines = doc.select( scrapingRule.getScrapingRule() );
						
						if ( items == null )
							items = getHashMapList(newsHeadlines, host.getHostURL(), homeURL.getSubDir(), regionNo, scrapingRule.getScrapHTML(), scrapingRule.getTitleRule() );
						else
							items.addAll( getHashMapList(newsHeadlines, host.getHostURL(), homeURL.getSubDir(), regionNo, scrapingRule.getScrapHTML(), scrapingRule.getTitleRule() ) );
					}	
				}
			}
			
			if ( items != null && items.size() > 0 )
			{
				sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
				int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
			}
		}
		catch( Exception ex )
		{
			logger.error(ex);
		}
		
		return items;
	}
	
	private ArrayList<HashMap> getSimpleScrapingItems( String homeURL, String hostURL, String[] scrapingRule, String regionNo, 
			boolean bScriptHTMLTitle, String[] titleRules ) throws Exception
	{
		Document doc = Jsoup.connect( homeURL ).timeout(5000).get();
		
		ArrayList<HashMap> items = null;
		
		// titleRule 이 없을때 공백으로
		if ( titleRules == null || titleRules.length < scrapingRule.length )
			titleRules = new String[scrapingRule.length];
		
		for ( int i = 0; i < scrapingRule.length; i++ )
		{
			Elements newsHeadlines = doc.select( scrapingRule[i] );
			
			if ( items == null )
				items = getHashMapList(newsHeadlines, hostURL, "", regionNo, bScriptHTMLTitle, titleRules[i] );
			else
				items.addAll( getHashMapList(newsHeadlines, hostURL, "", regionNo, bScriptHTMLTitle, titleRules[i] ) );
		}
		
		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}
		
		return items;
	}
	
	private ArrayList<HashMap> getHashMapList(Elements newsHeadlines, String host, String subDirs, String regionNo, boolean bStripHTMLTitle, String titleRule ) {
		ArrayList<HashMap> items = new ArrayList<HashMap>();
		
		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = "";
			if ( bStripHTMLTitle )
				title =  Jsoup.parse(newsHeadlines.get(i).html()).text();
			else if ( Util.isEmptyString( titleRule ))
				title = newsHeadlines.get(i).html();
			else
				title = newsHeadlines.get(i).select( titleRule ).html();
			
			title = title.replaceAll("\\'", "");
			
			title = Jsoup.parse(title).text();
			
			String link = newsHeadlines.get(i).attr("href");
			
			// 영등포구청에 이런게 있음.
			if ( "#".equals(link) ) continue;
			
			if ( link.startsWith("javascript:") ) continue;
			
			if ( link.toLowerCase().startsWith("http") == false )
				link = host + subDirs + link;
			
			link.replaceAll("http://www.siminilbo.co.kr", "http://m.siminilbo.co.kr");
			link.replaceAll("http://www.newsbucheon.net", "http://m.newsbucheon.net/");
			
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			hash.put("regionNo", regionNo);
			hash.put("host", host );
			items.add( hash );
		}
		return items;
	}
	
	public void getHashMapListWithTitleRule( String hostURL, String url, String regionNo, String scrapingRule, String titleRule ) throws Exception
	{
		Document doc = Jsoup.connect( url ).timeout(5000).get();
		Elements newsHeadlines = doc.select( scrapingRule );

		ArrayList<HashMap> items = new ArrayList<HashMap>();

		for ( int i = 0; i < newsHeadlines.size(); i++ )
		{
			String title = "";

			title = newsHeadlines.get(i).select( titleRule ).html();
			title = title.replaceAll("\\'", "");
			
			String link = newsHeadlines.get(i).attr("href");

			if ( link.startsWith("javascript:") ) continue;
			
			// 영등포구청에 이런게 있음.
			if ( "#".equals(link) ) continue;

			if ( link.toLowerCase().startsWith("http") == false )
				link = hostURL + link;
			
			link = link.replaceAll("http://www.siminilbo.co.kr", "http://m.siminilbo.co.kr");

			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("title", title);
			hash.put("link", link);
			hash.put("regionNo", regionNo );
			hash.put("host", hostURL );
			items.add( hash );
		}

		if ( items != null && items.size() > 0 )
		{
			sqlSession.delete("com.tessoft.nearhere.news.deleteNewsByRegion", regionNo );
			int result = sqlSession.insert("com.tessoft.nearhere.news.insertNews", items );
		}

	}
}
