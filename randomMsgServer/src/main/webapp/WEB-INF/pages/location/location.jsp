<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>
<%@ page import="java.util.*"%>

<%
	HashMap locationInfo = (HashMap) request.getAttribute("location");
	String locationID = locationInfo.get("locationID").toString();
	String userID = locationInfo.get("userID").toString();
	String userName = locationInfo.get("userName").toString();
	String profileImageURL = locationInfo.get("profileImageURL").toString();
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	width: 100%;
	height: 100%;
	align: center
}

#over_map {
	position: absolute;
	top: 5px;
	left:5px;
	right:5px;
	z-index: 99;
	background: white;
    padding: 10px;
    border-radius: 10px;
    border: 3px solid #73AD21;
}

#over_map_bottom{
	position: absolute;
	bottom:5px;
	left:10px;
	right:10px;
}

#image{
	border-radius: 10px;
}

#imageDiv
{
	float:left;
}

#userInfo{
	margin-left:70px;
	padding-left:10px;
}

#userName{
	
}

#addressDiv {
	margin-top:5px;
	font-size:13px;
}

#addressTitle{
	font-size:11px;
	color:#4c643d
}

#address {
	margin-left:5px;
	color:#661717
}

#updatedTimeDiv{
	font-size:12px;
}

#updatedTimeTitle{
	font-size:11px;
	color:#4c643d
}

#updatedTime{
	margin-left:5px;
	color:#661717
}
</style>

<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/common.js"></script>

<script language="javascript">
    
    	var map;
    	var flightPlanCoordinates;
    	var locationID = '<%=locationID%>';
    	var userID = '<%=userID%>';
		var marker = null;

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				disableDefaultUI : true
			});

			startTracking();
		}

		jQuery(document).ready(function() {
			$("head").append("<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyAQdo6qBTtVBFSdHJcWn330-rCpJzgAHVU&signed_in=true&callback=initMap'>");
		});

		function startTracking() {
			var data = {
				"locationID" : locationID,
				"userID" : userID
			};

			$.ajax({
				url : "/nearhere/location/getLocationData.do",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(responseData) {	

					if (responseData.resCode == '0000') {
						var resultData = responseData.data;

						if (marker == null )
						{
							marker = new google.maps.Marker();
							map.setCenter(new google.maps.LatLng(resultData.latitude,
									resultData.longitude));
							marker.setMap( map );
							
							var infowindow = new google.maps.InfoWindow({
							    content: '이동중'
							  });
							infowindow.open(map, marker);
							
							marker.addListener('click', function() {
								infowindow.open(map, marker);
							  });
						}

						var myLatLng = new google.maps.LatLng(resultData.latitude,
								resultData.longitude)
					
						marker.setPosition( myLatLng );

						$('#address').html( resultData.address );
						$('#updatedTime').html( new Date( resultData.createdDate ).format("yyyy-MM-dd HH:mm:ss") )
						
						setTimeout( startTracking, 5000 );
					}
				}
			});
		}
</script>

<title>이근처 합승 위치공유</title>
</head>
<body>
	<div id="map"></div>

	<div id="over_map">
		<div id="imageDiv">
			<img id="image" src='http://www.hereby.co.kr/thumbnail/<%= profileImageURL %>'
			style="width: 70px; height: 70px;" />
		</div>
		<div id="userInfo">
			<div id="userName"><span><%= userName %></span>님이 이동중입니다.</div>
			<div id="addressDiv"><span id="addressTitle">현재위치</span><span id="address"></span></div>
			<div id="updatedTimeDiv"><span id="updatedTimeTitle">업데이트 시간</span><span id="updatedTime"></span></div>
		</div>
	</div>
	
	<div id="over_map_bottom">
		<a href="http://market.android.com/details?id=com.tessoft.nearhere">
			<img id="image" src='<%= Constants.IMAGE_PATH %>/nearhere_promotion.png' height="90" style="width:100%;"/>
		</a>
	</div>
</body>
</html>