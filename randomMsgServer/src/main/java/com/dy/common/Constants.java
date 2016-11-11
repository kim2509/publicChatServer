package com.dy.common;

public class Constants {

	public final static int FETCH_MESSAGE_COUNT = 10;
	
	public static boolean bReal = true;
	
	public static String ServerIP = "192.168.0.200";
	public static String CSS_PATH = "http://www.hereby.co.kr/nearhere/css/";
	public static String SECURE_CSS_PATH = "https://www.hereby.co.kr/nearhere/css/";
	public static String IMAGE_PATH = "http://www.hereby.co.kr/nearhere/image/";
	public static String SECURE_IMAGE_PATH = "https://www.hereby.co.kr/nearhere/image/";
	public static String JS_PATH = "http://www.hereby.co.kr/nearhere/js/";
	public static String SECURE_JS_PATH = "https://www.hereby.co.kr/nearhere/js/";
	public static String GCM_API_KEY = "AIzaSyAfDDYJvFo6EWjLJH9PsPYzhcZJke30B4A";
	public static String DAUM_API_KEY = "a694766f82dd0fb809ccf02189747061";
	//public static String DAUM_API_KEY = "d346cd447ad87016b635e77df459b155adb17509";
	
	public static int push_retry_count = 5;
	
	public static String getServerURL()
	{
//		return Constants.bReal ? "http://www.hereby.co.kr/nearhere" : "http://localhost:8080/nearhere";
		return Constants.bReal ? "http://www.hereby.co.kr/nearhere" : "http://" + ServerIP + ":8080/nearhere";
	}
	
	public static String getServerSSLURL()
	{
//		return Constants.bReal ? "http://www.hereby.co.kr/nearhere" : "http://localhost:8080/nearhere";
		return Constants.bReal ? "https://www.hereby.co.kr/nearhere" : "http://" + ServerIP + ":8080/nearhere";
	}
	
	public static String getThumbnailImageURL()
	{
		return Constants.bReal ? "http://www.hereby.co.kr/thumbnail/" : "http://www.hereby.co.kr/thumbnail/";
//		return Constants.bReal ? "http://www.hereby.co.kr/thumbnail/" : "http://172.30.1.200/thumbnail/";
	}
	
	public static String getThumbnailImageSSLURL()
	{
		return Constants.bReal ? "https://www.hereby.co.kr/thumbnail/" : "http://www.hereby.co.kr/thumbnail/";
//		return Constants.bReal ? "http://www.hereby.co.kr/thumbnail/" : "http://172.30.1.200/thumbnail/";
	}
}
