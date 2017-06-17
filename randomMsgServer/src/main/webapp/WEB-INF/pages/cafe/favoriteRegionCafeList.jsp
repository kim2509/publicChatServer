<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	List<HashMap> myFavRegionList = (List<HashMap>) request.getAttribute("myFavRegionList");
%>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/moreFavoriteCafe.css?v=1" />

<script language="javascript">

	var isApp = '<%= isApp %>';
	var userID = '<%= userID %>';

	jQuery(document).ready(function(){
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );
		
		// 초기 데이터 로딩
		if ( $('#favoriteCafeRegionDiv ul li').length > 0 )
		{
			// 홀수 개의 관심지역일 때 공백을 하나 추가함.
			if ( $('#favoriteCafeRegionDiv ul li').length % 2 != 0 )
			{
				$('#favoriteCafeRegionDiv ul').append('<li>&nbsp;</li>');
			}
			
			getCafeList();
		}
	});
	
	function getCafeList()
	{
		var level = $('#favoriteCafeRegionDiv ul .selected').attr('level');
		var regionNo = $('#favoriteCafeRegionDiv ul .selected').attr('regionNo');
		var param = {"level":level, "regionNo": regionNo, "startIndex":startIndex, "showCount" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeListByRegionAjax.do', param , onFavoriteRegionCafeListResult );	
	}
	
	function changeCafeRegion( element, regionNo, level )
	{
		pageNo = 1;
		startIndex = 0;
		
		$('#favoriteCafeRegionDiv .favoriteCafeRegion li').removeClass('selected');		
		$(element).addClass('selected');
		
		var param = {"level":level, "regionNo": regionNo, "startIndex":startIndex, "showCount" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeListByRegionAjax.do', param , onFavoriteRegionCafeListResult );
	}

	var cafeListViewMode = 'list';
	
	function onFavoriteRegionCafeListResult( result )
	{
		try
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);
			$('#favRegionCafeList #favoriteRegionCafeList').html(html);
			
			setCafeMapData(result);
			
			if ( cafeListViewMode == 'map' )
			{
				displayCafeMapData();
			}
			
			console.log( JSON.stringify( result ) );
			
			totalItemCount = result.data2;
			
			if ( result.data != null && result.data.length > 0 )
			{
				if ( $('#favRegionCafeList').is(':visible') )
				{
					if ($('#pagingInfo').length > 0 )
						$('#pagingInfo').show();
					
					if ( cafeListViewMode == 'list' )
					{
						$('#favoriteRegionCafeListDiv #optionViewByMap').show();
						$('#favCafeMapDiv').hide();
						$('#favoriteRegionCafeList').show();
					}
					else
					{
						$('#favoriteRegionCafeListDiv #optionViewByList').show();
						$('#favCafeMapDiv').show();
						$('#favoriteRegionCafeList').hide();
					}
				}
			}
			else
			{
				if ( $('#favRegionCafeList').is(':visible') )
				{
					if ($('#pagingInfo').length > 0 )
						$('#pagingInfo').hide();	
				}
				
				$('#favoriteRegionCafeListDiv #optionViewByMap').hide();
				$('#favoriteRegionCafeListDiv #optionViewByList').hide();
				
				$('#favCafeMapDiv').hide();
				$('#favoriteRegionCafeList').show();
			}
			
			if ( $('#favRegionCafeList').is(':visible') && $('#pagingInfo').length > 0 )
				displayPagingInfo();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	var bCafeMapInitialized = false;
	function toggleCafeResultView()
	{
		if ( cafeListViewMode == 'map' )
		{
			$('#favoriteRegionCafeList').show();
			$('#favCafeMapDiv').hide();
			$('#favoriteRegionCafeListDiv #optionViewByMap').show();
			$('#favoriteRegionCafeListDiv #optionViewByList').hide();
			
			cafeListViewMode = 'list';
		}
		else
		{
			$('#favoriteRegionCafeList').hide();
			$('#favCafeMapDiv').show();
			$('#favoriteRegionCafeListDiv #optionViewByMap').hide();
			$('#favoriteRegionCafeListDiv #optionViewByList').show();
			
			if ( !bCafeMapInitialized )
			{
				initiateCafeMap();
				bCafeMapInitialized = true;
			}
			
			displayCafeMapData();
			
			cafeListViewMode = 'map';
		}
	}
	
	var favCafeMap = null;
	function initiateCafeMap()
	{
		var container = document.getElementById('favCafeMapDiv'); //지도를 담을 영역의 DOM 레퍼런스
	
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(37.566672, 126.978380), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

		favCafeMap = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(favCafeMap, 'click', function(mouseEvent) {        
		    
		    if ( cafeInfoWindows != null && cafeInfoWindows.length > 0 ){
		    	for( var i = 0; i < cafeInfoWindows.length; i++ )
		    		cafeInfoWindows[i].close();
		    }
		    
		});
		
	}
	
	// 실제로 정모의 데이터가 담길 배열
	var cafePositions = [];
	
	// 위 cafePositions 배열의 데이터를 기반으로 markers 를 생성
	var cafeMarkers = [];
	
	// 위 cafePositions 배열의 데이터를 기반으로 infoWindow 를 생성
	var cafeInfoWindows = [];
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addCafeMarker(position, index) {
	    
		// 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        position: position,
	        clickable:true
	    });

	    daum.maps.event.addListener(marker, 'click', showCafeInfoWindow(marker, index));
	    
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(favCafeMap);
	    
	    // 생성된 마커를 배열에 추가합니다
	    cafeMarkers.push(marker);
	}
	
	function showCafeInfoWindow( marker, index )
	{
		return function()
		{
			for( var i = 0; i < cafeInfoWindows.length; i++ )
				cafeInfoWindows[i].close();
			
			cafeInfoWindows[index].open(favCafeMap, marker);	
		};
	}
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setCafeMarkers(favCafeMap) {
	    for (var i = 0; i < cafeMarkers.length; i++) {
	    	cafeMarkers[i].setMap(favCafeMap);
	    }            
	}
	
	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(favCafeMap)    
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideCafeMarkers() {
		setCafeMarkers(null);    
	}
	
	function setCafeMapData( result )
	{
		if ( result == null || result.data == null || result.data.length < 1 ) return;
		
		if ( cafeInfoWindows != null && cafeInfoWindows.length > 0 ){
	    	for( var i = 0; i < cafeInfoWindows.length; i++ )
	    		cafeInfoWindows[i].close();
	    }
		hideCafeMarkers();
		cafePositions = [];
		cafeMarkers = [];
		cafeInfoWindows = [];
		
		for ( var i = 0; i < result.data.length; i++ )
		{
			if ( result.data[i].latitude == null || typeof result.data[i].latitude == 'undefined') continue;
			
			var position = {
					"latlng":new daum.maps.LatLng(result.data[i].latitude,result.data[i].longitude),
					"content":result.data[i].cafeName
			}
			
			cafePositions.push(position);
			
			var infowindow = new daum.maps.InfoWindow({
			    position: position,
			    content: '<div style="padding:5px;font-size:17px;width:100%">' + result.data[i].cafeName + '<br/>' + 
			    '<a href="javascript:void(0)" onclick="goCafeHome(\'' + result.data[i].cafeID + '\');">상세보기</a></div>'
			});
			
			cafeInfoWindows.push(infowindow);
		}
	}
	
	function displayCafeMapData()
	{
		for ( var i = 0; i < cafePositions.length; i++ )
			addCafeMarker(cafePositions[i].latlng, i);

		if (cafePositions.length > 0 )
			favCafeMap.panTo(cafePositions[0].latlng);
	}
	
</script>
	
	<div id="favoriteCafeRegionDiv">
		<div id="linkDiv" onclick="goFavoriteRegionPage();">설정</div>
		<div id="subTitle">관심지역</div>
		<% if ( myFavRegionList != null && myFavRegionList.size() > 0 ) { %>
		<ul class="favoriteCafeRegion">
		<%
			for ( int i = 0; i < myFavRegionList.size(); i++ )
			{
				String level = myFavRegionList.get(i).get("level").toString();
				String regionNo = myFavRegionList.get(i).get("regionNo").toString();
				String regionName = myFavRegionList.get(i).get("regionName").toString();
				
				if ( i == 0 )
					out.println("<li class='selected' level='" + level + "' regionNo='" + regionNo + 
					"' onclick=\"changeCafeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
						 regionName + "</li>");
				else
					out.println("<li  level='" + level + "' regionNo='" + regionNo +
					"' onclick=\"changeCafeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
							regionName + "</li>");
			}
		%>	
		</ul>
		<% } else { %>
		<p>관심지역이 설정되어 있지 않습니다.</p>
		<% } %>
	</div>
	
	<% if ( myFavRegionList != null && myFavRegionList.size() > 0 ) { %>
	<div id="favoriteRegionCafeListDiv">
		<div id="optionViewByMap" class="option" onclick="toggleCafeResultView();">지도로 보기</div>
		<div id="optionViewByList" class="option" onclick="toggleCafeResultView();">리스트로 보기</div>
		<div id="subTitle">카페 리스트</div>
		<div id="favoriteRegionCafeList" >
			
		</div>
		<div id="favCafeMapDiv" style="display:none;height:200px;margin:0px 0px 10px 0px;">
		</div>
	</div>
	<% } %>
		
	