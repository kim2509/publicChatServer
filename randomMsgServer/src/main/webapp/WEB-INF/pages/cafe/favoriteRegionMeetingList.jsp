<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	List<HashMap> myFavRegionList = (List<HashMap>) request.getAttribute("myFavRegionList");
%>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/moreFavoriteMeeting.css?v=23" />

<script language="javascript">

	var isApp = '<%= isApp %>';
	var userID = '<%= userID %>';

	jQuery(document).ready(function(){
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );
		
		// 초기 데이터 로딩
		if ( $('#favoriteRegionDiv ul li').length > 0 )
		{
			// 홀수 개의 관심지역일 때 공백을 하나 추가함.
			if ( $('#favoriteRegionDiv ul li').length % 2 != 0 )
			{
				$('#favoriteRegionDiv ul').append('<li>&nbsp;</li>');
			}
			
			getMeetingList();
		}
	});
	
	function getMeetingList()
	{
		var level = $('#favoriteRegionDiv ul .selected').attr('level');
		var regionNo = $('#favoriteRegionDiv ul .selected').attr('regionNo');
		var param = {"level":level, "regionNo": regionNo, "startIndex":startIndex, "showCount" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeMeetingsByRegionAjax.do', param , onMeetingListResult );	
	}
	
	function changeRegion( element, regionNo, level )
	{
		pageNo = 1;
		startIndex = 0;
		
		$('.favoriteRegion li').removeClass('selected');		
		$(element).addClass('selected');
		
		var param = {"level":level, "regionNo": regionNo, "startIndex":startIndex, "showCount" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeMeetingsByRegionAjax.do', param , onMeetingListResult );
	}
	
	var meetingListViewMode = 'list';
	
	function onMeetingListResult( result )
	{
		try
		{
			var source = $('#meetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);
			$('#meetingList').html(html);
			
			setMapData(result);
			
			if ( meetingListViewMode == 'map' )
			{
				displayMapData();
			}
			
			totalItemCount = result.data2;
		
			if ( result.data != null && result.data.length > 0 )
			{
				if ($('#pagingInfo').length > 0 )
					$('#pagingInfo').show();
				
				if ( $('#favRegionCafeMeetingList').is(':visible') )
				{
					if ( meetingListViewMode == 'list' )
					{
						$('#optionMap').show();
						$('#map').hide();
						$('#meetingList').show();
					}
					else
					{
						$('#optionList').show();
						$('#map').show();
						$('#meetingList').hide();
					}
				}
					
			}
			else
			{
				if ($('#pagingInfo').length > 0 )
					$('#pagingInfo').hide();
				
				$('#optionMap').hide();
				$('#optionList').hide();
				
				$('#map').hide();
				$('#meetingList').show();
			}
			
			if ($('#pagingInfo').length > 0 )
				displayPagingInfo();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	var bMapInitialized = false;
	function toggleResultView()
	{
		if ( meetingListViewMode == 'map' )
		{
			$('#meetingList').show();
			$('#map').hide();
			$('#optionMap').show();
			$('#optionList').hide();
			
			meetingListViewMode = 'list';
		}
		else
		{
			$('#meetingList').hide();
			$('#map').show();
			$('#optionMap').hide();
			$('#optionList').show();
			
			if ( !bMapInitialized )
			{
				initiateMap();
				bMapInitialized = true;
			}
			displayMapData();
			
			meetingListViewMode = 'map';
		}
	}
	
	var map = null;
	function initiateMap()
	{
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(37.566672, 126.978380), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

		map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    if ( infoWindows != null && infoWindows.length > 0 ){
		    	for( var i = 0; i < infoWindows.length; i++ )
		    		infoWindows[i].close();
		    }
		    
		});
	}
	
	// 실제로 정모의 데이터가 담길 배열
	var positions = [];
	
	// 위 positions 배열의 데이터를 기반으로 markers 를 생성
	var markers = [];
	
	// 위 positions 배열의 데이터를 기반으로 infoWindow 를 생성
	var infoWindows = [];
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position, index) {
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        position: position,
	        clickable:true
	    });

	    daum.maps.event.addListener(marker, 'click', showInfoWindow(marker, index));
	    
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}
	
	function showInfoWindow( marker, index )
	{
		return function()
		{
			for( var i = 0; i < infoWindows.length; i++ )
				infoWindows[i].close();
			
			infoWindows[index].open(map, marker);	
		};
	}
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	
	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}
	
	function setMapData( result )
	{
		if ( result == null || result.data == null || result.data.length < 1 ) return;
		
		if ( infoWindows != null && infoWindows.length > 0 ){
	    	for( var i = 0; i < infoWindows.length; i++ )
	    		infoWindows[i].close();
	    }
		hideMarkers();
		positions = [];
		markers = [];
		infoWindows = [];
		
		for ( var i = 0; i < result.data.length; i++ )
		{
			if ( result.data[i].latitude == null || typeof result.data[i].latitude == 'undefined') continue;
			
			var position = {
					"latlng":new daum.maps.LatLng(result.data[i].latitude,result.data[i].longitude),
					"content":result.data[i].title
			}
			
			positions.push(position);
			
			var infowindow = new daum.maps.InfoWindow({
			    position: position,
			    content: '<div style="padding:5px;font-size:17px;width:100%">' + result.data[i].title + 
			    '<br/>' + displayDateFormat( result.data[i].meetingDate, 'MM-dd HH:mm' ) + '<br/>' + 
			    '<a href="javascript:void(0)" onclick="goMeetingDetail(\'' + 
			    		result.data[i].cafeID + '\',\'' + result.data[i].meetingNo + '\');">상세보기</a></div>'
			});
			
			infoWindows.push(infowindow);
		}
	}
	
	function displayMapData()
	{
		for ( var i = 0; i < positions.length; i++ )
			addMarker(positions[i].latlng, i);

		if (positions.length > 0 )
			map.panTo(positions[0].latlng);
	}
	
	function goMeetingDetail( cafeID, meetingNo )
	{
		try
		{
			var url = '<%= Constants.getServerURL() + "/cafe/meetingDetail.do" %>?cafeID=' +
			cafeID + '&meetingNo=' + meetingNo + "&userID=" + userID;

			if ( isApp == 'Y' )
				document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
			else
				document.location.href= url;	
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
</script>

	<script id="meetingT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="meetingListUL">
		{{#each data}}
		<li onclick="goMeetingDetail('{{cafeID}}','{{meetingNo}}')">
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{curNo}}/{{maxNo}}</div>
			<div id="cafeName">{{cafeName}}</div>
			<div id="location">{{address}}</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">해당 지역에 정모가 존재하지 않습니다.</div>
	{{/if}}
	</script>
	
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
					out.println("<li class='selected' level='" + level + "' regionNo='" + regionNo + 
					"' onclick=\"changeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
						 regionName + "</li>");
				else
					out.println("<li  level='" + level + "' regionNo='" + regionNo +
					"' onclick=\"changeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
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
		<div id="meetingList">
			
		</div>
		<div id="map">
		</div>
	</div>
		
	