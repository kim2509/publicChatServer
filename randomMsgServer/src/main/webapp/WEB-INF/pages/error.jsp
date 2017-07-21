<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String errMsg = request.getAttribute("errMsg").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.titleDiv{
	background:#7bafe3;;
	color:white;
	height:50px;
	text-align:center;
	width: 100%;
}


.title{
	font-weight:bold;
	font-size:20px;
	vertical-align:middle;
	line-height:50px;
}

</style>

<script type="text/javascript" src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>

</head>
<body>

	<div class="titleDiv">
		<div class="title">오류</div>
	</div>

	<div style="height:300px;display: -webkit-box;min-height: 176px;text-align: center;-webkit-box-orient: vertical;-webkit-box-pack: center;">
		<p style="text-align:center;margin:auto;"><%= errMsg %></p>
	</div>
	
</body>
</html>