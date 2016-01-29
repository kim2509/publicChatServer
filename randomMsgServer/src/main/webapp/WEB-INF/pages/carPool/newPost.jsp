<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	
%>
<html>

<head>
<title>합승정보 등록</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/newPost.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">
	jQuery(document).ready(function() {

		
		
	});
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="departure">서울시 관악구 인헌동</div>
		
		<div class="destination">도착지 선택</div>
		
		<div class="departureDateTime">
			<div class="departureDate">출발일 설정</div>
			<div class="departureTime">출발시간 설정</div>
		</div>

		<div class="btnRegister">등록하기</div>
	</div>
	
</body>
</html>
