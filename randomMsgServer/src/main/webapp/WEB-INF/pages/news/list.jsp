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
<script type="text/javascript" src="<%=Constants.JS_PATH %>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH %>/news_blog.css" />

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	var startIndex = 0;
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	var pageNo = 1;
	var pageSize = 10;
	var totalItemCount = 0;
	var inquiryType = 'news';
	
	
	jQuery(document).ready(function(){
		
		Handlebars.registerHelper('plainText', function(text) {
			  return new Handlebars.SafeString(text);
			});
		
<% 	if ( !Util.isEmptyString( favoriteRegions ) && !"설정된 지역이 없습니다.".equals(favoriteRegions)) {
	
		String[] favoriteRegionList = favoriteRegions.split("\\,");
		
		for ( int i = 0; i < favoriteRegionList.length; i++ ) {
%>
		getRegionNews();
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
	
	function getRegionNews()
	{
		inquiryType = 'news';
		var regionName = $('.favoriteRegionUL li[class=selected]').attr('lastRegionName');
		
		var param = {"inquiryType": inquiryType, "regionName": regionName, "startIndex":startIndex, "showCount" : pageSize };
		
		ajaxRequest('POST', '/nearhere/news/getRegionNewsBlog.do', param , displayUserFavoriteRegionList );
	}
	
	function getRegionBlog()
	{
		inquiryType = 'blog';
		var regionName = $('.favoriteRegionUL li[class=selected]').attr('lastRegionName');
		
		var param = {"inquiryType": inquiryType, "regionName": regionName, "startIndex":startIndex, "showCount" : pageSize };
		
		ajaxRequest('POST', '/nearhere/news/getRegionNewsBlog.do', param , displayUserFavoriteRegionList );
	}
	
	function changeRegion( element, regionNo, level )
	{
		pageNo = 1;
		startIndex = 0;
		
		$('#favoriteRegionDiv .favoriteRegionUL li').removeClass('selected');		
		$(element).addClass('selected');
		
		getRegionNews();	
	}
	
	function displayUserFavoriteRegionList( result )
	{
		var source = '';
		
		if (inquiryType == 'news')
			source = $('#newsT').html();
		else if ( inquiryType == 'blog')
			source = $('#blogT').html();
		else
			alert('알수 없는 오류');
		
		var template = Handlebars.compile(source);
		var html = template(result);
		$('#contentsDiv').html( html );
		
		totalItemCount = result.data2;
		if ( totalItemCount > 1000)
			totalItemCount = 1000;
		
		if ($('#pagingInfo').length > 0 && totalItemCount > 0 )
		{
			$('#pagingInfo').show();
			displayPagingInfo();
		}
	}
	
	function goLink( title, url )
	{
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + encodeURIComponent( title ) + '&url=' + encodeURIComponent(url);
		else
			document.location.href = url;
	}
	
	function displayPagingInfo()
	{
		$('#pagingInfo').empty();
		
		if ( totalItemCount < 1 )
			return;
		
		if ( pageNo <= numOfPagesOnScreen )
			firstPage = 1;
		else
		{
			firstPage = parseInt(pageNo / numOfPagesOnScreen) * numOfPagesOnScreen;
			if ( pageNo % numOfPagesOnScreen == 0 )
				firstPage = firstPage - numOfPagesOnScreen + 1;
			else
				firstPage++;
		}
		
		lastPage = parseInt( totalItemCount / pageSize );
		if ( (parseInt(totalItemCount) % parseInt(pageSize)) > 0)
			lastPage++;
		
		if ( firstPage > numOfPagesOnScreen + 1)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(1);">&lt;&lt;</a>');
		
		if ( firstPage != 1 )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage - 1) + ');">&lt;</a>');
		
		for ( var i = 0; i < numOfPagesOnScreen; i++ )
		{
			if ( firstPage + i == pageNo)
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" class="pageSelected">' + (firstPage + i) + '</a>');
			}
			else
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" >' + (firstPage + i) + '</a>');
			}
		
			if ( (firstPage + i) == lastPage )
				break;
		}
		
		if ( lastPage > firstPage + numOfPagesOnScreen )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + numOfPagesOnScreen) + ');" >&gt;</a>');
		
		if ( firstPage + numOfPagesOnScreen <= lastPage )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + lastPage + ');" >&gt;&gt;</a>');
		
	}
	
	function goPage(num)
	{
		pageNo = num;
		startIndex = (pageNo - 1) * pageSize;
		
		if ( inquiryType == 'news')
			getRegionNews();
		else if ( inquiryType == 'blog')
			getRegionBlog();
	}
	
	</script>
	
	<script id="newsT" type="text/x-handlebars-template">
		<div class="newsOption" onclick="getRegionBlog();">블로그 보기</div>
		<div class="subject">{{data.regionName}} 뉴스</div>
		{{#if data.newsList}}
		<ul id="regionInfoList">
			{{#each data.newsList}}
				<li onclick="goLink('뉴스', '{{originallink}}')">
					<div class="title">{{plainText title}}</div>
					<div class="desc">{{plainText description}}</div>
					<div class="date">{{pubDate}}</div>
				</li>
			{{/each}}
		</ul>
		{{else}}
		<div class="empty">뉴스가 존재하지 않습니다.</div>
		{{/if}}
	</script>
	
	<script id="blogT" type="text/x-handlebars-template">
		<div class="blogOption" onclick="getRegionNews();">뉴스 보기</div>
		<div class="subject">{{data.regionName}} 블로그</div>
		{{#if data.blogList}}
		<ul id="regionInfoList2">
			{{#each data.blogList}}
				<li onclick="goLink('블로그','{{link}}')">
					<div class="title">{{plainText title}}</div>
					<div class="desc">{{plainText description}}</div>
				</li>
			{{/each}}
		</ul>
		{{else}}
		<div class="empty">블로그가 존재하지 않습니다.</div>
		{{/if}}
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
			
			<div id="pagingInfo">
			</div>
		
		</div>
	
	</div>

</body>
</html>