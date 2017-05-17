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
			$('#cafeLocationDiv').show();
			$('#locationDesc').hide();
			
			$('#cafeLocation').html( locationResult.address );
		}
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
			
			if ( locationResult != null )
				param.cafeLocation = locationResult;
			
			ajaxRequest('POST', '/nearhere/cafe/saveCafeInfoAjax.do', param , onSaveResult );
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
	
	function publishCafe()
	{
		if ( confirm('카페를 공개하시겠습니까?') )
		{
			var param = {"cafeID":cafeID };
			ajaxRequest('POST', '/nearhere/cafe/publishCafeAjax.do', param , publishCafeResult );	
		}
	}
	
	function publishCafeResult( result )
	{
		if ( result == null )
		{
			alert('처리도중 오류가 발생했습니다.');
			return;
		}
		
		if ( result.resCode != '0000' )
		{
			alert( result.resMsg );
			return;
		}
		else
		{
			$('#btnUnPublish').show();
			$('#btnPublish').hide();
			
			alert('공개되었습니다.');	
		}
	}
	
	function unpublishCafe()
	{
		if ( confirm('운영자외에는 카페접근이 금지됩니다.\r\n정말카페를 비공개하시겠습니까?') )
		{
			var param = {"cafeID":cafeID };
			ajaxRequest('POST', '/nearhere/cafe/unpublishCafeAjax.do', param , unpublishCafeResult );	
		}
	}
	
	function unpublishCafeResult( result )
	{
		if ( result == null )
		{
			alert('처리도중 오류가 발생했습니다.');
			return;
		}
		
		if ( result.resCode != '0000' )
		{
			alert( result.resMsg );
			return;
		}
		else
		{
			$('#btnUnPublish').hide();
			$('#btnPublish').show();
			
			alert('비공개되었습니다.');	
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
				<input type="text" id="cafeNameIput" class="inputTxt" placeholder="정모 이름" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">상세 공지 내용</p>
			
			<textarea id="cafeDescInput" class="marginLR10 marginB20" value="" rows="3">
			</textarea>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">정모 위치</p>
			
			<div id="locationDiv" class="marginLR10">
				<div id="cafeLocationDiv" style="display:none">
					<span>지역: </span>
					<span id="cafeLocation"></span>
				</div>
				<div id="locationDesc">현재 설정된 위치가 없습니다. 위치를 설정하시면 해당지역의 사용자들에게 검색이 됩니다.</div>
			</div>
			
			<div class="marginLR10 paddingTop10">
				<div id="btnManageBoard" class="wideBtn whiteBG" onclick="goSelectLocation();">위치 지정</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">전체 인원</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="contactEmail" class="inputTxt" placeholder="이메일" value="" />
			</div>
			
			<div class="upperLine">
			</div>
			
			<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
			
				<div class="wideBtn btnBG" onclick="saveClick();">저장</div>
				
				<div class="wideBtn redBG" onclick="deleteCafe();">카페 폐쇄</div>
			
			</div>
		
		
			<!-- 모달창 -->
			<div id="modal">
				<jsp:include page="../common/locationSelectDiv.jsp" flush="true"></jsp:include>
			</div>
		    
		</div>
					
	</div>
	
</body>
</html>