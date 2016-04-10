<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>
<%@ page import="java.util.*"%>

<%

	List<HashMap> regionList = (List<HashMap>) request.getAttribute("regionList");

	Post post = null;
	String postID = "";
	String message = "";
	String fromLatitude = "";
	String fromLongitude = "";
	String fromAddress = "";
	String toLatitude = "";
	String toLongitude = "";
	String toAddress = "";
	String departureDate = "";
	String departureTime = "";
	String region = "";
	String userID = "";
	String sexInfo = "";
	String numOfUsers = "";
	String vehicle = "";
	String fareOption = "";
	String repetitiveYN = "";
	String status = "";
	
	if ( request.getAttribute("postDetail") != null )
	{
		post = (Post) request.getAttribute("postDetail");
		postID = post.getPostID();
		message = post.getMessage();
		fromLatitude = post.getFromLatitude();
		fromLongitude = post.getFromLongitude();
		fromAddress = post.getFromAddress();
		toLatitude = post.getLatitude();
		toLongitude = post.getLongitude();
		toAddress = post.getToAddress();
		departureDate = post.getDepartureDate();
		departureTime = post.getDepartureTime();
		region = post.getRegion();
		userID = post.getUser().getUserID();
		sexInfo = post.getSexInfo();
		numOfUsers = post.getNumOfUsers();
		vehicle = post.getVehicle();
		fareOption = post.getFareOption();
		repetitiveYN = post.getRepetitiveYN();
		status = post.getStatus();
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

		requestData.postID = '<%= postID %>';
		requestData.userID = '<%= userID %>';
		requestData.message = '<%= message %>';
		
		requestData.fromLatitude = '<%= fromLatitude %>';
		requestData.fromLongitude = '<%= fromLongitude %>';
		requestData.fromAddress = '<%= fromAddress %>';
		
		requestData.toLatitude = '<%= toLatitude %>';
		requestData.toLongitude = '<%= toLongitude %>';
		requestData.toAddress = '<%= toAddress %>';
		
		requestData.departureDate = '<%= departureDate %>';
		requestData.departureTime = '<%= departureTime %>';
		
		requestData.region = '<%= region %>';
		requestData.sexInfo = '<%= sexInfo %>';
		requestData.numOfUsers = '<%= numOfUsers %>';
		requestData.vehicle = '<%= vehicle %>';
		requestData.fareOption = '<%= fareOption %>';
		requestData.repetitiveYN = '<%= repetitiveYN %>';
		requestData.status = '<%= status %>';
		
		if ( requestData.message.length > 0 )
			$('#message').val( requestData.message );
		
		if ( requestData.fromAddress.length > 0 )
			$('.departure').html( requestData.fromAddress );
		
		if ( requestData.toAddress.length > 0 )
			$('.destination').html( requestData.toAddress );
		
		if ( requestData.departureDate.length > 0 )
			$('.departureDate').html( requestData.departureDate );
		
		if ( requestData.departureTime.length > 0 )
			$('.departureTime').html( requestData.departureTime );
		
		if ( requestData.region.length > 0 )
			$('#regionList').val( requestData.region );
		
		if ( requestData.sexInfo.length > 0 )
			$('#sexInfo').val( requestData.sexInfo );
		
		if ( requestData.numOfUsers.length > 0 )
			$('#numOfUsers').val( requestData.numOfUsers );
		
		if ( requestData.vehicle.length > 0 )
			$('#vehicle').val( requestData.vehicle );
		
		if ( requestData.fareOption.length > 0 )
			$('#fareOption').val( requestData.fareOption );
		
		if ( requestData.status.length > 0 )
			$('#status').val( requestData.status );

		if ( requestData.repetitiveYN.length > 0 )
			$('#repetitiveYN').val( requestData.repetitiveYN );
		
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
		
		if (requestData.departureTime == null || requestData.departureTime.length < 1 )
		{
			showOKDialog('경고', '출발시간을 지정해 주십시오.');
			return false;
		}
		
		if (requestData.region == null || requestData.region.length < 1 )
		{
			showOKDialog('경고', '도착지역을 선택해 주십시오.');
			return false;
		}
		
		return true;
	}
	
	function insertOrModifyPost()
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
			requestData.repetitiveYN = $('#repetitiveYN').val();
			requestData.status = $('#status').val();
		
			if ( validateInput() == false ) return;
			
			var url = '/nearhere/taxi/insertPostAjax.do';
			
			if ( requestData.postID != null && requestData.postID.length > 0 )
				url = '/nearhere/taxi/modifyPostAjax.do';
			
			$('#wrapper').find('*').attr('disabled',true);
			$('.btnRegister').hide();
			$('#loading').show();
				
			jQuery.ajax({
				type : "POST",
				url : url,
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
					$('#wrapper').find('*').attr('disabled',false);
					$('.btnRegister').show();
					$('#loading').hide();
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
<%
							for ( int i = 0; i < regionList.size(); i++ )
							{
%>
							<option value="<%= regionList.get(i).get("regionNo") %>"><%= regionList.get(i).get("regionName") %></option>
<%								
							}
%>							
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
							<option value="1명">1명</option>
							<option value="2명">2명</option>
							<option value="3명">3명</option>
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
						<select id="repetitiveYN">
							<option value="N">반복안함</option>
							<option value="Y">반복함</option>
						</select>
					</td>
				</tr>
<%
		if ( !Util.isEmptyString(postID) )
		{
%>
				<tr>
					<th>상태</th>
					<td>
						<select id="status">
							<option value="진행중">진행중</option>
							<option value="종료됨">종료됨</option>
						</select>
					</td>
					<th></th>
					<td>
						
					</td>
				</tr>
<%			
		}
%>				
				
			</table>
		</div>

<%
		if ( Util.isEmptyString(postID) )
		{
%>
		<div class="btnRegister" onclick="insertOrModifyPost();">등록하기</div>
<%			
		}
		else
		{
%>
		<div class="btnRegister" onclick="insertOrModifyPost();">수정하기</div>
<%			
		}
%>
	
		<div id="loading" style="display:none">
			전송중입니다.
		</div>	
	</div>
	
</body>
</html>
