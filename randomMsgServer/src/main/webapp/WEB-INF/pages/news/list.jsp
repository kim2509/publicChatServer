<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
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


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH %>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>


<style type="text/css">

body{background:#eeeeee;}

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

a{
	text-decoration: none;color:black;
	line-height: 1.4em;
}

ul{
	padding:0px;
	margin:0px;
}

li {
	list-style:none;
	padding: 10px;
	clear:both;
}

.title{
	color: #005fc1;
	display: -webkit-box;
	overflow:hidden;
	text-overflow: ellipsis;
	font-size: 16px;
  	line-height: 1.4;
	-webkit-line-clamp: 1;
  	-webkit-box-orient: vertical;
  	margin-bottom:10px;
}

.subject {
    font-weight: bold;
    font-size: 16px;
    padding-bottom: 10px;
    margin-bottom: 10px;
    border-bottom: 2px solid gray;
    clear:both;
    margin-left:10px;
    margin-right:10px;
    margin-top:10px;
}

.desc{
	color: #666;
	display: -webkit-box;
	overflow:hidden;
	text-overflow: ellipsis;
	font-size: 16px;
  	line-height: 1.4;
	-webkit-line-clamp: 2;
  	-webkit-box-orient: vertical;
}

.date{
	font-size:13px;
	margin-top:5px;
	float:right;
	color: #666;
}

</style>

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		Handlebars.registerHelper('plainText', function(text) {
			  return new Handlebars.SafeString(text);
			});
		
<% 	if ( !Util.isEmptyString( favoriteRegions ) ) {
	
		String[] favoriteRegionList = favoriteRegions.split("\\,");
		
		for ( int i = 0; i < favoriteRegionList.length; i++ ) {
%>
		getRegionNews('<%= favoriteRegionList[i] %>');
<%
		}	
	} 
%>
		
	});
	
	function goFavoriteRegionPage()
	{
		if ( isApp == 'Y' )
		{
			var titleUrlEncoded = encodeURIComponent( '관심지역설정' );
			var url = '<%= Constants.getServerURL() %>/region/favoriteRegion.do?userID=<%= userID %>&isApp=<%= isApp %>';
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
	
	function getRegionNews( regionName )
	{
		var param = {"regionName": encodeURIComponent( regionName ) };
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/news/getRegionNews.do",
			data : JSON.stringify( param ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					displayUserFavoriteRegionList( result );
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				
			},
			error : function(xhr, status, error) {
				alert("에러발생(deleteRegion)" + error );
			}
		});
	}
	
	function displayUserFavoriteRegionList( result )
	{
		var source = $('#regionInfoT').html();
		var template = Handlebars.compile(source);
		var html = template(result);
		$('#wrapper').append( html );
	}
	
	function goLink( title, url )
	{
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + encodeURIComponent( title ) + '&url=' + encodeURIComponent(url);
		else
			document.location.href = url;
	}
	
	</script>
	
	<script id="regionInfoT" type="text/x-handlebars-template">
	<div class="section">
		<div class="subject">{{data.regionName}} 뉴스</div>
		<ul id="regionInfoList">
			{{#each data.newsList}}
				<li onclick="goLink('뉴스', '{{originallink}}')">
					<div class="title">{{plainText title}}</div>
					<div class="desc">{{plainText description}}</div>
					<div class="date">{{pubDate}}</div>
				</li>
			{{/each}}
		</ul>

		<div class="subject">{{data.regionName}} 블로그</div>
		<ul id="regionInfoList2">
			{{#each data.blogList}}
				<li onclick="goLink('블로그','{{link}}')">
					<div class="title">{{plainText title}}</div>
					<div class="desc">{{plainText description}}</div>
				</li>
			{{/each}}
		</ul>
	</div>
	</script>
</head>
<body>

	<div id="wrapper">
	
		<form action="/nearhere/region/favoriteRegion.do?userID=<%= userID %>" method="post" name="fm">
		</form>
	
		<div class="section">
			
			<div class="subject">관심지역 리스트</div>
			<div style="padding-left:10px;padding-right:10px;color:#005fc1"><%= favoriteRegions %></div>
			<input type="button" value="설정 바로가기" onclick="goFavoriteRegionPage();" style="width:60%;margin-left:10px;padding:5px;"/>
		</div>
	
	</div>

</body>
</html>