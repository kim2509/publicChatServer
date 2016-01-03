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

	<div>
		<a href="http://market.android.com/details?id=com.tessoft.nearhere">
			<img id="image" src='<%= Constants.IMAGE_PATH %>/nearhere_promotion.png' height="90" style="width:100%;"/>
		</a>
	</div>

	<div style="height:300px;display: -webkit-box;min-height: 176px;text-align: center;-webkit-box-orient: vertical;-webkit-box-pack: center;">
		<p style="text-align:center;margin:auto;">위치공유 URL 이 종료되었거나<br/>존재하지 않습니다.</p>
	</div>
	
</body>
</html>