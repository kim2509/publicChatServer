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
<title>카페 회원 리스트</title>

<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>
		
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=2" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_member.css?v=1" />

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
			Handlebars.registerHelper('displayUserProfileImage', displayUserProfileImage );
			Handlebars.registerHelper('displayDateFormat', displayDateFormat );
			
			// 카페 회원 불러오기
			getCafeMemberList();

		}
		catch( ex )
		{
			alert( ex.message );
		}
	});

	function getCafeMemberList()
	{
		var param = {"cafeID":"<%= cafeID %>", "startIndex" : startIndex, "PageSize" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeMembersForManageAjax.do', param , onMemberListResult );	
	}
	
	function onMemberListResult( result )
	{
		try
		{
			var source = $('#memberT').html();
			var template = Handlebars.compile(source);
			var html = template(result.data.memberList);
			$('#memberList').html(html);
			
			totalItemCount = result.data.TotalMembersCount;
			
			$('#headerInfo').html('회원 전체 ' + totalItemCount + '명');
			
			displayPagingInfo();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function displayUserProfileImage(profileImageURL)
	{
		if ( profileImageURL != null && profileImageURL.length > 0 )
			return new Handlebars.SafeString('<img src="<%= Constants.getThumbnailImageURL() %>/' + 
					profileImageURL + '" width=80 height=80 ' + 'onError="this.src=\'<%= Constants.IMAGE_PATH %>/no_image.png\';"' + '/>');
		else return new Handlebars.SafeString('<img src="<%= Constants.IMAGE_PATH %>/no_image.png" width=80 height=80/>');
	}
	
	function displayPagingInfo()
	{
		$('#pagingInfo').empty();
		
		if ( totalItemCount < 1 )
			return;
		else
			$('#pagingInfo').show();
		
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
		getCafeMemberList();
	}
	
</script>
<script id="memberT" type="text/x-handlebars-template">
	{{#if this}}	
	<ul>
		{{#each this}}
		<li onclick="openUserProfile('{{userID}}');">
			<div id="imgProfile">
				{{displayUserProfileImage profileImageURL}}
			</div>
			<div id="memberType">{{memberType}}</div>
			<div id="memberInfo">
				<div>{{userName}}</div>
			</div>
			<div id="memberJoinDate">
				<div>가입일 : {{displayDateFormat createdDate 'yyyy-MM-dd'}}</div>
			</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="emptyDiv">카페 회원이 존재하지 않습니다.</div>
	{{/if}}
</script>

<jsp:include page="../common/common.jsp" flush="true"></jsp:include>

</head>
<body style="background:white;">
	
	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">카페 회원 리스트</div>
		</div>
		
		<div id="headerInfo">
			회원 전체 50명
		</div>
		
		<div id="container">
		
			<div id="memberList">
			
			</div>
			
			<div id="pagingInfo" style="text-align:center;font-weight:bold;">
				
			</div>
		</div>
					
	</div>
	
</body>
</html>