package com.dy.common;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Formatter;

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
