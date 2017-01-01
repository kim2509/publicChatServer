<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/moreFavoriteMeeting.css?v=16" />

</head>
<body>

	<div id="wrapper">
		
		<div class="titleDiv">
			<div class="title">관심지역 정모</div>
		</div>
		
		<div id="favoriteRegionDiv">
			<div id="linkDiv">편집</div>
			<div id="subTitle">관심지역</div>
			<ul class="favoriteRegion">
				<li>
					서울시 강남구 역삼동
				</li>
				<li>
					서울시 송파구 방이동
				</li>
				<li >
					포항시 남구 연일읍 택전리
				</li>
				<li>
					서울시 강남구 역삼동
				</li>
				<li>
					서울시 송파구 방이동
				</li>
				<li class="selected">
					포항시 남구 연일읍 택전리
				</li>
			</ul>
			
		</div>
		
		<div id="meetingListDiv">
			<div id="optionMap" class="option">지도로 보기</div>
			<div id="optionList" class="option">리스트로 보기</div>
			<div id="subTitle">정모 리스트</div>
			<ul>
				<li>
					<div id="title">이밤의 끝을잡고</div>
					<div id="meetingDate">12월 31일 20:30</div>
					<div id="memberCount">참석인원 : 7/20</div>
					<div id="cafeName">방이친목</div>
					<div id="location">서울시 송파구 방이동 152-12</div>
				</li>
				<li>
					<div id="title">이밤의 끝을잡고</div>
					<div id="meetingDate">12월 31일 20:30</div>
					<div id="memberCount">참석인원 : 7/20</div>
					<div id="cafeName">방이친목</div>
					<div id="location">서울시 송파구 방이동 152-12</div>
				</li>
				<li>
					<div id="title">이밤의 끝을잡고</div>
					<div id="meetingDate">12월 31일 20:30</div>
					<div id="memberCount">참석인원 : 7/20</div>
					<div id="cafeName">방이친목</div>
					<div id="location">서울시 송파구 방이동 152-12</div>
				</li>
				<li>
					<div id="title">이밤의 끝을잡고</div>
					<div id="meetingDate">12월 31일 20:30</div>
					<div id="memberCount">참석인원 : 7/20</div>
					<div id="cafeName">방이친목</div>
					<div id="location">서울시 송파구 방이동 152-12</div>
				</li>
				<li>
					<div id="title">이밤의 끝을잡고</div>
					<div id="meetingDate">12월 31일 20:30</div>
					<div id="memberCount">참석인원 : 7/20</div>
					<div id="cafeName">방이친목</div>
					<div id="location">서울시 송파구 방이동 152-12</div>
				</li>
				<li>
					<div id="title">이밤의 끝을잡고</div>
					<div id="meetingDate">12월 31일 20:30</div>
					<div id="memberCount">참석인원 : 7/20</div>
					<div id="cafeName">방이친목</div>
					<div id="location">서울시 송파구 방이동 152-12</div>
				</li>
			</ul>
		</div>
		
		<div id="pagingInfo" style="text-align:center;margin-top:10px;font-weight:bold;">
			<a href="javascript:void(0)" onclick="goPage(1);" style="padding:5px;" class="pageSelected">1</a>
			<a href="javascript:void(0)" onclick="goPage(2);" style="padding:5px;">2</a>
			<a href="javascript:void(0)" onclick="goPage(3);" style="padding:5px;">3</a>
			<a href="javascript:void(0)" onclick="goPage(4);" style="padding:5px;">4</a>
			<a href="javascript:void(0)" onclick="goPage(5);" style="padding:5px;">5</a>
			<a href="javascript:void(0)" onclick="goPage(6);" style="padding:5px;">&gt;</a>
			<a href="javascript:void(0)" onclick="goPage(165);" style="padding:5px;">&gt;&gt;</a>
		</div>
	</div>
	
</body>
</html>