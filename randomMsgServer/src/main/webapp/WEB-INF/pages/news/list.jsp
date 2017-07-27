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
<title>이근처 뉴스</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH %>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/news_blog.css" />

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		Handlebars.registerHelper('plainText', function(text) {
			  return new Handlebars.SafeString(text);
			});
		
<% 	if ( !Util.isEmptyString( favoriteRegions ) && !"설정된 지역이 없습니다.".equals(favoriteRegions)) {
	
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
		$('#contentsDiv').html( html );
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
	</script>
</head>
<body>

	<div id="wrapper">
	
		<form action="/nearhere/region/favoriteRegion.do?userID=<%= userID %>" method="post" name="fm">
		</form>
	
		<div class="section">
		
			<% request.setAttribute("favoriteRegionEmptyMessage", "관심지역이 등록되어 있지 않습니다.<br/>관심지역을 등록하시면 지역뉴스와 블로그를 보실수 있습니다."); %>
			<jsp:include page="../common/favoriteRegionCommon.jsp"/>
			
			<div id="contentsDiv">
			</div>
			
		</div>
	
	</div>

</body>
</html>