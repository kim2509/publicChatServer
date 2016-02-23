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
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/driver.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

	});
	
	function goDriverGetCall()
	{
		document.location.href='driverMain.do?mode=driver';
	}
	
</script>
</head>
<body>

	<div id="wrapper">

		<div class="btn">운전면허증을 업로드 해 주세요</div>
		
		<div class="btn">대리기사 보험서류를 업로드 해주세요</div>
		
		<div class="btn">휴대폰 번호를 등록해 주세요</div>
		
		<div class="btn">사진을 등록해 주세요</div>
		
	</div>

	<div class="btnRegister" onclick="goDriverGetCall();">등록하기</div>
	
</body>
</html>
