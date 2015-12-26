<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

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

#over_map { position: absolute; top: 100px; left: 40px; z-index: 99;}
</style>

<script type="text/javascript"
	src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>

<script language="javascript">
    
    	var map;
    	var flightPlanCoordinates;
    	
    	function initMap() {
    	  map = new google.maps.Map(document.getElementById('map'), {
    	    center: {lat: 37.4776984, lng: 126.9657012},
    	    zoom: 14
    	  });
    	  
    	  var myLatLng = {lat:37.474735, lng:126.962440};
	    	
//    	  var icon = 'http://www.hereby.co.kr/image/user27.png';
    	  
    	  var icon = {
    			    url: "http://www.hereby.co.kr/image/user27.png", // url
    			    scaledSize: new google.maps.Size(50, 50), // scaled size
    			    origin: new google.maps.Point(0,0), // origin
    			    anchor: new google.maps.Point(20, 20) // anchor
    			};
    	  
	    	var marker = new google.maps.Marker({
	    	    position: myLatLng,
	    	    map: map,
	    	    title: 'Hello World!'//,
//	    	    icon: icon
	    	  });
	    	
	    	var flightPath = new google.maps.Polyline({
                path: flightPlanCoordinates,
                geodesic: true,
                strokeColor: '#FF0000',
                strokeOpacity: 1.0,
                strokeWeight: 2
              });
	    	
	    	flightPath.setMap(map);
    	}
    
	    jQuery(document).ready(function(){
   	 		
	    	flightPlanCoordinates = [{lat: 37.500820, lng: 127.036512},
	    	                             {lat: 37.491014, lng: 127.007072},
	    	                             {lat: 37.479572, lng: 126.993596},
	    	                             {lat: 37.475961, lng: 126.977803},
	    	                             {lat:37.474735, lng:126.962440}
			];
	    	
	    	  
	    	$("head").append("<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyAQdo6qBTtVBFSdHJcWn330-rCpJzgAHVU&signed_in=true&callback=initMap'>");
   	 	});
    </script>

</head>
<body>
	<div id="map"></div>
	
	<div id="over_map">
		<img src='http://www.hereby.co.kr/image/user27.png' style="width:80px;height:80px;"/>
	</div>
</body>
</html>