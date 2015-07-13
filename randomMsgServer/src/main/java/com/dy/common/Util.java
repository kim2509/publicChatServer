package com.dy.common;

import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.Random;

import org.apache.log4j.Logger;

import com.nearhere.domain.Post;

public class Util {

	public  static String encryptPassword(String password)
	{
	    String sha1 = "";
	    try
	    {
	        MessageDigest crypt = MessageDigest.getInstance("SHA-1");
	        crypt.reset();
	        crypt.update(password.getBytes("UTF-8"));
	        sha1 = byteToHex(crypt.digest());
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();
	    }
	    return sha1;
	}
	
	public static String byteToHex(final byte[] hash)
	{
	    Formatter formatter = new Formatter();
	    for (byte b : hash)
	    {
	        formatter.format("%02x", b);
	    }
	    String result = formatter.toString();
	    formatter.close();
	    return result;
	}
	
	public static boolean isEmptyString( String str )
	{
		if ( str == null ) return true;
		if ( "".equals(str.trim())) return true;
		return false;
	}
	
	public static double getDouble( String val )
	{
		if ( isEmptyString( val ) ) return 0.0;
		
		try
		{
			return Double.parseDouble( val );	
		}
		catch( Exception ex )
		{
			return 0.0;
		}
	}
	
	public static Date getDateFromString( String dateString, String format ) throws Exception
	{
		if ( dateString == null || "".equals( dateString ) ) return null;

		DateFormat sdf = new SimpleDateFormat( format );
		Date date = sdf.parse(dateString);
		return date;
	}
	
	public static String getDateStringFromDate( Date date, String format )
	{
		if ( date == null ) return "";

		DateFormat sdf = new SimpleDateFormat(format);
		String tempDate = sdf.format(date);
		return tempDate;
	}
	
	public static String getNow( String format )
	{
		Date d = new Date();
		return getDateStringFromDate(d, format);
	}
	
	public static void setPostDepartureDateTime( Logger logger, String logIdentifier, Post post) {
		Date dDepartureDateTime = null;
		Date dCreatedDateTime = new Date();
		Date temp = null;
		
		try
		{
			// 수정할 경우에는 createdDate 가 존재함
			if ( Util.isEmptyString( post.getCreatedDate() ) )
				post.setCreatedDate( Util.getDateStringFromDate( dCreatedDateTime, "yyyy-MM-dd HH:mm:ss") );
			
			if ( logger != null )
				logger.info( "debug[" + logIdentifier + "] createdDateTime: " + post.getCreatedDate() );
			
			// 출발일자 설정
			if (post.getDepartureDate().indexOf("오늘") >= 0)
				dDepartureDateTime = dCreatedDateTime;
			else
				dDepartureDateTime = Util.getDateFromString(post.getDepartureDate(), "yyyy-MM-dd");
			
			if ( logger != null )
				logger.info( "debug[" + logIdentifier + "] dDepartureDateTime: " + dDepartureDateTime );
									
			if ( post.getDepartureTime().indexOf( "지금" ) >= 0)
				temp = dCreatedDateTime;
			else
				temp = Util.getDateFromString( post.getDepartureTime(), "HH:mm");
				
			if ( logger != null )
				logger.info( "debug[" + logIdentifier + "] temp: " + temp );
			
			// 출발시간 설정
			dDepartureDateTime.setHours(temp.getHours());
			dDepartureDateTime.setMinutes(temp.getMinutes());
			dDepartureDateTime.setSeconds(0);
			
			post.setDepartureDateTime( Util.getDateStringFromDate( dDepartureDateTime, "yyyy-MM-dd HH:mm:ss"));
			
			if ( logger != null )
				logger.info( "debug[" + logIdentifier + "] post departureDateTime: " + post.getDepartureDateTime() );
			
		}
		catch( Exception ex )
		{
			if ( logger != null )
				logger.error("error while setPostDepartureDateTime : " + ex.getMessage() );
		}
	}
	
	public static String getRegionName( String address )
	{
		if ( address.indexOf("강북구") >= 0 )
			return "강북구";
		else if ( address.indexOf("양천구") >= 0 )
			return "양천구";
		else if ( address.indexOf("관악구") >= 0 )
			return "관악구";
		else if ( address.indexOf("성동구") >= 0 )
			return "성동구";
		else if ( address.indexOf("성북구") >= 0 )
			return "성북구";
		else if ( address.indexOf("광진구") >= 0 )
			return "광진구";
		else if ( address.indexOf("송파구") >= 0 )
			return "송파구";
		else if ( address.indexOf("종로구") >= 0 )
			return "종로구";
		else if ( address.indexOf("노원구") >= 0 )
			return "노원구";
		else if ( address.indexOf("동작구") >= 0 )
			return "동작구";
		else if ( address.indexOf("영등포구") >= 0 )
			return "영등포구";
		else if ( address.indexOf("강남구") >= 0 )
			return "강남구";
		else if ( address.indexOf("서초구") >= 0 )
			return "서초구";
		else if ( address.indexOf("용산구") >= 0 )
			return "용산구";
		else if ( address.indexOf("은평구") >= 0 )
			return "은평구";
		else if ( address.indexOf("구로구") >= 0 )
			return "구로구";
		else if ( address.indexOf("마포구") >= 0 )
			return "마포구";
		else if ( address.indexOf("금천구") >= 0 )
			return "금천구";
		else if ( address.indexOf("중구") >= 0 )
			return "중구";
		else if ( address.startsWith("경기") )
			return "경기도";
		else if ( address.startsWith("부산") )
			return "부산광역시";
		else if ( address.startsWith("인천") )
			return "인천광역시";
		else if ( address.startsWith("대전") )
			return "대전광역시";
		else if ( address.startsWith("대구") )
			return "대구광역시";
		else if ( address.startsWith("광주광") )
			return "광주광역시";
		else if ( address.startsWith("강원") )
			return "강원도";
		else if ( address.startsWith("충청북") )
			return "충청북도";
		else if ( address.startsWith("충청남") )
			return "충청남도";
		else if ( address.startsWith("경상북") )
			return "경상북도";
		else if ( address.startsWith("경상남") )
			return "경상남도";
		else if ( address.startsWith("전라북") )
			return "전라북도";
		else if ( address.startsWith("전라남") )
			return "전라남도";
		else if ( address.startsWith("제주") )
			return "제주도";
		return "";
	}
	
	public static String getRandomSeed()
	{
		Random rnd = new Random();
		int n = 100000 + rnd.nextInt(900000);
		return String.valueOf( n );
	}
	
	public static String getShaHashString( String stringToEncrypt ) throws Exception
	{
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		messageDigest.update(stringToEncrypt.getBytes());
		return new String(messageDigest.digest());
	}
}
