<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	Post post = null;
	String message = "";
	
	if ( request.getAttribute("postDetail") != null )
	{
		post = (Post) request.getAttribute("postDetail");
		message = post.getMessage();
		post.getFromLatitude();
		post.getFromLongitude();
		post.getFromAddress();
		post.getLatitude();
		post.getLongitude();
		post.getToAddress();
		post.getDepartureDate();
		post.getDepartureTime();
		post.getRegion();
		post.getUser().getUserID();
		post.getSexInfo();
		post.getNumOfUsers();
		post.getVehicle();
		post.getFareOption();
		post.getRepetitiveYN();
	}
%>
<html>

<head>
<title>합승정보 등록</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/newPost.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var requestData = {};
	
	jQuery(document).ready(function() {

		getRegionList();
		
	});
	
	function openMap( param )
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			Android.openMap( param );
		}
	}
	
	function setLocation( param, name, address, latitude, longitude )
	{
		if ( param == 'departure')
		{
			if ( name != null && name.length > 0 )
				$('.departure').html( name );
			else
				$('.departure').html( address );
			
			requestData.fromLatitude = latitude;
			requestData.fromLongitude = longitude;
			requestData.fromAddress = address;
		}
		else if ( param == 'destination')
		{
			if ( name != null && name.length > 0 )
				$('.destination').html( name );
			else
				$('.destination').html( address );
			
			requestData.toLatitude = latitude;
			requestData.toLongitude = longitude;
			requestData.toAddress = address;
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
		requestData.departureDate = departureDate;
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
		requestData.departureTime = departureTime;
	}
	
	function getRegionList()
	{
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getRegionListAjax.do",
			data : {},
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( data == null || data.data == null || data.data.length < 1 ) return;
					
					var selectElement = $('#regionList');
					
					for ( var i = 0; i < data.data.length; i++ )
					{
						selectElement.append('<option value="' + data.data[i].regionNo + '">' + data.data[i].regionName + '</option>')	
					}
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
			},
			error : function(xhr, status, error) {
			}
		});
	}
	
	function validateInput()
	{
		if (requestData.userID == null || requestData.userID.length < 1 )
		{
			showOKDialog('경고', '사용자 정보가 올바르지 않습니다.');
			return false;
		}
		
		if (requestData.message == null || requestData.message.length < 1 )
		{
			showOKDialog('경고', '제목을 입력해 주십시오.');
			return false;
		}
		
		if (requestData.fromLatitude == null || requestData.fromLatitude.length < 1 )
		{
			showOKDialog('경고', '출발지를 선택해 주십시오.');
			return false;
		}
		
		if (requestData.toLatitude == null || requestData.toLatitude.length < 1 )
		{
			showOKDialog('경고', '도착지를 선택해 주십시오.');
			return false;
		}
		
		if (requestData.departureDate == null || requestData.departureDate.length < 1 )
		{
			showOKDialog('경고', '출발일자를 선택해 주십시오.');
			return false;
		}
		
		if (requestData.region == null || requestData.region.length < 1 )
		{
			showOKDialog('경고', '도착지역을 선택해 주십시오.');
			return false;
		}
		
		return true;
	}
	
	function insertPost()
	{
		try
		{
			requestData.userID = getUserID();
			requestData.message = $('#message').val();
			requestData.region = $('#regionList').val();
			requestData.sexInfo = $('#sexInfo').val();
			requestData.numOfUsers = $('#numOfUsers').val();
			requestData.vehicle = $('#vehicle').val();
			requestData.fareOption = $('#fareOption').val();
			requestData.repeat = $('#repeat').val();
		
			if ( validateInput() == false ) return;
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/taxi/insertPostAjax.do",
				data : JSON.stringify(requestData),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( data == null )
						{
							showOKDialog('경고', '합승등록중 오류가 발생했습니다.');
							return;
						}
						
						if ( data.resCode != '0000')
						{
							showOKDialog('경고', data.resMsg );
							return;
						}
						
						finish();
						
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				},
				error : function(xhr, status, error) {
				}
			});	
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function showOKDialog( title, message, param )
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			Android.showOKDialog(title, message,param);
		}
	}
	
	function getUserID()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			return Android.getUserID();
		}
		
		return '';
	}
	
	function finish()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			return Android.finishActivity('refresh');
		}
		
		return '';
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="title">
			<input type=text name="message" id="message" value="" placeholder="제목을 입력해 주세요."/>
		</div>
		<div class="departure" onclick="openMap('departure');">출발지를 설정해 주세요</div>
		
		<div class="destination" onclick="openMap('destination');">도착지를 설정해 주세요</div>
		
		<div class="departureDateTime">
			<div class="departureDate" onclick="openDatePicker();">출발일 설정</div>
			<div class="departureTime" onclick="openTimePicker();">출발시간 설정</div>
		</div>

		<div class="detailSetting">
			<table>
				<colgroup>
					<col width="60px;"/>
					<col width="140px;"/>
					<col width="60px;"/>
					<col width="140px;"/>
				</colgroup>
				<tr>
					<th>도착지</th>
					<td>
						<select id="regionList">
							<option value=''>선택하세요</option>
						</select>
					</td>
					<th>
						성별
					</th>
					<td>
						<select id="sexInfo">
							<option value="상관없음">상관없음</option>
							<option value="남자만">남자만</option>
							<option value="여자만">여자만</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>인원수</th>
					<td>
						<select id="numOfUsers">
							<option value="상관없음">상관없음</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
						</select>
					</td>
					<th>차량</th>
					<td>
						<select id="vehicle">
							<option value="카풀"> 카풀 </option>
							<option value="택시"> 택시 </option>
							<option value="KTX"> KTX </option>
						</select>
					</td>
				</tr>
				<tr>
					<th>비용</th>
					<td>
						<select id="fareOption">
							<option value="나눠서 분담">나눠서분담</option>
							<option value="협의">협의</option>
							<option value="본인부담">본인부담</option>
						</select>
					</td>
					<th>반복</th>
					<td>
						<select id="repeat">
							<option value="반복안함">반복안함</option>
							<option value="매일">매일</option>
							<option value="매주">매주</option>
							<option value="매월">매월</option>
						</select>
					</td>
				</tr>
			</table>
		</div>

		<div class="btnRegister" onclick="insertPost();">등록하기</div>
	</div>
	
</body>
</html>
