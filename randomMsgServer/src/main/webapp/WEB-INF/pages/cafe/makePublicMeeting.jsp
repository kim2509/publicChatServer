<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String cafeID = request.getParameter("cafeID");
	String isApp = request.getParameter("isApp");
	String meetingNo = request.getParameter("meetingNo");
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

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/makePublicMeeting.css?v=" />

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var meetingNo = '<%= meetingNo %>';
	
	var selectLocationModal = null;
	
	jQuery(document).ready(function(){
		
		// 모달창 인스턴트 생성
		selectLocationModal = new Example.Modal({
		    id: "modal" // 모달창 아이디 지정
		});
		
		if ( meetingNo != null && meetingNo.length > 0 )
		{
			getMeetingInfo();
		}
	});
	
	function goSelectLocation()
	{
		selectLocationModal.show();
		showLocationSelectDiv( locationResult );
	}

	var locationResult = null;
	function locationSelected( result )
	{
		if ( selectLocationModal != null )
			selectLocationModal.hide();
		
		if ( locationResult == null )
			locationResult = result;
		else
		{
			result.locationNo = locationResult.locationNo;
			locationResult = result;
		}
		console.log(JSON.stringify( locationResult ) );
		
		setAddress();
	}
	
	function setAddress()
	{
		if ( locationResult != null )
		{
			$('#meetingLocationDiv').show();
			$('#locationDesc').hide();
			
			$('#meetingLocation').html( locationResult.address );
		}
	}
	
	function saveClick()
	{
		var meetingTitle = $('#meetingTitle').val();
		var meetingDesc = $('#meetingDesc').val();
		
		var meetingDate = $('.meetingDate').html();
		var meetingTime = $('.meetingTime').html();
		
		if ( meetingTitle == '' )
		{
			alert('정모이름을 입력해 주십시오.');
			return;
		}
		
		if ( meetingDate.length != 10 || meetingTime.length != 5 )
		{
			alert('정모 일시가 올바르지 않습니다.(yyyy-HH-mm hh:mm)');
			return;
		}
		
		if ( confirm('설정을 저장하시겠습니까?') )
		{
			var param = {"cafeID":cafeID, "meetingTitle":meetingTitle, "meetingDesc": meetingDesc, 
					"meetingDate" : meetingDate + ' ' + meetingTime };
			
			if ( locationResult != null )
				param.meetingLocation = locationResult;
			
			ajaxRequest('POST', '/nearhere/cafe/saveCafePublicMeetingAjax.do', param , onSaveResult );
		}
	}
	
	function onSaveResult( result )
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
			alert('저장되었습니다.');
		}
	}
	
	function openDatePicker()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			Android.openDatePicker();
		}
	}
	
	function setDepartureDate( departureDate )
	{
		$('.departureDate').html( departureDate );
	}
	
	function openTimePicker()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			Android.openTimePicker();
		}
	}
	
	function setDepartureTime( departureTime )
	{
		$('.departureTime').html( departureTime );
	}
	
	function getMeetingInfo()
	{
		var param = {"meetingNo":meetingNo};
		
		ajaxRequest('POST', '/nearhere/cafe/getCafePublicMeetingInfoAjax.do', param , onMeetingInfoFetched );
	}
	
	var meetingInfo = null;
	function onMeetingInfoFetched( result )
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
			console.log( JSON.stringify( result ) );
			
			meetingInfo = result.data.meetingInfo;
			$('#meetingTitle').val( meetingInfo.title );
			$('#meetingDesc').val( meetingInfo.meetingDesc );
			$('#maxNo').val( meetingInfo.maxNo );
		}
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">정모 만들기</div>
		</div>
		
		<div id="container">
		
			<p class="subTitle paddingLR10 paddingTop10">정모 이름</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="meetingTitle" class="inputTxt" placeholder="정모 이름" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">상세 공지 내용</p>
			
			<textarea id="meetingDesc" class="marginLR10 marginB20" value="" rows="3"></textarea>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">정모 위치</p>
			
			<div id="locationDiv" class="marginLR10">
				<div id="meetingLocationDiv" style="display:none">
					<span>지역: </span>
					<span id="meetingLocation"></span>
				</div>
				<div id="locationDesc">현재 설정된 위치가 없습니다. 위치를 설정하시면 해당지역의 사용자들에게 검색이 됩니다.</div>
			</div>
			
			<div class="marginLR10 paddingTop10">
				<div id="btnManageBoard" class="wideBtn whiteBG" onclick="goSelectLocation();">위치 지정</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">정모 일시</p>
			
			<div class="meetingDateTime">
				<div class="meetingDate" onclick="openDatePicker();">2018-12-28</div>
				<div class="meetingTime" onclick="openTimePicker();">19:00</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">전체 인원</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="maxNo" class="inputTxt" placeholder="최대 인원수" value="" />
			</div>
			
			<div class="upperLine">
			</div>
			
			<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
			
				<div class="wideBtn btnBG" onclick="saveClick();">저장</div>
				
			</div>
		
			<!-- 모달창 -->
			<div id="modal">
				<jsp:include page="../common/locationSelectDiv.jsp" flush="true"></jsp:include>
			</div>
		    
		</div>
					
	</div>
	
</body>
</html>