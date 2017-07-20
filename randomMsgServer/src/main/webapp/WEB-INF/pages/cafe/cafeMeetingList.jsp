<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");	
	String cafeID = request.getParameter("cafeID");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>정모 리스트</title>

<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>
		
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=3" />

<script language="javascript">

	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	
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
			
			// 내 카페 정모 리스트 불러오기
			publicMeetingTabSelected(0);
		}
		catch( ex )
		{
			alert( ex.message );
		}
	});

	function publicMeetingTabSelected( tabIndex )
	{
		$('#publicMeetingList .loading').show();
		
		initPagingVars();
		
		$('#meetingList .empty').hide();
		$('#meetingList').show();
		
		$('#meetingListDiv').html('');
		$('#pagingInfo').html('');
		
		if ( tabIndex == 0 )
		{
			var param = {"cafeID":cafeID, "startIndex":startIndex, "showCount" : pageSize, "type":"1"};
			ajaxRequest('POST', '/nearhere/cafe/getMeetingListByCafeIDAjax.do', param , meetingListReceived );
		}
		else if ( tabIndex == 1 )
		{
			var param = {"cafeID":cafeID, "startIndex":startIndex, "showCount" : pageSize, "type":"2"};
			ajaxRequest('POST', '/nearhere/cafe/getMeetingListByCafeIDAjax.do', param , meetingListReceived );
		}

		$('#publicMeetingTab li').removeClass('selected');
		$('#publicMeetingTab li').eq(tabIndex).addClass('selected');
	}

	function meetingListReceived( result )
	{
		$('#publicMeetingList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#publicMeetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#meetingListDiv').html(html);
			
			totalItemCount = result.data2;
			
			if ($('#pagingInfo').length > 0 && totalItemCount > 0 )
			{
				$('#meetingListDiv').show();
				$('#pagingInfo').show();
				displayPagingInfo();
			}
		}
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
		
		if ( $('#publicMeetingTab li').eq(0).attr('class') == 'selected' )
		{
			var param = {"cafeID":cafeID, "startIndex":startIndex, "showCount" : pageSize, "type":"1"};
			ajaxRequest('POST', '/nearhere/cafe/getMeetingListByCafeIDAjax.do', param , meetingListReceived );
		}
		if ( $('#publicMeetingTab li').eq(1).attr('class') == 'selected' )
		{
			var param = {"cafeID":cafeID, "startIndex":startIndex, "showCount" : pageSize, "type":"2"};
			ajaxRequest('POST', '/nearhere/cafe/getMeetingListByCafeIDAjax.do', param , meetingListReceived );
		}
	}
	
</script>
<script id="publicMeetingT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="meetingListUL">
		{{#each data}}
		<li onclick="goMeetingDetail('{{cafeID}}','{{meetingNo}}')">
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{curNo}}/{{maxNo}}</div>
			<div id="cafeName">{{cafeName}}</div>
			<div id="location">{{address}}</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">정모가 존재하지 않습니다.</div>
	{{/if}}			
</script>

<jsp:include page="../common/common.jsp" flush="true"></jsp:include>

</head>
<body style="background:white;">
	
	<div id="wrapper">
	
		<div class="titleDiv">
			<div class="title">정모 리스트</div>
		</div>
		
		<ul id="publicMeetingTab" class="tab2 margin10">
			<li onclick="publicMeetingTabSelected(0);"class="selected">진행중인 정모</li>
			<li onclick="publicMeetingTabSelected(1);">지난 정모</li>
		</ul>
		
		<div id="publicMeetingList">
		
			<div class="loading" style="display:none;">목록을 읽어오는 중입니다.</div>
			
			<div id="meetingListDiv" style="display:none;" class="margin10">
				
			</div>
			
		
		</div>
	
		<div id="pagingInfo" style="text-align:center;margin-top:20px;font-weight:bold;">
		</div>
	
	</div>
	
</body>
</html>