<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
		
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=1" />

<script language="javascript">

	function publicMeetingTabSelected( tabIndex )
	{
		$('#myCafeMeetingList').hide();
		$('#favRegionCafeMeetingList').hide();
		$('#popularCafeMeetingList').hide();
		
		if ( tabIndex == 0 )
		{
			$('#myCafeMeetingList').show();
		}
		else if ( tabIndex == 1 )
		{
			$('#favRegionCafeMeetingList').show();
		}
		else if ( tabIndex == 2 )
		{
			$('#popularCafeMeetingList').show();
		}
	}

</script>

</head>
<body>
	
	<div id="wrapper">
	
		<div class="titleDiv">
			<div class="title">정모 리스트</div>
		</div>
		
		<ul class="tab3 margin10">
			<li onclick="publicMeetingTabSelected(0);">내 카페 정모</li>
			<li onclick="publicMeetingTabSelected(1);">관심지역 정모</li>
			<li onclick="publicMeetingTabSelected(2);">인기 정모</li>
		</ul>
		
		<div >
		
			<div id="myCafeMeetingList" style="display:none;" class="margin10">
				<ul class="meetingListUL">
					<li onclick="goMeetingDetail('junggonara','2')">
						<div id="title">영화나 한편 볼까요?</div>
						<div id="meetingDate">05-18 00:00</div>
						<div id="memberCount">참석인원 : 3/10</div>
						<div id="cafeName">중고나라2</div>
						<div id="location">서울시 강남구 역삼1동 738-5</div>
					</li>
					<li onclick="goMeetingDetail('junggonara','2')">
						<div id="title">영화나 한편 볼까요?</div>
						<div id="meetingDate">05-18 00:00</div>
						<div id="memberCount">참석인원 : 3/10</div>
						<div id="cafeName">중고나라2</div>
						<div id="location">서울시 강남구 역삼1동 738-5</div>
					</li>
					<li onclick="goMeetingDetail('junggonara','2')">
						<div id="title">영화나 한편 볼까요?</div>
						<div id="meetingDate">05-18 00:00</div>
						<div id="memberCount">참석인원 : 3/10</div>
						<div id="cafeName">중고나라2</div>
						<div id="location">서울시 강남구 역삼1동 738-5</div>
					</li>
				</ul>
			</div>
			
			<div id="favRegionCafeMeetingList" style="display:none;">

			<!-- 관심지역 정모 리스트 -->
			<jsp:include page="favoriteRegionMeetingList.jsp" flush="true"></jsp:include>
			<!-- 관심지역 정모 리스트 -->				

			</div>
			
			<div id="popularCafeMeetingList" style="display:none;" class="margin10">
				<ul class="meetingListUL">
					<li onclick="goMeetingDetail('junggonara','2')">
						<div id="title">영화나 한편 볼까요?</div>
						<div id="meetingDate">05-18 00:00</div>
						<div id="memberCount">참석인원 : 3/10</div>
						<div id="cafeName">중고나라2</div>
						<div id="location">서울시 강남구 역삼1동 738-5</div>
					</li>
				</ul>
			</div>
		
		</div>
	
	</div>
	
</body>
</html>