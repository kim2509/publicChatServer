<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/common_location_select.css?v=2" />

<script language="javascript">

	var bInitMap = false;
	
	var map = null;
	var marker = null;
	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2addr(coords, callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2detailaddr(coords, callback);
	}
	
	function locationTabSelect( tabIndex )
	{
		$('#tabView li').removeClass('selected');
		$('#tabView li').eq(tabIndex).addClass('selected');
		
		if ( tabIndex == 0 )
		{
			$('#mapTabContent').show();
			$('#regionTabContent').hide();
		}
		else if ( tabIndex == 1 )
		{
			$('#mapTabContent').hide();
			$('#regionTabContent').show();
		}
	}
	
	function showLocationSelectDiv( locationObject )
	{
		if ( bInitMap == false )
		{
			initiateMap();
		}
		
		initializeRegionTab( locationObject );
		
		if ( locationObject != null )
		{
			if ( locationObject.locationType == 1 )
			{
				locationTabSelect(0);
				
				if ( locationObject.locationName != null && locationObject.locationName.length > 0 )
					$('#searchLocationKeyword').val( locationObject.locationName );
				
				var latLng = new daum.maps.LatLng( locationObject.latitude, locationObject.longitude);
				
				// 지도 초기 위치 설정
				var bounds = new daum.maps.LatLngBounds();
				bounds.extend(latLng);
				map.setBounds(bounds);
				
				showMarker(latLng);
				showInfoWindow( latLng );
			}
			else if ( locationObject.locationType == 2 )
			{
				locationTabSelect(1);
			}
		}
	}
	
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
		    
			showMarker( mouseEvent.latLng );
		    showInfoWindow( mouseEvent.latLng );
		    
		});
		
		bInitMap = true;
	}
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (status, data, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new daum.maps.LatLngBounds();
	
	        for (var i=0; i<data.places.length; i++) {
	            displayMarker(data.places[i]);    
	            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
	            
	            if ( i == 0 ) break;
	        }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}	
	
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
		showMarker( new daum.maps.LatLng(place.latitude, place.longitude) );
		
		showInfoWindow( new daum.maps.LatLng(place.latitude, place.longitude), place.title );
	}
	
	function showMarker( latLng )
	{
		if ( marker == null )
	    {
			// 마커를 생성하고 지도에 표시합니다
		    marker = new daum.maps.Marker({
		        map: map,
		        position: latLng 
		    });
	    }
	    else
	    {
	    	marker.setPosition( latLng );
	    }
	}
	
	function showInfoWindow( latLng, title )
	{
		searchDetailAddrFromCoords( latLng , function(status, result) {
	        if (status === daum.maps.services.Status.OK) {
	        	
	        	var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : <span id="address2">' + result[0].roadAddress.name + '</span></div>' : '';
	            detailAddr += '<div>지번 주소 : <span id="address1">' + result[0].jibunAddress.name + '</span></div>';
	            
	            var areaName = '';
	            
	            if ( title != null && title.length > 0 )
	            {
	            	areaName = '<div>' + title + '</div>';
	            }
	            
	            var content = '<div class="addressInfo">' +
	            				areaName +
	                            detailAddr + 
	                        '</div>';
	
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(latLng);
	            marker.setMap(map);
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });		
	}
	
	function searchOnMap()
	{
		// 키워드로 장소를 검색합니다
		ps.keywordSearch($('#searchLocationKeyword').val() , placesSearchCB); 
	}
	
	function initializeRegionTab( locationObject )
	{
		$('#selRegionLevel1').change(function(){
			loadRegionList( $(this).attr('id'), locationObject );
		});
		
		$('#selRegionLevel2').change(function(){
			loadRegionList( $(this).attr('id'), locationObject );
		});
		
		$('#selRegionLevel3').change(function(){
			loadRegionList( $(this).attr('id'), locationObject );
		});
		
		var param = {};
		ajaxRequest2('POST', '/nearhere/region/getRegionListByParentAjax.do', param , locationObject, onRegionFetchResult );
	}
	
	function onRegionFetchResult( result, locationObject )
	{
		try
		{
			if ( result == null || result.data == null || result.data.length < 1 ) return;
			
			for ( var i = 0; i < result.data.length; i++ )
			{
				var optionElement = $('<option></option>');
				
				optionElement.val(result.data[i].regionNo);
				optionElement.html(result.data[i].regionName);
				
				var elementID = '';
				
				if ( result.data[i].level == 1 )
					elementID = 'selRegionLevel1';
				else if ( result.data[i].level == 2 )
					elementID = 'selRegionLevel2';
				else if ( result.data[i].level == 3 )
					elementID = 'selRegionLevel3';
				else if ( result.data[i].level == 4 )
					elementID = 'selRegionLevel4';
				
				$('#' + elementID ).append( optionElement );
			}
			
			// default 값 셋팅
			if ( elementID == 'selRegionLevel1' && locationObject != null && locationObject.lRegionNo != null && 
					locationObject.lRegionNo > 0 && $('#' + elementID).val() != locationObject.lRegionNo )
			{
				$('#' + elementID).val( locationObject.lRegionNo );
				loadRegionList( elementID, locationObject );
			}
			else if ( elementID == 'selRegionLevel2' && locationObject != null && locationObject.mRegionNo != null && 
					locationObject.mRegionNo > 0 && $('#' + elementID).val() != locationObject.mRegionNo )
			{
				$('#' + elementID).val( locationObject.mRegionNo );
				loadRegionList( elementID, locationObject );
			}
			else if ( elementID == 'selRegionLevel3' && locationObject != null && locationObject.sRegionNo != null && 
					locationObject.sRegionNo > 0 && $('#' + elementID).val() != locationObject.sRegionNo )
			{
				$('#' + elementID).val( locationObject.sRegionNo );
				loadRegionList( elementID, locationObject );
			}
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function loadRegionList( elementID, locationObject)
	{
		if ( elementID == null || elementID.length < 1 ) return;
		
		if ( elementID == 'selRegionLevel1' )
		{
			if ( $('#' + elementID ).val() != '' )
			{
				$('#selRegionLevel2').empty();
				$('#selRegionLevel2').append( '<option value="">선택하세요</option>' );
				$('#selRegionLevel3').empty();
				$('#selRegionLevel3').append( '<option value="">선택하세요</option>' );
				$('#selRegionLevel4').empty();
				$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
			}
		}
		else if ( elementID == 'selRegionLevel2' )
		{
			if ( $('#' + elementID ).val() != '' )
			{
				$('#selRegionLevel3').empty();
				$('#selRegionLevel3').append( '<option value="">선택하세요</option>' );
				$('#selRegionLevel4').empty();
				$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
			}
		}
		else if ( elementID == 'selRegionLevel3' )
		{
			if ( $('#' + elementID ).val() != '' )
			{
				$('#selRegionLevel4').empty();
				$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );				
			}
		}
		
		var param = {'regionNo':$('#' + elementID ).val()};
		ajaxRequest2('POST', '/nearhere/region/getRegionListByParentAjax.do', param , locationObject, onRegionFetchResult );
	}
	
	function selectLocation()
	{
		if ( confirm('현재 위치로 지정하시겠습니까?') )
		{
			var result = {};
			if ( $('#tabView #mapTabElement').attr('class') == 'selected' )
			{
				result.locationType = 1;
				
				if ( marker == null || marker.getPosition() == null )
				{
					alert('위치를 선택해 주십시오.');
					return;
				}
				
				result.latitude = marker.getPosition().getLat();
				result.longitude = marker.getPosition().getLng();
				
				result.address1 = $('#mapTabContent .addressInfo #address1').html();
				result.address2 = $('#mapTabContent .addressInfo #address2').html();
				
				if ( result.address1.trim().length < 1 )
				{
					alert('주소가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
					return;
				}
			}
			else
			{
				result.locationType = 2;
				
				result.lRegionNo = $('#selRegionLevel1').val();
				if ( result.lRegionNo != '' )
				{
					result.lRegionName = $('#selRegionLevel1 option:selected').text();
					result.address1 = result.lRegionName + ' ';
					result.regionNo = result.lRegionNo;
				}
				else
				{
					alert('지역을 선택해 주십시오.');
					return;
				}

				result.mRegionNo = $('#selRegionLevel2').val();
				if ( result.mRegionNo != '' )
				{
					result.mRegionName = $('#selRegionLevel2 option:selected').text();
					result.address1 += result.mRegionName + ' ';
					result.regionNo = result.mRegionNo;
				}
				
				result.sRegionNo = $('#selRegionLevel3').val();
				if ( result.sRegionNo != '' )
				{
					result.sRegionName = $('#selRegionLevel3 option:selected').text();
					result.address1 += result.sRegionName + ' ';
					result.regionNo = result.sRegionNo;
				}
								
				result.tRegionNo = $('#selRegionLevel4').val();
				if ( result.tRegionNo != '' )
				{
					result.tRegionName = $('#selRegionLevel4 option:selected').text();
					result.address1 += result.tRegionName + ' ';
					result.regionNo = result.tRegionNo;
				}
				
				result.address1 = result.address1.trim(); 
			}
			
			result.address = result.address1;
			result.locationName = $('#searchLocationKeyword').val();
			
			// parent 의 함수를 호출
			locationSelected( result );
		}
	}

</script>

<ul id="tabView">
	<li class="selected" id='mapTabElement' onclick="locationTabSelect(0);">
		<div id="tabMap">지도에서 정하기</div>
	</li>
	<li onclick="locationTabSelect(1);" id='regionTabElement'>
		<div>지역 선택하기</div>
	</li>
</ul>
<div id="mapTabContent">

	<div style="text-align:center;margin-bottom:10px;">
		<input type="text" id="searchLocationKeyword" 
		placeholder="지역을 검색하세요." style="width:70%;line-height:25px;padding-left:5px;">
		<input type="button" value="검색" style="line-height:25px;" onclick="searchOnMap();"/>
	</div>
	<div id="map"></div>
	
</div>
<div id="regionTabContent" style="display:none;">

	<table style="width:100%;">
		<colgroup>
			<col width="120px;"></col>
			<col width="*"></col>
		</colgroup>
		<tr>
			<td class="th1">시/도</td>
			<td class="th2">
				<select name="selRegionLevel1" id="selRegionLevel1" style="width:100%;">
					<option value="">선택하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="th1">시/구/군</td>
			<td class="th2">
				<select name="selRegionLevel2" id="selRegionLevel2" style="width:100%;">
					<option value="">선택하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="th1">동/읍/면</td>
			<td class="th2">
				<select name="selRegionLevel3" id="selRegionLevel3" style="width:100%;">
					<option value="">선택하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="th1">리</td>
			<td class="th2">
				<select name="selRegionLevel4" id="selRegionLevel4" style="width:100%;">
					<option value="">선택하세요.</option>
				</select>
			</td>
		</tr>
	</table>

</div>

   <div id="mainImageBtnDiv" class="marginB20 marginT10">
	<div class="splitBtn">
		<div class="wideBtn blueBG" onclick="selectLocation();">위치 선택하기</div>
	</div>
	<div class="splitBtn">
		<div class="wideBtn redBG js_close">닫기</div>
	</div>
</div>