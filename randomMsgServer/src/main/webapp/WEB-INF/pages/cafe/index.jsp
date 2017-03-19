<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	List<HashMap> myCafeList = null;
	if ( request.getAttribute("myCafeList") != null )
		myCafeList = (List<HashMap>) request.getAttribute("myCafeList");
	
	List<HashMap> favoriteCafeMeetingList = null;
	if ( request.getAttribute("favoriteCafeMeetingList") != null )
		favoriteCafeMeetingList = (List<HashMap>) request.getAttribute("favoriteCafeMeetingList");
	
	String favoriteCafeMeetingListJSON = "";
	if ( request.getAttribute("favoriteCafeMeetingsJSON") != null )
		favoriteCafeMeetingListJSON = request.getAttribute("favoriteCafeMeetingsJSON").toString();
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

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/common_v2.css?v=2" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_index.css?v=3" />

<script id="meetingT" type="text/x-handlebars-template">
	<ul id="meetingList">
		{{#each this}}
		<li onclick="goMeetingDetail('{{cafeID}}','{{meetingNo}}')">
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{curNo}}/{{maxNo}}</div>
			<div id="cafeName">{{cafeName}}</div>
			<div id="location">{{address}}</div>
		</li>
		{{/each}}
	</ul>
</script>
<script language="javascript">
		
	var isApp = '<%= isApp %>';
	var tmp = '<%= favoriteCafeMeetingListJSON %>';
	var favoriteCafeMeetingList = null ;
	
	if ( tmp != null && tmp != '' )
	{
		favoriteCafeMeetingList = JSON.parse( tmp );	
	}
	
	jQuery(document).ready( function () {
		
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );
		
		if ( favoriteCafeMeetingList != null && favoriteCafeMeetingList != '')
		{
			var source = $('#meetingT').html();
			var template = Handlebars.compile(source);
			var html = template(favoriteCafeMeetingList);
			//$('#meetingList').html(html);
			$('.favoriteMeetingClass').show();	
		}
	});

	function goSearchCafe()
	{
		var titleUrlEncoded = encodeURIComponent('카페 검색');
		var url = '<%= Constants.getServerURL() %>/cafe/searchCafe.do';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href= url;
	}
	
	function goMyCafeList()
	{
		var titleUrlEncoded = encodeURIComponent('내 가입 카페');
		var url = '<%= Constants.getServerURL() %>/cafe/myCafeList.do?isApp=' + isApp;
		url = encodeURIComponent( url );
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href="/nearhere/cafe/myCafeList.do?isApp=" + isApp;
	}
	
	function goMoreFavoriteMeeting()
	{
		var titleUrlEncoded = encodeURIComponent('관심지역 정모');
		var url = '<%= Constants.getServerURL() %>/cafe/moreFavoriteMeeting.do?userID=<%= userID %>';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function goNewCafe()
	{
		var url = '<%= Constants.getServerURL() %>/cafe/newCafe.do?isApp=<%= isApp %>&userID=<%= userID %>';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + url + '';
		else
			document.location.href="/nearhere/cafe/newCafe.do";
	}
	
	function goCafeHome( title, cafeID )
	{
		var url = '<%= Constants.getServerURL() %>/cafe/' + cafeID +'?isApp=<%= isApp %>&userID=<%= userID %>';
		url = encodeURIComponent( url );

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + url + '';
		else
			document.location.href="/nearhere/cafe/" + cafeID;
	}
	
	function goMeetingDetail( cafeID, meetingNo )
	{
		var url = '<%= Constants.getServerURL() + "/cafe/meetingDetail.do" %>?cafeID=' +
				cafeID + '&meetingNo=' + meetingNo;
	
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
</script>

</head>
<body>

	<div id="wrapper" style="padding-bottom:10px;">
		
		<div id="section">

			<div class="sectionTitle">카페 검색</div>
			
			<div id="searchCafeDiv" onclick="goSearchCafe();">카페 검색</div>

			<div style="float:right;"><input type="button" value="카페 만들기" class="btn1" onclick="goNewCafe();" /></div>
			<div style="padding: 5px;font-weight:bold;margin-right:20px;width:70%">주위의 사람들과 취미를 공유해 보세요~</div>

		</div>
		
		<!-- 카페 리스트 -->
		<jsp:include page="cafeList.jsp" flush="true"></jsp:include>
		<!-- 카페 리스트 -->
		
		<!-- 정모 리스트 -->
		<jsp:include page="publicMeetingList.jsp" flush="true"></jsp:include>
		<!-- 정모 리스트 -->
		
<% if ( myCafeList != null && myCafeList.size() > 0 ) { %>
		<div id="section">

			<div style="float:right;margin-right:5px;font-weight:bold;" onclick="goMyCafeList();">더 보기</div>
			<div class="sectionTitle">내 가입 카페</div>


			<ul class="slide_lst">
			
				<% for ( int i = 0; i < myCafeList.size(); i++ ) {
					String cafeName = myCafeList.get(i).get("cafeName").toString();
					String cafeID = myCafeList.get(i).get("cafeID").toString();
					String imageURL = myCafeList.get(i).get("url1").toString() + myCafeList.get(i).get("url2").toString();
				%>

				<li class="cafeItem" onclick="goCafeHome('<%= cafeName %>', '<%= cafeID %>');">
					<div class="thumbnail">
						<img src='<%= imageURL %>' width="80" height="80"/>
					</div>
					<div class='desc'>
						<%= cafeName %>
					</div>
				</li>

				<% } %>
				
			</ul>
		</div>
<% } %>		
		
		<div id="section" class="favoriteMeetingClass" style="display:none">

			<div style="float:right;margin-right:5px;font-weight:bold;" onclick="goMoreFavoriteMeeting();">더 보기</div>
			<div class="sectionTitle" style="margin-bottom:0px;">관심지역 정모</div>

			<div id="meetingListDiv">
			
			<ul class="slide_lst2" id="meetingList">
				
			</ul>
			
			</div>
			
		</div>
			
	</div>

	
	
</body>
</html>