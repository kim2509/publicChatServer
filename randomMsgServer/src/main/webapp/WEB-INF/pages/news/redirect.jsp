<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dy.common.*"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");

	String returnURL = request.getParameter("returnURL");
	returnURL = URLDecoder.decode(returnURL);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>

	<!-- Include the jQuery library -->
	<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>

	<script language="javascript">
	
	jQuery(document).ready(function(){
		
		if ('<%= isApp %>' == 'Y' )
		{
			if ( Android && Android != null && typeof Android != 'undefined')
			{
				return Android.finishActivity('BROADCAST_REFRESH_NEWS');
			}
		}
		else
		{
			document.location.href='<%= returnURL %>';	
		}
	});
	
	
	</script>
</head>
<body>


</body>
</html>