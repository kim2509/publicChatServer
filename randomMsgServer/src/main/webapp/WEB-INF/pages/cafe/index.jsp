<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	List<HashMap> myCafeList = (List<HashMap>) request.getAttribute("myCafeList");
	List<HashMap> favoriteCafeMeetingList = (List<HashMap>) request.getAttribute("favoriteCafeMeetingList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common_v2.css?v=2" />


<style type="text/css">

span{ padding:5px; }

.destination {
    margin: 10px;
    border-radius: 10px;
    border: 1px solid #5f98f1;
    background: white;
    line-height: 40px;
    color: #5f98f1;
    text-align: center;
}

ul {
	margin:0;
	padding:0;
	text-align:center;
	display:block;
	overflow:hidden;
	list-style:none;
}

.cafeItem {
	float: left;
    height: 135px;
    width: 32%;
    text-align:center;
}

li img{
	border-radius: 10px;
}

.slide_lst{
	margin-top:10px;
}

.slide_lst2{
	
	
}

.slide_lst2 li {
	position:relative;
	clear:both;
	height:60px;
	padding-top:10px;
	padding-bottom:5px;
	border-bottom: 1px solid gray;
}

.desc{
	margin-top:5px;
	text-align:center;
	overflow:hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    line-height: 1.4;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    padding-left:10px;
    padding-right:10px;
}

.date{
	border:1px solid gray;
	border-radius: 5px;
	padding-top:5px;
	padding-left:5px;
	padding-right:5px;
	font-size:12px;
	font-weight:bold;
	float:left;
}

.postTitle{
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
    text-overflow: ellipsis;
	text-align:left;
	margin-left:70px;
	font-size:12px;
}

.cafeName{
	position:absolute;
	margin-left:70px;
	font-size:12px;
	font-weight:bold;
	bottom:10px;
}

.regionName{
	position:absolute;
	font-size:12px;
	font-weight:bold;
	bottom:10px;
	right:10px
}

.sectionTitle{
	padding-left:10px;
}

.btn1{
	margin-top:3px;
}

</style>

<script language="javascript">
		
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready( function () {
		
	});

	function goSearchByName()
	{
		var titleUrlEncoded = encodeURIComponent('카페 검색');
		var url = '<%= Constants.getServerURL() %>/cafe/searchByName.do';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href="/nearhere/cafe/searchByName.do";
	}
	
	function goSearchByRegion()
	{
		var titleUrlEncoded = encodeURIComponent('카페 검색');
		var url = '<%= Constants.getServerURL() %>/cafe/searchByRegion.do';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href="/nearhere/cafe/searchByRegion.do";
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
			document.location.href="/nearhere/cafe/moreFavoriteMeeting.do";;
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
			<div style="text-align:center;width:100%;">
				<!-- input type="text" hint="이름으로 검색" style="width:95%;height:25px;color:gray;padding:2px;" value="이름으로 검색" readonly onclick="alert('click');"/-->
				<input type="button" value="이름으로 검색" style="width:43%;padding:7px;" onclick="goSearchByName();"/>
				<input type="button" value="지역으로 검색" style="width:43%;padding:7px;" onclick="goSearchByRegion();"/>
			</div>
					

		</div>	
		
		<div id="section">

			<div style="float:right;margin-right:10px;"><input type="button" value="카페 만들기" class="btn1" onclick="goNewCafe();" /></div>
			<div style="padding: 5px;font-weight:bold;">이근처 사람들과 모여모여~</div>

		</div>
		
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

				<li class="cafeItem" onclick="goCafeHome('중고나라', '<%= cafeID %>');">
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
		
<% if ( favoriteCafeMeetingList != null && favoriteCafeMeetingList.size() > 0 ) { %>		
		<div id="section">

			<div style="float:right;margin-right:5px;font-weight:bold;" onclick="goMoreFavoriteMeeting();">더 보기</div>
			<div class="sectionTitle" style="margin-bottom:0px;">관심지역 정모</div>

			<ul class="slide_lst2">
				<% 
					for ( int i = 0; i < favoriteCafeMeetingList.size(); i++ ) {
						
						String cafeID = favoriteCafeMeetingList.get(i).get("cafeID").toString();
						String cafeName = favoriteCafeMeetingList.get(i).get("cafeName").toString();
						String meetingNo = favoriteCafeMeetingList.get(i).get("meetingNo").toString();
						String title = favoriteCafeMeetingList.get(i).get("title").toString();
						String dateString = favoriteCafeMeetingList.get(i).get("meetingDate").toString();
						Date meetingDate = Util.getDateFromString(dateString, "yyyy-MM-dd HH:mm:ss");
						String regionName = favoriteCafeMeetingList.get(i).get("regionName").toString();
				%>
				<li onclick="goMeetingDetail('<%= cafeID %>', '<%= meetingNo %>');">
					<div class='date'>
						<%= Util.getDateDay( meetingDate ) %>요일<br/>
						<%= Util.getDate(meetingDate ) %><br/>
						<%= Util.getDateStringFromDate(meetingDate, "HH:mm") %>
					</div>
					<div class="postTitle">
						<%= title %>
					</div>
					<div class='cafeName'>
						<%= cafeName %>
					</div>
					<div class='regionName'>
						<%= regionName %>
					</div>
				</li>
				<% } %>
			</ul>
			
		</div>
<% } %>
			
	</div>

	
	
</body>
</html>