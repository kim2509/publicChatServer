<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>
<%@ page import="java.util.*"%>

<%
	HashMap locationInfo = (HashMap) request.getAttribute("location");
	String locationID = locationInfo.get("locationID").toString();
	String userID = locationInfo.get("userID").toString();
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
	top: 40px;
	left: 40px;
	z-index: 99;
}
</style>

<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>

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

			var icon = {
				url : "http://www.hereby.co.kr/image/user27.png", // url
				scaledSize : new google.maps.Size(50, 50), // scaled size
				origin : new google.maps.Point(0, 0), // origin
				anchor : new google.maps.Point(20, 20)
			// anchor
			};

			startTracking();
		}

		jQuery(document).ready(function() {
						$("head")
								.append(
										"<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyAQdo6qBTtVBFSdHJcWn330-rCpJzgAHVU&signed_in=true&callback=initMap'>");
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

						console.log(JSON.stringify(resultData));

						if (marker == null )
						{
							marker = new google.maps.Marker();
							map.setCenter(new google.maps.LatLng(resultData.latitude,
									resultData.longitude));
							marker.setMap( map );
						}

						var myLatLng = new google.maps.LatLng(resultData.latitude,
								resultData.longitude)
					
						marker.setPosition( myLatLng );

						setTimeout( startTracking, 5000 );
					}
				}
			});
		}
</script>

</head>
<body>
	<div id="map"></div>

	<div id="over_map">
		<img src='http://www.hereby.co.kr/image/user27.png'
			style="width: 60px; height: 60px;" />
	</div>
</body>
</html>