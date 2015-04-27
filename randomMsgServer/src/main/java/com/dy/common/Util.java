package com.dy.common;

import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;

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
	
//	public static String getDateDiffFromNow( String dateString )
//	{
//		String dateStart = "11/03/14 09:29:58";
//		String dateStop = "11/03/14 09:33:43";
//
//		// Custom date format
//		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");  
//
//		Date d1 = null;
//		Date d2 = null;
//		try {
//		    d1 = format.parse(dateStart);
//		    d2 = format.parse(dateStop);
//		} catch (ParseException e) {
//		    e.printStackTrace();
//		}    
//	}
}
