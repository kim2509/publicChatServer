<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");
%>
<html>

<head>
<title>대리운전</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

	});
	
	function goWaitingDriver()
	{
		document.location.href='waitingDriver.do';
	}
	
</script>
</head>
<body>

	<div id="wrapper">

		출발지
		
		<br/>
		
		도착지
		
		<br/>
		
		경유지
		
		<br/>
		
		금액
		
	</div>

	<div onclick="goWaitingDriver();">호출하기</div>
	
</body>
</html>
