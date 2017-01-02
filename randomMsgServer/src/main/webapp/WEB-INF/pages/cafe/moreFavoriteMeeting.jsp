<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	List<HashMap> myFavRegionList = (List<HashMap>) request.getAttribute("myFavRegionList");
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

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/moreFavoriteMeeting.css?v=22" />

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );	
	});
	
	function initiateMap()
	{
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var marker = new daum.maps.Marker({
		    map: map,
		    position: new daum.maps.LatLng(33.450701, 126.570667),
		    title:'마커 엘리먼트의 타이틀 속성 값',
		    clickable:true
		});
		
		daum.maps.event.addListener(marker, 'click', function() {
		    alert('marker click!');
		});
		
		var infowindow = new daum.maps.InfoWindow({
		    position: new daum.maps.LatLng(33.450701, 126.570667),
		    content: '<div style="padding:5px;font-size:13px;">오늘 저녁 삼겹살에 소주~<br/>1월 1일 20:30<br/><a href="">상세보기</a></div>'
		});
		
		infowindow.open(map, marker);
	}
	
	var startIndex = 0;
	function changeRegion( element, regionNo, level )
	{
		$('.favoriteRegion li').removeClass('selected');		
		$(element).addClass('selected');
		
		var param = {"level":level, "regionNo": regionNo, "startIndex":startIndex, "showCount" : 10 };
		ajaxRequest('POST', '/nearhere/cafe/getCafeMeetingsByRegionAjax.do', param , onMeetingListResult );
	}
	
	function goFavoriteRegionPage()
	{
		var titleUrlEncoded = encodeURIComponent('관심지역설정');
		var url = '<%= Constants.getServerURL() %>/region/favoriteRegion.do?userID=<%= userID %>&isApp=<%= isApp %>';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
		else
			document.location.href="/nearhere/cafe/favoriteRegion.do?userID=<%= userID %>&isApp=<%= isApp %>";
	}
	
	function onMeetingListResult( result )
	{
		try
		{
			var source = $('#meetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);
			$('#meetingList').html(html);
			
			if ( result.data != null && result.data.length > 0 )
			{
				$('#meetingListDiv').show();
				$('#pagingInfo').show();
			}
			else
			{
				$('#meetingListDiv').hide();
				$('#pagingInfo').hide();
			}
					
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	var bMapInitialized = false;
	function toggleResultView()
	{
		if ( $('#map').is(':visible') )
		{
			$('#meetingList').show();
			$('#map').hide();
		}
		else
		{
			$('#meetingList').hide();
			$('#map').show();
			
			if ( !bMapInitialized )
			{
				initiateMap();
				bMapInitialized = true;
			}
		}
	}
	
</script>

</head>
<body>
	<script id="meetingT" type="text/x-handlebars-template">
	<ul id="meetingList">
		{{#each data}}
		<li>
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{curNo}}/{{maxNo}}</div>
			<div id="cafeName">{{cafeName}}</div>
			<div id="location">{{address}}</div>
		</li>
		{{/each}}
	</ul>
	</script>
	<div id="wrapper">
		
		<div class="titleDiv">
			<div class="title">관심지역 정모</div>
		</div>
		
		<div id="favoriteRegionDiv">
			<div id="linkDiv" onclick="goFavoriteRegionPage();">설정</div>
			<div id="subTitle">관심지역</div>
			<% if ( myFavRegionList != null && myFavRegionList.size() > 0 ) { %>
			<ul class="favoriteRegion">
			<%
				for ( int i = 0; i < myFavRegionList.size(); i++ )
				{
					String level = myFavRegionList.get(i).get("level").toString();
					String regionNo = myFavRegionList.get(i).get("regionNo").toString();
					String regionName = myFavRegionList.get(i).get("regionName").toString();
					
					if ( i == 0 )
						out.println("<li class='selected' onclick=\"changeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
							 regionName + "</li>");
					else
						out.println("<li onclick=\"changeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
								regionName + "</li>");
				}
			%>	
			</ul>
			<% } else { %>
			<p>관심지역이 설정되어 있지 않습니다.</p>
			<% } %>
		</div>
		
		<div id="meetingListDiv">
			<div id="optionMap" class="option" onclick="toggleResultView();">지도로 보기</div>
			<div id="optionList" class="option" onclick="toggleResultView();">리스트로 보기</div>
			<div id="subTitle">정모 리스트</div>
			<ul id="meetingList">
				
			</ul>
			<div id="map">
			</div>
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