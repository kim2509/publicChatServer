package com.dy.common;

public class Constants {

	public final static int FETCH_MESSAGE_COUNT = 10;
	
	public static String CSS_PATH = "/nearhere/css/";
	public static String IMAGE_PATH = "/nearhere/image/";
	public static String JS_PATH = "/nearhere/js/";
	public static String GCM_API_KEY = "AIzaSyAfDDYJvFo6EWjLJH9PsPYzhcZJke30B4A";
	public static int push_retry_count = 5;

	public static boolean bReal = false;
	
	public static String getServerURL()
	{
		return Constants.bReal ? "http://www.hereby.co.kr/nearhere" : "http://localhost:8080/nearhere";
	}
	
	public static String getThumbnailImageURL()
	{
		return Constants.bReal ? "http://www.hereby.co.kr/thumbnail/" : "http://localhost:8088/thumbnail/";
	}
}
