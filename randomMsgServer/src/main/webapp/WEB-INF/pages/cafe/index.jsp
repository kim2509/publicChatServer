<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");	
	String loginUserType = Util.getString( request.getAttribute("loginUserType") );
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>이근처 카페</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/common_v2.css?v=2" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=1" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_index.css?v=4" />

<script language="javascript">
		
	var isApp = '<%= isApp %>';

	function goSearchCafe()
	{
		var titleUrlEncoded = encodeURIComponent('카페 검색');
		var url = '<%= Constants.getServerURL() %>/cafe/searchCafe.do';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href= url;
	}
	
	function goNewCafe()
	{
		var url = '<%= Constants.getServerURL() %>/cafe/newCafe.do?isApp=<%= isApp %>';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent( url );
		else
			document.location.href= url;
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
	
</script>
<script id="cafeT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="cafeListUL">
		{{#each data}}
		<li onclick="goCafeHome('{{cafeID}}');">
			<div>
				<div class="cafeImage">
				<img src="{{url1}}" width="60" height="60"
					onerror="this.onerror=null;this.src='<%= Constants.IMAGE_PATH + "/" + Constants.CAFE_DEAULT_ICON %>';">
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
<script id="publicMeetingT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="meetingListUL">
		{{#each data}}
		<li onclick="goMeetingDetail('{{cafeID}}','{{meetingNo}}')">
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{cntMembers}}/{{maxNo}}</div>
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
<body style="background:#eeeeee;">

	<div id="wrapper" style="padding:10px;">
		
		<div id="section">

			<div class="sectionTitle">카페 검색</div>
			
			<div id="searchCafeDiv" onclick="goSearchCafe();">카페 검색</div>

			<% if ( "normal".equals(loginUserType.toLowerCase())) { %>
			<div style="float:right;"><input type="button" value="카페 만들기" class="btn1" onclick="goNewCafe();" /></div>
			<div style="padding: 5px;font-weight:bold;margin-right:20px;width:70%">주위의 사람들과 취미를 공유해 보세요~</div>
			<% } %>
			
		</div>
		
		<!-- 카페 리스트 -->
		<jsp:include page="cafeList.jsp" flush="true"></jsp:include>
		<!-- 카페 리스트 -->
		
		<!-- 카페 글 리스트 -->
		<jsp:include page="cafeBoardPostList.jsp" flush="true"></jsp:include>
		<!-- 카페 글  리스트 -->
		
		<!-- 정모 리스트 -->
		<jsp:include page="publicMeetingList.jsp" flush="true"></jsp:include>
		<!-- 정모 리스트 -->
			
		<div id="favRegionStuff" style="background:white;padding-bottom:10px;border:1px solid black;border-radius:10px;">
		
			<!-- 관심지역 카페 리스트 -->
			<jsp:include page="favoriteRegionStuff.jsp" flush="true"></jsp:include>
			<!-- 관심지역 카페 리스트 -->
			
		</div>
		
	</div>

	
	
</body>
</html>