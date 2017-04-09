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
<title>카페 리스트</title>

<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>
		
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=2" />

<script language="javascript">

	var isApp = '<%= isApp %>';

	var startIndex = 0;
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	var pageNo = 1;
	var pageSize = 10;
	var totalItemCount = 0;
	
	function initPagingVars()
	{
		startIndex = 0;
		firstPage = 0;
		lastPage = 0;
		numOfPagesOnScreen = 5;
		pageNo = 1;
		pageSize = 10;
		totalItemCount = 0;
	}
	
	jQuery(document).ready( function () {
		
		try
		{
			Handlebars.registerHelper('displayDateFormat', displayDateFormat );
			
			// 내 카페 리스트 불러오기
			cafeTabSelected(0);

		}
		catch( ex )
		{
			alert( ex.message );
		}
	});

	function cafeTabSelected( tabIndex )
	{
		$('#myCafeList').hide();
		$('#favRegionCafeList').hide();
		$('#popularCafeList').hide();
		
		$('#cafeList .loading').show();
		
		if ( tabIndex == 0 )
		{
			$('#myCafeList').show();
			var param = {"startIndex":startIndex, "showCount" : pageSize};
			ajaxRequest('POST', '/nearhere/cafe/getMyCafeListAjax.do', param , onMyCafeListReceived );			
		}
		else if ( tabIndex == 1 )
		{
			$('#favRegionCafeList').show();
		}
		else if ( tabIndex == 2 )
		{
			$('#popularCafeList').show();
			var param = {"startIndex":startIndex, "showCount" : pageSize};
			ajaxRequest('POST', '/nearhere/cafe/getPopularCafeListAjax.do', param , onPopularCafeListReceived );
		}
		
		$('#cafeTab li').removeClass('selected');
		$('#cafeTab li').eq(tabIndex).addClass('selected');
	}

	function onMyCafeListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		$('#cafeList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#myCafeList').html(html);
			
			if ( result.data.length == 0 )
			{
				$('#myCafeList .empty').html('가입한 카페가 존재하지 않습니다.');
			}
			
			totalItemCount = result.data2;
			
			if ($('#pagingInfo').length > 0 )
			{
				$('#pagingInfo').show();
				displayPagingInfo();
			}
		}
	}
	
	function onPopularCafeListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		$('#cafeList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#popularCafeList').html(html);
			
			totalItemCount = result.data2;
			
			if ($('#pagingInfo').length > 0 )
			{
				$('#pagingInfo').show();
				displayPagingInfo();
			}
		}
	}
	
	function goCafeHome( cafeID )
	{
		var url = '<%= Constants.getServerURL() %>/cafe/' + cafeID +'?isApp=<%= isApp %>';

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent( url ) + '';
		else
			document.location.href= url;
	}
	
	function displayPagingInfo()
	{
		$('#pagingInfo').empty();
		
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
		
		if ( $('#cafeTab li').eq(0).attr('class') == 'selected' )
		{
			var param = {"startIndex":startIndex, "showCount" : pageSize};
			ajaxRequest('POST', '/nearhere/cafe/getMyCafeListAjax.do', param , onMyPublicMeetingListReceived );
		}
		else if ( $('#cafeTab li').eq(1).attr('class') == 'selected' )
		{
			
		}
		if ( $('#cafeTab li').eq(2).attr('class') == 'selected' )
		{
			var param = {"startIndex":startIndex, "showCount" : pageSize};
			ajaxRequest('POST', '/nearhere/cafe/getPopularCafeListAjax.do', param , onPopularPublicMeetingListReceived );
		}
	}
	
</script>
<script id="cafeT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="cafeListUL">
		{{#each data}}
		<li onclick="goCafeHome('{{cafeID}}');">
			<div>
				<div class="cafeImage">
				<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
				</div>
				<div class="cafeInfo">
					<div class="cafeTitle">{{cafeName}}</div>
					<div class="cafeDesc">{{mainDesc}}</div>
					<div class="regionInfo">{{lRegionName}} {{mRegionName}} {{sRegionName}} {{tRegionName}}</div>
					<div class="memberInfo">멤버수 : {{cntMembers}}명</div>
				</div>
			</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">카페가 존재하지 않습니다.</div>
	{{/if}}
</script>

</head>
<body style="background:white;">
	
	<div id="wrapper">
	
		<div class="titleDiv">
			<div class="title">카페 리스트</div>
		</div>
		
		<ul id="cafeTab" class="tab3 margin10">
			<li onclick="cafeTabSelected(0);" class="selected">내 카페</li>
			<li onclick="cafeTabSelected(1);">관심지역 카페</li>
			<li onclick="cafeTabSelected(2);">인기 카페</li>
		</ul>
		
		<div id="cafeList">
		
			<div class="loading" style="display:none;">목록을 읽어오는 중입니다.</div>
	
			<div id="myCafeList" style="display:none;" class="margin10">
			</div>
			
			<div id="favRegionCafeList" style="display:none;" class="margin10">
				
			</div>
			
			<div id="popularCafeList" style="display:none;" class="margin10">
				
			</div>
			
		</div>
		
		<div id="pagingInfo" style="text-align: center; margin-top: 10px; font-weight: bold; display: block;">
		</div>
		
	</div>
	
</body>
</html>