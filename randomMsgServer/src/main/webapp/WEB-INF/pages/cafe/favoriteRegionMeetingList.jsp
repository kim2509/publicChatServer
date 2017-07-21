<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	List<HashMap> myFavRegionList = (List<HashMap>) request.getAttribute("myFavRegionList");
%>

<script language="javascript">

	var isApp = '<%= isApp %>';
	var userID = '<%= userID %>';
	
</script>

	
	
	
		
	