<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

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

#map {
	width: 100%;
	height: 100%;
	align: center
}

#over_map { position: absolute; top: 100px; left: 40px; z-index: 99;}
</style>

<script type="text/javascript"
	src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>

</head>
<body>
	요청 URL 이 만료되었거나 존재하지 않습니다.
</body>
</html>