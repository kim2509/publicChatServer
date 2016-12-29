<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	HashMap meetingInfo = (HashMap) request.getAttribute("meetingInfo");
	List<HashMap> meetingMembers = (List<HashMap>) request.getAttribute("meetingMembers");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>정모 상세</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/meetingDetail.css" />

</head>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>

<script language="javascript">
	
	jQuery(document).ready(function(){
		console.log( 'ready' );	
		
		initiateMap();
	});
	
	function initiateMap()
	{
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	}
	
</script>



<body>

	<div id="wrapper">
	
		<div id="Navi">
			<div id="btnDelete">삭제하기</div>
			<div id="btnModify">수정하기</div>
			<div id="naviTitle">&lt; 정모 상세</div>
		</div>

		<div id="HeaderDiv">
			<div id="title"><%= meetingInfo.get("title") %></div>
			
			<div id="info">
				<span>정모일시 : <%= meetingInfo.get("meetingDate") %></span><br/>
			</div>
		</div>
		
		<table id="locationInfo">
			<tr><th>위치</th><td>서울시 송파구 방이동 방이 재래시장</td></tr>
		</table>
		
		<div id="map"></div>
		
		<div id="meetingDesc">
			늦으면 곤란하고 주차 안되고 하니 빨랑 오세요~
			회비는 2만원입니다.
		</div>
		
		<p id="personInfo">참석인원 : <%= meetingInfo.get("curNo") %> / <%= meetingInfo.get("maxNo") %></p>
		
		<div id="membersDiv">
			<ul>
				<% for ( int i = 0; i < meetingMembers.size(); i++ ) {
					HashMap meetingMember = meetingMembers.get(i);
				%>
					<li>
					<img src="<%= Constants.getThumbnailImageSSLURL() %>/<%= meetingMember.get("profileImageURL") %>" 
							width=60 height=60/>
						<div id="userName"><%= meetingMember.get("userName") %></div>
						<div id="memberType"><%= meetingMember.get("memberType") %></div>
					</li>
				<% } %>
			</ul>
		</div>
		
		<div id="bottom">&nbsp;</div>
		<div id="joinDiv">
			참여하기
		</div>
	</div>
	
</body>
</html>