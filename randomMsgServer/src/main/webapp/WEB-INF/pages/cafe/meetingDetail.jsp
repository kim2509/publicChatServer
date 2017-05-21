<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String cafeID = request.getParameter("cafeID");
	String loginUserID = "";
	
	HashMap meetingInfo = (HashMap) request.getAttribute("meetingInfo");
	List<HashMap> meetingMembers = (List<HashMap>) request.getAttribute("meetingMembers");
	boolean joinYN = false;
	
	for ( int i = 0; i < meetingMembers.size(); i++ ) {
		HashMap meetingMember = meetingMembers.get(i);
		if ( loginUserID != null && loginUserID.equals( meetingMember.get("userID").toString() ) )
			joinYN = true;
	}
	
	String locationName = Util.getStringFromHash(meetingInfo, "locationName");
	String locationAddress = Util.getStringFromHash(meetingInfo, "locationAddress");
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

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/meetingDetail.css?v=6" />

</head>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var meetingNo = '<%= meetingInfo.get("meetingNo") %>';
	
	jQuery(document).ready(function(){
		initiateMap();
	});
	
	var map = null;
	var latitude = '<%= meetingInfo.get("latitude") %>';
	var longitude = '<%= meetingInfo.get("longitude") %>';
	var address = '<%= meetingInfo.get("address") %>';
	var infoWindow = null;
	
	function initiateMap()
	{
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

		map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 지도에 클릭 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    if ( infoWindow != null ){
		    	infoWindow.close();
		    }
		    
		});
		
		if ( latitude.length > 0 && longitude.length > 0 )
		{
			var position = new daum.maps.LatLng( latitude, longitude );
			
			setCenter( position );
			
			// 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        position: position,
		        clickable:true
		    });
			
		    daum.maps.event.addListener(marker, 'click', showInfoWindow(marker));
		    
		    infoWindow = new daum.maps.InfoWindow({
			    position: position,
			    content: '<div style="padding:5px;font-size:17px;width:100%">' + address + '</div>'
			});
		    
		 	// 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		 	
		    infoWindow.open(map, marker);
		}
	}
	
	function showInfoWindow( marker )
	{
		return function()
		{
			infoWindow.open(map, marker);	
		};
	}
	
	function setCenter( position ) {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(position);
	}
	
	function join()
	{
		if ( confirm('참석하시겠습니까?') )
		{
			var param = {"meetingNo":meetingNo , "joinYN":"Y" }
			ajaxRequest('POST', '/nearhere/cafe/joinCafeMeeting.do', param , joinResult );
		}
	}
	
	function cancelJoin()
	{
		if ( confirm('참석을 취소하시겠습니까?') )
		{
			var param = {"meetingNo":meetingNo , "joinYN":"N" }
			ajaxRequest('POST', '/nearhere/cafe/joinCafeMeeting.do', param , joinResult );
		}
	}
	
	function joinResult()
	{
		document.location.reload();
	}
	
	function deleteMeetingClick()
	{
		if ( confirm('정모를 삭제하시겠습니까?') )
		{
			var param = { "cafeID" : cafeID, "meetingNo": meetingNo };
			
			ajaxRequest('POST', '/nearhere/cafe/deleteCafePublicMeetingAjax.do', param , onDeleteMeetingResult );
		}
	}
	
	function onDeleteMeetingResult( result )
	{
		if ( result == null )
		{
			alert('처리결과가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
			return;
		}
		else if ( result != null && result.resCode != '0000')
		{
			alert( result.resMsg );
		}
		else
		{
			finish();
		}
	}
	
	function finish()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			return Android.finishActivity('refresh');
		}
		
		return '';
	}
	
	function goModifyPublicMeeting()
	{
		var url = '<%= Constants.getServerURL() + "/cafe/makePublicMeeting.do" %>?cafeID=' + cafeID + '&meetingNo=' + meetingNo;

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
</script>



<body>

	<div id="wrapper">
	
		<div id="Navi">
			<div id="btnDelete" onclick="deleteMeetingClick();">삭제하기</div>
			<div id="btnModify" onclick="goModifyPublicMeeting();">수정하기</div>
			<div id="naviTitle">&lt; 정모 상세</div>
		</div>

		<div id="HeaderDiv">
			<div id="title"><%= meetingInfo.get("title") %></div>
			
			<div id="info">
				<span>정모일시 : <%= meetingInfo.get("meetingDate") %></span><br/>
			</div>
		</div>
		
		<table id="locationInfo">
			<tr><th>위치</th>
			<td>
			<%= Util.isEmptyString(locationName) ? "" : "(" + locationName + ")" %>
			<%= locationAddress %>
			</td></tr>
		</table>
		
		<div id="map"></div>
		
		<div id="meetingDesc">
			<%= Util.getStringFromHash(meetingInfo, "meetingDesc") %>
		</div>
		
		<div>
			<% if ( joinYN ) { %>
			<div id="joinInfo">참석중입니다.</div>
			<% } %>
			
			<p id="personInfo">참석인원 : <%= meetingInfo.get("curNo") %> / <%= meetingInfo.get("maxNo") %></p>
		</div>
		<div id="membersDiv">
			<ul>
				<% for ( int i = 0; i < meetingMembers.size(); i++ ) {
					HashMap meetingMember = meetingMembers.get(i);
				%>
					<li>
					<img src="<%= Constants.getThumbnailImageSSLURL() %>/<%= meetingMember.get("profileImageURL") %>" 
							width=60 height=60/>
						
						<% if ( joinYN && loginUserID.equals( meetingMember.get("userID").toString() )) { %>
						<div id="userName2"><%= meetingMember.get("userName") %></div>
						<% } else { %>
						<div id="userName"><%= meetingMember.get("userName") %></div>
						<% } %>
						<div id="memberType"><%= meetingMember.get("memberType") %></div>
					</li>
				<% } %>
			</ul>
		</div>
		
		<div id="bottom">&nbsp;</div>
		
		<% if ( !joinYN ) { %>
		<div class="joinDiv" onclick="join();">
			참석하기
		</div>
		<% } else { %>
		<div class="joinDiv2" onclick="cancelJoin();">
			참석 취소하기
		</div>
		<% } %>
	</div>
	
</body>
</html>