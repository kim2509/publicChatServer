<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String isApp = request.getParameter("isApp");
	String cafeID = request.getParameter("cafeID");
	String boardNo = Util.getString(request.getParameter("boardNo"));	
	String postNo = Util.getString(request.getParameter("postNo"));
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>게시글 작성</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/modal_dialog.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061&libraries=services"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/newBoardPost.css?v=4" />

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var boardNo = '<%= boardNo %>';
	var postNo = '<%= postNo %>';
	
	var selectLocationModal = null;
	
	jQuery(document).ready(function(){
		
		// 모달창 인스턴트 생성
		selectLocationModal = new Example.Modal({
		    id: "modal" // 모달창 아이디 지정
		});
		
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
			
			if ( locationResult.locationName != null && locationResult.locationName.length > 0 )
			{
				$('#meetingLocationName').html( locationResult.locationName );
				$('#meetingLocation').html( '(' + locationResult.address + ')' );
			}
			else
			{
				$('#meetingLocationName').html('');
				$('#meetingLocation').html( locationResult.address );
			}
				
			
			
		}
	}
	
	function saveClick()
	{
		var title = $('#title').val();
		var desc = $('#desc').val();
		var maxNo = $('#maxNo').val();
		
		if ( title == '' )
		{
			alert('제목을 입력해 주십시오.');
			return;
		}
		
		if ( confirm('설정을 저장하시겠습니까?') )
		{
			var param = {"cafeID":cafeID, "boardNo":boardNo, "title": title , "content": desc, "type":"1"};
			
			if ( locationResult != null )
				param.postLocation = locationResult;
			
			console.log( JSON.stringify( param ) );
			
			ajaxRequest('POST', '/nearhere/boardPost/saveCafeBoardPostAjax.do', param , onSaveResult );
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
			
			if ( meetingInfo.locationNo > 0 )
			{
				$('#meetingLocationDiv').show();
				$('#locationDesc').hide();
				$('#meetingLocationName').html( meetingInfo.locationName);
				$('#meetingLocation').html( meetingInfo.address);
				
				locationResult = {};
				locationResult.locationNo = meetingInfo.locationNo;
				locationResult.locationType = meetingInfo.locationType;
				locationResult.latitude = meetingInfo.latitude;
				locationResult.longitude = meetingInfo.longitude;
				locationResult.address = meetingInfo.address;
				locationResult.locationName = meetingInfo.locationName;
			}
			
			if ( meetingInfo.meetingDate > 0 )
			{
				var meetingDate = displayDateFormat( meetingInfo.meetingDate, 'yyyy-MM-dd HH:mm' );
				$('.meetingDateTime .meetingDate').html( meetingDate.substring(0,10));
				$('.meetingDateTime .meetingTime').html( meetingDate.substring(11));
			}
		}
	}
	
	function onDateSet( dateString )
	{
		$('.meetingDateTime .meetingDate').html( dateString );
	}
	
	function onTimeSet( timeString )
	{
		$('.meetingDateTime .meetingTime').html( timeString );
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
		<% if (Util.isEmptyString(postNo)) { %>
			<div class="title">게시글 쓰기</div>
		<% } else { %>
			<div class="title">게시글 수정하기</div>
		<% } %>
		</div>
		
		<div id="container">
		
			<p class="subTitle paddingLR10 paddingTop10">제목</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="title" class="inputTxt" placeholder="글 제목" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">내용</p>
			
			<textarea id="desc" class="marginLR10 marginB20" value="" rows="3"></textarea>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">첨부된 이미지</p>
			
			<div id="imageListDiv" class="marginLR10 marginB20">
				<ul>
					<li>
						<img class="thumbnail" src="https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/115647760_Untitled-7.jpg?type=f270_166">
					</li>
					<li>
						<img class="thumbnail" src="https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/115647760_Untitled-7.jpg?type=f270_166">
					</li>
				</ul>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">이미지 첨부(선택)</p>
			
			<div id="imageDiv" class="marginLR10">
				<div id="imageUploadDesc">이미지를 업로드 해 주십시오.</div>
			</div>
			
			<div class="marginLR10 paddingTop10">
				<div id="btnImageUpload" class="wideBtn whiteBG" onclick="goSelectLocation();">이미지 첨부</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">글 위치(선택)</p>
			
			<div id="locationDiv" class="marginLR10">
				<div id="meetingLocationDiv" style="display:none">
					<span>지역: </span>
					<span id="meetingLocationName"></span>
					<span id="meetingLocation"></span>
				</div>
				<div id="locationDesc">현재 설정된 위치가 없습니다. 위치를 설정하시면 해당지역의 사용자들에게 검색이 됩니다.</div>
			</div>
			
			<div class="marginLR10 paddingTop10">
				<div id="btnManageBoard" class="wideBtn whiteBG" onclick="goSelectLocation();">위치 지정</div>
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