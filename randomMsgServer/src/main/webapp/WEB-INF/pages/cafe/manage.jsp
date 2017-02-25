<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String cafeID = request.getParameter("cafeID");
	String isApp = request.getParameter("isApp");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>카페 관리하기</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/modal_dialog.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061&libraries=services"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage.css?v=" />

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	
	function goManageBoard()
	{
		var url = '<%= Constants.getServerURL() + "/cafe/manageBoard.do" %>?cafeID=' + cafeID
	
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function goManageMember()
	{
		var url = '<%= Constants.getServerURL() + "/cafe/manageMember.do" %>?cafeID=' + cafeID
	
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}

	var selectLocationModal = null;
	
	jQuery(document).ready(function(){
		getCafeMainInfo();
		
		// 모달창 인스턴트 생성
		selectLocationModal = new Example.Modal({
		    id: "modal" // 모달창 아이디 지정
		});
	});
	
	function getCafeMainInfo()
	{
		var param = {"cafeID":"<%= cafeID %>" };
		ajaxRequest('POST', '/nearhere/cafe/cafeMainInfoAjax.do', param , onMainInfoResult );	
	}
	
	function onMainInfoResult( result )
	{
		if ( result == null || result.data == null || result.data.cafeMainInfo == null ) return;
		
		if ('Y' == result.data.cafeMainInfo.publishYN )
		{
			$('#btnUnPublish').show();
			$('#btnPublish').hide();
		}
		else
		{
			$('#btnUnPublish').hide();
			$('#btnPublish').show();		
		}
		
		$('#cafeNameIput').val( result.data.cafeMainInfo.cafeName );
		$('#cafeDescInput').val( result.data.cafeMainInfo.mainDesc );
		$('#contactEmail').val( result.data.cafeMainInfo.contactEmail );
			
	}
	
	function validateEmail(email) {
	    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	}
	
	function saveClick()
	{
		var cafeName = $('#cafeNameIput').val();
		var mainDesc = $('#cafeDescInput').val();
		var contactEmail = $('#contactEmail').val();
		
		// 저장할 때에는 이메일을 입력했을 때에만 validation 검사
		if ( contactEmail != null && contactEmail.length > 0 && validateEmail(contactEmail) == false )
		{
			alert('이메일 형식이 올바르지 않습니다.');
			return;
		}
		
		if ( confirm('설정을 저장하시겠습니까?') )
		{
			var param = {"cafeID":cafeID, "cafeName":cafeName, "mainDesc": mainDesc, "contactEmail": contactEmail };
			
			ajaxRequest('POST', '/nearhere/cafe/saveCafeInfoAjax.do', param , onSaveResult );
		}
	}
	
	function onSaveResult()
	{
		alert('저장되었습니다.');
	}
	
	function deleteCafe()
	{
		if ( confirm('카페의 모든 데이터가 삭제됩니다. 계속하시겠습니까?') )
		{
			var param = {"cafeID":cafeID };
			
			ajaxRequest('POST', '/nearhere/cafe/deleteCafeAjax.do', param , deleteCafeResult );
		}
	}
	
	function deleteCafeResult()
	{
		if ( isApp =='Y' )
		{
		
		}
		else
		{
			window.history.back();
		}
	}
	
	var bInitMap = false;
	function goSelectLocation()
	{
		selectLocationModal.show();
		
		if ( bInitMap == false )
		{
			initiateMap();
		}
	}
		
	function locationTabSelect( element, tabIndex )
	{
		$('#tabView li').removeClass('selected');
		$(element).addClass('selected');
		
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
	        	
	        	var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
	            
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
	
	function selectLocation()
	{
		if ( confirm('현재 위치로 지정하시겠습니까?') )
		{
			if ( selectLocationModal != null )
				selectLocationModal.hide();
		}
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">카페 관리</div>
		</div>
		
		<div id="container">
		
			<p class="subTitle paddingLR10 paddingTop10">카페 이름</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="cafeNameIput" class="inputTxt" placeholder="카페이름" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">카페 설명</p>
			
			<textarea id="cafeDescInput" class="marginLR10 marginB20" value="" rows="3">
			</textarea>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">카페 위치</p>
			
			<div id="locationDiv" class="marginLR10">
				<div id="cafeLocationDiv" style="display:none">
					<span>지역: </span>
					<span id="cafeLocation">서울시 송파구 방이동</span>
				</div>
				<div id="locationDesc">현재 설정된 위치가 없습니다. 위치를 설정하시면 해당지역의 사용자들에게 검색이 됩니다.</div>
			</div>
			
			<div class="marginLR10 paddingTop10">
				<div id="btnManageBoard" class="wideBtn whiteBG" onclick="goSelectLocation();">위치 지정</div>
			</div>
			<p class="subTitle paddingLR10 paddingTop10 upperLine">카페 아이콘</p>
			
			<div id="iconDiv">
				<img src = "" id="imgCafeIcon"/>
				<div id="emptyDiv" style="display:none;">아이콘이 없습니다.</div>
			</div>
			
			<div id="iconBtnDiv" class="marginLR10 marginB20">
				<div class="splitBtn">
					<div class="wideBtn darkBG" id="btnUploadMainImg">카페 아이콘 업로드</div>
				</div>
				<div class="splitBtn">
					<div class="wideBtn redBG">지우기</div>
				</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">카페 메인 이미지</p>
			
			<div id="mainImageDiv" class="marginLR10">
				<img src = "" id="imgMainImage"/>
				<div id="emptyDiv">메인이미지가 없습니다.</div>
			</div>
			
			<div id="mainImageBtnDiv" class="marginLR10 marginB20">
				<div class="splitBtn">
					<div class="wideBtn darkBG" id="btnUploadMainImg">메인 이미지 업로드</div>
				</div>
				<div class="splitBtn">
					<div class="wideBtn redBG">지우기</div>
				</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">운영자 이메일</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="contactEmail" class="inputTxt" placeholder="이메일" value="" />
			</div>
			
			<div class="upperLine">
			</div>
			
			<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
			
				<div id="btnManageBoard" class="wideBtn whiteBG" onclick="goManageBoard();">게시판 관리</div>
				<div class="wideBtn whiteBG" onclick="goManageMember();">회원 관리</div>
				
				<div class="wideBtn btnBG" onclick="saveClick();">저장</div>
				
				<div id="btnUnPublish" class="wideBtn darkBG" style="display:none">카페 비공개</div>
				<div id="btnPublish" class="wideBtn blueBG" style="display:none">카페 공개</div>
				
				<div class="wideBtn redBG" onclick="deleteCafe();">카페 폐쇄</div>
			
			</div>
		
		
			<!-- 모달창 -->
			<div id="modal">
			    <ul id="tabView">
					<li class="selected" onclick="locationTabSelect(this, 0);">
						<div id="tabMap">지도에서 정하기</div>
					</li>
					<li onclick="locationTabSelect(this, 1);">
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
				
			    <!-- button id="confirm_button">확인</button>
			    <button class="js_close">닫기</button-->
			    
			    <div id="mainImageBtnDiv" class="marginB20 marginT10">
					<div class="splitBtn">
						<div class="wideBtn darkBG" onclick="selectLocation();">위치 선택하기</div>
					</div>
					<div class="splitBtn">
						<div class="wideBtn redBG js_close">닫기</div>
					</div>
				</div>
			
			</div>
		    
		</div>
					
	</div>
	
</body>
</html>