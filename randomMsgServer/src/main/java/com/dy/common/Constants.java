package com.dy.common;

public class Constants {

	public final static int FETCH_MESSAGE_COUNT = 10;
	
	public static boolean bReal = true;
	
//	public static String ServerIP = "www.hereby.co.kr";
//	public static String ServerIP = "192.168.43.137";
	public static String ServerIP = "localhost";
//	public static String ServerIP = "192.168.0.200";
	
//	public static String Port = "80";
	public static String Port = "8080";
	
//	public static String SSLPort = "443";
	public static String SSLPort = "8080";
	

//	public static String JS_PATH = "http://www.hereby.co.kr/nearhere/js/";
	public static String CSS_PATH = "http://" + ServerIP + ":" + Port + "/nearhere/css/";
	public static String SECURE_CSS_PATH = "https://" + ServerIP + ":" + SSLPort + "/nearhere/css/";
	public static String IMAGE_PATH = "http://" + ServerIP + ":" + Port +  "/nearhere/image/";
	public static String SECURE_IMAGE_PATH = "https://" + ServerIP + ":" + SSLPort + "/nearhere/image/";
	public static String JS_PATH = "http://" + ServerIP + ":" + SSLPort + "/nearhere/js/";
	public static String SECURE_JS_PATH = "https://" + ServerIP + ":" + SSLPort + "/nearhere/js/";
	public static String GCM_API_KEY = "AIzaSyAfDDYJvFo6EWjLJH9PsPYzhcZJke30B4A";
	public static String DAUM_API_KEY = "a694766f82dd0fb809ccf02189747061";
	//public static String DAUM_API_KEY = "d346cd447ad87016b635e77df459b155adb17509";
	
	public static int push_retry_count = 5;
	
	public static String getServerURL()
	{
		return "http://" + ServerIP + ":" + Port + "/nearhere";
	}
	
	public static String getServerSSLURL()
	{
		return "http://" + ServerIP + ":" + SSLPort + "/nearhere";
//		return "https://" + ServerIP + "/nearhere";
	}
	
	public static String getThumbnailImageURL()
	{
		return "http://" + ServerIP + "/thumbnail/";
	}
	
	public static String getThumbnailImageSSLURL()
	{
		return "https://" + ServerIP + "/thumbnail/";
	}
	
	public static String getApacheHome()
	{
		return Constants.bReal ? "https://www.hereby.co.kr/" : "http://" + ServerIP + "/";
	}
	
	public static String CafeMemberTypeOwner = "카페주인";
	public static String CafeMemberTypeOperator = "운영자";
	public static String CafeMemberTypeMember = "회원";
	
	public static String PAGE_ID_CAFE_INDEX = "P0000";
	public static String PAGE_ID_CAFE_HOME = "P0001";
	public static String PAGE_ID_CAFE_MEETINGlIST = "P0002";
	
	public static String PAGE_ID_BOARD_HOME = "P1001";
	public static String PAGE_ID_BOARD_POST_DETAIL = "P1002";
	public static String PAGE_ID_SEARCH_BOARD = "P1003";
	
	public static String PAGE_ID_PUBLIC_MEETING_DETAIL = "P2001";
	
	public static String PAGE_ID_NEWS_LIST = "P5001";
	
	public static String CAFE_DEAULT_ICON = "cafe_default.png";
}
