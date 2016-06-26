<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ArrayList<HashMap> items = (ArrayList<HashMap>) request.getAttribute("items");
	ArrayList<HashMap> newsList = (ArrayList<HashMap>) request.getAttribute("newsList");
	ArrayList<HashMap> cities = (ArrayList<HashMap>) request.getAttribute("cities");
	String userID = request.getParameter("userID");
	String favoriteRegions = request.getAttribute("favoriteRegions").toString();
	if ( Util.isEmptyString(favoriteRegions) )
	{
		favoriteRegions = "설정된 지역이 없습니다.";
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>

<link rel="stylesheet" href="<%=Constants.CSS_PATH%>/jquery.mobile-1.4.5.min.css">

<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>
<!-- Include the jQuery Mobile library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery.mobile-1.4.5.min.js"></script>

<style type="text/css">

span{ padding:5px; }

.section{
	border-radius: 10px;
	border: 1px solid gray;
	background:white;
	padding:10px;
	margin-bottom:10px;
}

#menu_category {background:#fff;}
#menu_category .title {position:relative; height:33px; padding:0 12px 0 12px; background:#dee2e8; border-top:1px solid #bcc4cd; /*border-bottom:2px solid #0c1420;*/ display:box; box-orient:vertical;box-pack:center;display:-webkit-box;-webkit-box-orient:vertical;-webkit-box-pack:center;display:-moz-box;-moz-box-orient:vertical;-moz-box-pack:center; -webkit-box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing: border-box}
#menu_category .title .s_tit {display:block; font-weight:normal; font-size:0.81em; letter-spacing:-1px; color:#707b8b}

li{
	padding:3px;
}
a{
	text-decoration: none;color:#2e4986;
	line-height: 1.2em;
}
</style>

	<script language="javascript">
	
	jQuery(document).ready(function(){
		
		console.log('ready');
		
	});
	
	function goFavoriteRegionPage()
	{
		document.fm.submit();
	}
	
	</script>
</head>
<body>

	<div id="wrapper" data-role="page">
	
	<form action="/nearhere/news/favoriteRegion.do?userID=<%= userID %>" method="post" name="fm">
	</form>
	
	<div class="section">
		<div id="menu_category">
			<div class="title">
				<span style="color:#2e4986;position: absolute;right: 10px;font-weight:bold;" onclick="goFavoriteRegionPage();">설정</span>
				<span class="s_tit">관심지역</span>
			</div>
			<div style="padding:5px;"><%= favoriteRegions %></div>
		</div>
		
	</div>
	
	<% for ( int i = 0; i < newsList.size(); i++ ) { 
		
		HashMap regionItem = newsList.get(i);
		
		ArrayList<HashMap> news = (ArrayList<HashMap>) regionItem.get("news");	
	%>
	
	<div class="section">
		<div id="menu_category">
			<div class="title">
				<!-- span style="color:#2e4986;position: absolute;right: 10px;font-weight:bold;"><a href="www.naver.com">홈페이지 이동</a></span-->
				<span class="s_tit"><%= regionItem.get("regionName") %></span>
			</div>
		</div>
		
		<div style="padding:5px;">
				<ul style="list-style:none;padding:0px;">
<%
	for ( int j = 0; j < news.size(); j++ ) {
		
		HashMap<String,String> hash = news.get(j);
		String link = hash.get("link");
%>
		<li><a href="<%= link %>"><%= hash.get("title") %></li>		
<%
	}
%>
				</ul>
			</div>
			
	</div>
	
	<% } %>

	
	</div>

</body>
</html>