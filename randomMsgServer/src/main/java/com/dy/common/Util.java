package com.dy.common;

import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.apache.commons.codec.binary.Base64;
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
		if ( "null".equals( str.toLowerCase() ) ) return true;
		if ( "".equals(str.trim())) return true;
		if (str.trim().length() == 0) return true;
		return false;
	}
	
	public static boolean isEmptyString( Object obj )
	{
		if ( obj == null ) return true;
		if ( "".equals( obj.toString().trim())) return true;
		return false;
	}
	
	public static boolean isEmptyForKey( Map hash, String key )
	{
		if ( hash == null ) return true;
		
		if ( !hash.containsKey(key) || Util.isEmptyString(hash.get(key)) ) return true;
		
		return false;
	}
	
	public static String getStringFromHash( Map hash, String key )
	{
		if ( Util.isEmptyForKey(hash, key) ) return "";
		
		return hash.get(key).toString();
	}
	
	public static int getInt( Object val )
	{
		if ( isEmptyString( val ) ) return 0;
		
		try
		{
			return Integer.parseInt( val.toString() );	
		}
		catch( Exception ex )
		{
			return 0;
		}
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
	
	public static String getString( Object obj )
	{
		if ( Util.isEmptyString(obj) ) return "";
		else return obj.toString();
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
	
	public static String getDepartureDateTime( String departureDateTime )
	{
		Date dDepartureDateTime = null;
		Date now = new Date();
		String nowDateString = "";
		String departureDateString = "";
		
		String result = "";
		try
		{
			dDepartureDateTime = getDateFromString(departureDateTime, "yyyy-MM-dd HH:mm:ss");
			result = getDateStringFromDate(dDepartureDateTime,  "yyyy-MM-dd HH:mm");
			
			Date today = getDateFromString( getNow("yyyy-MM-dd"), "yyyy-MM-dd" );
			Date departureDate = getDateFromString(departureDateTime, "yyyy-MM-dd");
			
			long diff = now.getTime() - dDepartureDateTime.getTime();
			long diffDays = TimeUnit.DAYS.convert(today.getTime() - departureDate.getTime(), TimeUnit.MILLISECONDS);
			long diffHours = TimeUnit.HOURS.convert(diff, TimeUnit.MILLISECONDS);
			long diffMinutes = TimeUnit.MINUTES.convert(diff, TimeUnit.MILLISECONDS);
			
			nowDateString = Util.getDateStringFromDate(now, "yyyy-MM-dd");
			departureDateString = Util.getDateStringFromDate(dDepartureDateTime, "yyyy-MM-dd");
			
			if ( diffDays > 0 ||
					( diffDays == 0 && diffHours > 0 && !nowDateString.equals(departureDateString)))
			{
				// 오늘 이전
				if ( diffDays == 0 )
					result = diffHours + "시간 전 출발";
				else if ( diffDays <= 5 ) // 5일 이내
					result = diffDays + " 일전 출발";
				else // 5일 이상
					result = getDateStringFromDate(dDepartureDateTime,  "MM월 dd일") + " 출발"; 
			}
			else if ( diffDays == 0 && nowDateString.equals(departureDateString) )
			{
				// 오늘
				diffMinutes -= diffHours * 60;
				
				if ( diffHours > 0 && diffMinutes <= 10 )
					result = diffHours + " 시간전 출발";
				else if ( diffHours > 0 && diffMinutes > 10 )
					result = diffHours + "시간 " + diffMinutes + "분전 출발";
				else if ( diffHours == 0 && diffMinutes > 10 )
					result = diffMinutes + "분전 출발";
				else
				{
					// 지금 시간 이후
					if ( diffHours == 0 && diffMinutes < -10 )
						result = diffMinutes * -1 + "분후";
					else if ( diffHours == 0 && diffMinutes > -10 )
						result = "곧";
					else if ( diffHours < 0 && diffMinutes > -10 )
						result = diffHours * -1 + "시간 이후";
					else
						result = diffHours * -1 + "시간 " + diffMinutes * -1 + "분 이후";
					
					result += " 출발예정";
				}
			}
			else if ( diffDays < 0 || ( diffDays == 0 && !nowDateString.equals(departureDateString) ) )
			{
				// 오늘 이후
				if ( diffDays < 0 )
					result = getDateStringFromDate(dDepartureDateTime,  " MM월 dd일") + " 출발예정";
				else
					result = diffHours * -1 + "시간 이후 출발예정";
			}
		}
		catch( Exception ex )
		{
		}
		
		return result;
	}
	
	public static String getRegionName( String address )
	{
		if ( address.indexOf("강남구") >= 0 )
			return "서울";
		if ( address.indexOf("강북구") >= 0 )
			return "서울";
		else if ( address.indexOf("강서구") >= 0 )
			return "서울";
		else if ( address.indexOf("관악구") >= 0 )
			return "서울";
		else if ( address.indexOf("광진구") >= 0 )
			return "서울";
		else if ( address.indexOf("구로구") >= 0 )
			return "서울";
		else if ( address.indexOf("금천구") >= 0 )
			return "서울";
		else if ( address.indexOf("노원구") >= 0 )
			return "서울";
		else if ( address.indexOf("도봉구") >= 0 )
			return "서울";
		else if ( address.indexOf("동작구") >= 0 )
			return "서울";
		else if ( address.indexOf("마포구") >= 0 )
			return "서울";
		else if ( address.indexOf("송파구") >= 0 )
			return "서울";
		else if ( address.indexOf("서초구") >= 0 )
			return "서울";
		else if ( address.indexOf("성동구") >= 0 )
			return "서울";
		else if ( address.indexOf("성북구") >= 0 )
			return "서울";
		else if ( address.indexOf("서대문구") >= 0 )
			return "서울";
		else if ( address.indexOf("양천구") >= 0 )
			return "서울";
		else if ( address.indexOf("영등포구") >= 0 )
			return "서울";
		else if ( address.indexOf("용산구") >= 0 )
			return "서울";
		else if ( address.indexOf("은평구") >= 0 )
			return "서울";
		else if ( address.indexOf("종로구") >= 0 )
			return "서울";
		else if ( address.indexOf("중구") >= 0 )
			return "서울";
		else if ( address.indexOf("중랑구") >= 0 )
			return "서울";
		else if ( address.startsWith("경기") )
			return "경기도";
		else if ( address.startsWith("부산") )
			return "부산광역시";
		else if ( address.startsWith("인천") )
			return "인천광역시";
		else if ( address.startsWith("대전") )
			return "대전광역시";
		else if ( address.startsWith("울산") )
			return "울산광역시";
		else if ( address.startsWith("대구") )
			return "대구광역시";
		else if ( address.startsWith("광주광") )
			return "광주광역시";
		else if ( address.startsWith("강원") )
			return "강원도";
		else if ( address.startsWith("충청북") || address.startsWith("충북") )
			return "충청북도";
		else if ( address.startsWith("충청남") || address.startsWith("충남") )
			return "충청남도";
		else if ( address.startsWith("경상북") || address.startsWith("경북") )
			return "경상북도";
		else if ( address.startsWith("경상남") || address.startsWith("경남") )
			return "경상남도";
		else if ( address.startsWith("전라북") || address.startsWith("전북") )
			return "전라북도";
		else if ( address.startsWith("전라남") || address.startsWith("전남") )
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
		byte[] data = Base64.encodeBase64( messageDigest.digest() );
		return new String( data );
	}
	
	public static String getSha1HashString( String stringToEncrypt ) throws Exception
	{
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
		messageDigest.update(stringToEncrypt.getBytes());
		byte[] data = Base64.encodeBase64( messageDigest.digest() );
		return new String( data );
	}
	
	public static String stripBunji( String address ) throws Exception
	{
		String result = "";
		
		if ( address == null ) return "";
		
		String[] tokens = address.split(" ");
		
		int gu = 0;
		int si = 0;
		int dong = 0;
		int myeon = 0;
		int li = 0;
		
		for( int i = 0; i < tokens.length; i++ )
		{
			String token = tokens[i].trim();
			
			if ( token.endsWith("구") && gu == 0 ) gu = i;
			if ( token.endsWith("시") && si == 0 ) si = i;
			if ( ( token.endsWith("동") || token.indexOf("동") >= 0 && token.indexOf("가") >= 0 || token.indexOf("로") >= 0 && token.indexOf("가") >= 0 ) && dong == 0 ) dong = i;
			if ( token.endsWith("면") && myeon == 0 ) myeon = i;
			if ( token.endsWith("리") && li == 0 ) li = i;
		}
		
		if ( li > 0 )
		{
			for ( int i = 0; i <= li; i++ )
				result += tokens[i].trim() + " ";
		}
		else if ( dong > 0 )
		{
			for ( int i = 0; i <= dong; i++ )
				result += tokens[i].trim() + " ";
		}
		else if ( si > 0 )
		{
			for ( int i = 0; i <= si; i++ )
				result += tokens[i].trim() + " ";
		}
		else if ( gu > 0 )
		{
			for ( int i = 0; i <= gu; i++ )
				result += tokens[i].trim() + " ";
		}
		else
			return address;
		
		return result.trim();
	}
	
	public static String[] splitRegions( String address )
	{
		String[] tokens = address.split(" ");
		
		for( int i = 0; i < tokens.length; i++ )
			tokens[i] = tokens[i].trim();
		
		ArrayList list = new ArrayList();
		
		// 리 가 있는지 체크
		if ( !Util.isEmptyString( tokens[tokens.length - 1 ] ) && tokens[tokens.length - 1 ].endsWith("리"))
		{
			if ( tokens.length == 4 )
			{
				list.add(tokens[0]);
				list.add(tokens[1]);
				list.add(tokens[2]);
				list.add(tokens[3]);
			}
			else if ( tokens.length == 5 )
			{
				list.add(tokens[0]);
				list.add(tokens[1] + " " + tokens[2]);
				list.add(tokens[3]);
				list.add(tokens[4]);
			}
			else
			{
				for ( int i = 0; i < tokens.length; i++ )
					list.add(tokens[i]);

			}
		}
		else
		{
			if ( tokens.length == 3 )
			{
				list.add(tokens[0]);
				list.add(tokens[1]);
				list.add(tokens[2]);
			}
			else if ( tokens.length == 4 )
			{
				list.add(tokens[0]);
				list.add(tokens[1] + " " + tokens[2]);
				list.add(tokens[3]);
			}
			else
			{
				for ( int i = 0; i < tokens.length; i++ )
					list.add(tokens[i]);
			}
		}
		
		String[] result = (String[]) list.toArray(new String[list.size()]);
		
		return result;
	}
}
