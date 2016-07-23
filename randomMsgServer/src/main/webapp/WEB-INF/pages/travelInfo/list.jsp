<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>

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
	border-bottom: 1px solid #eeeeee;
}
a{
	text-decoration: none;color:black;
	line-height: 1.4em;
}

.hostURL{
    color: #ffffff;
    background: #5c5aa7;
    border: 1;
    border: 1px solid #7f9bea;
    border-radius: 10px;
    padding: 10px;
    margin: 10px;
}

</style>

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		console.log('ready');
		
	});
	
	function goFavoriteRegionPage()
	{
		if ( isApp == 'Y' )
		{
			var titleUrlEncoded = encodeURIComponent( '관심지역설정' );
			var url = '<%= Constants.getServerURL() %>/news/favoriteRegion.do?userID=<%= userID %>&isApp=<%= isApp %>';
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + encodeURIComponent( url );
		}
		else
			document.fm.submit();
	}
	
	function openURL( title, url )
	{
		var titleUrlEncoded = encodeURIComponent( '상세' )
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&disableWebViewClient=Y&fullURL=' + encodeURIComponent( url );
		else
			document.location.href= url;
	}
	
	function goHostURL( url )
	{
		document.location.href='nearhere://openExternalURL?url=' + encodeURIComponent(url);
	}
	
	</script>
</head>
<body>

	<div id="wrapper">
	
	<form action="/nearhere/news/favoriteRegion.do?userID=<%= userID %>" method="post" name="fm">
	</form>
	
	<div class="section">
		<div id="menu_category">
			<div class="title">
				<span style="color:#2e4986;position: absolute;right: 10px;font-weight:bold;" onclick="goFavoriteRegionPage();">설정</span>
				<span class="s_tit">관심지역</span>
			</div>
			<div style="padding-top:10px;padding-left:10px;padding-right:10px;"><%= favoriteRegions %></div>
		</div>
		
	</div>
	
	<% for ( int i = 0; i < newsList.size(); i++ ) { 
		
		HashMap regionItem = newsList.get(i);
		
		String hostURL = Util.isEmptyString(regionItem.get("hostURL")) ? "" : regionItem.get("hostURL").toString();
		
		ArrayList<HashMap> news = (ArrayList<HashMap>) regionItem.get("news");	
	%>
	
	<div class="section">
		<div id="menu_category">
			<div class="title">
				<!-- span style="color:#2e4986;position: absolute;right: 10px;font-weight:bold;"><a href="www.naver.com">홈페이지 이동</a></span-->
				<span class="s_tit"><%= regionItem.get("regionName") %></span>
			</div>
		</div>
		
		<div>
				<ul style="list-style:none;padding:0px;">
<%
	for ( int j = 0; j < news.size(); j++ ) {
		
		HashMap<String,String> hash = news.get(j);
		String title = hash.get("title");
		title = title.replaceAll("\\\"", "");
		String link = hash.get("link");
%>
					<li><a href="javascript:void(0)" onclick="openURL('상세','<%= link %>');"><%= hash.get("title") %></a></li>		
<%
	}
%>
				</ul>
		</div>
		
		<% if ( !Util.isEmptyString( hostURL ) ) { %>
		<div style="text-align:center; width:100%;font-weight:bold;margin-bottom:10px;margin-top:10px;">
			<a href="javascript:void(0)" onclick="goHostURL('<%= hostURL %>');" class="hostURL"><%= regionItem.get("regionName") %> 바로가기</a>
		</div>	
		<% } %>
	</div>
	
	<% } %>

	
	</div>

</body>
</html>