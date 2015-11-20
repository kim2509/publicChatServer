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

#over_map {
	position: absolute;
	top: 100px;
	left: 40px;
	z-index: 99;
}
</style>

<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>

<script language="javascript">
	var map;

	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.4776984,
				lng : 126.9657012
			},
			zoom : 14
		});

		$.ajax({
			url : "allUsersWithLocationAjax.do",
			type : "post",
			contentType : "application/json",
			data : null,
			success : function(responseData) {

				if (responseData.resCode == '0000') {
					for (var i = 0; i < responseData.data.length; i++) {
						var data = responseData.data[i];

						var location = {
							lat : parseFloat(data.lat),
							lng : parseFloat(data.lng)
						};

						var marker = new google.maps.Marker({
							position : location,
							map : map,
							title : 'Hello World!'
						});
					}
				}
			}
		});
	}

	jQuery(document)
			.ready(
					function() {

						$("head")
								.append(
										"<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyAQdo6qBTtVBFSdHJcWn330-rCpJzgAHVU&signed_in=true&callback=initMap'>");

					});
</script>

</head>
<body>
	<div id="map"></div>
</body>
</html>