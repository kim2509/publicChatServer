<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/moreFavoriteMeeting.css" />

</head>
<body>

	<div id="wrapper">
		
		<div class="titleDiv">
			<div class="title">관심지역 정모</div>
		</div>
		
		<div id="favoriteRegionDiv">
			<ul class="favoriteRegion">
				<li>
					서울시 강남구 역삼동
				</li>
				<li>
					서울시 송파구 방이동
				</li>
				<li>
					포항시 남구 연일읍 택전리
				</li>
				<li>
					서울시 강남구 역삼동
				</li>
				<li>
					서울시 송파구 방이동
				</li>
				<li>
					포항시 남구 연일읍 택전리
				</li>
			</ul>
		</div>
	</div>
	
</body>
</html>