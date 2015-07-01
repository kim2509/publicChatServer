<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<%
	User user = (User) request.getAttribute("user");
	String eventSeq = request.getAttribute("eventSeq").toString();
	String pushNo = request.getAttribute("pushNo").toString();
	String alreadyAppliedYN = request.getAttribute("alreadyAppliedYN").toString();
	
	String mobileNo1 = "";
	String mobileNo2 = "";
	String mobileNo3 = "";
	
	if ( !Util.isEmptyString( user.getMobileNo() ) )
	{
		String mobileNo = user.getMobileNo().replaceAll("\\D+","");;
		
		if ( mobileNo.length() >= 3 )
			mobileNo1 = user.getMobileNo().substring(0,3);
		if ( mobileNo.length() >= 7 )
			mobileNo2 = user.getMobileNo().substring(3,7);
		if ( mobileNo.length() >= 11 )
			mobileNo3 = user.getMobileNo().substring(7,11);
	}
%>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	
	<style type="text/css">
		#title{font-weight:bold;text-align:center;font-size:17px;}
		#subTitle{text-align:center;}
		#content{margin-top:40px;text-indent:-1em;margin-left:15px;}
		#detail{padding-left:20px;padding-top:10px;}
		#promotionImg{margin-top:20px;text-align:center}
		
	</style>
	
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>
	
	<script language="javascript">
	
		var alreadyAppliedYN = '<%= alreadyAppliedYN %>';
		
		function applyRequest()
		{
			try
			{
				var phone1 = document.fm.phone1.value;
				var phone2 = document.fm.phone2.value;
				var phone3 = document.fm.phone3.value;
				document.fm.phoneNo.value = phone1 + '-' + phone2 + '-' + phone3;
				
				if ( phone2.length == 0 )
				{
					alert('전화번호가 올바르지 않습니다.\n다시 입력해 주십시오.');
					return;	
				}
				
				if ( $('input[name=prize]:checked', '#fm').val() == '' ||  $('input[name=prize]:checked', '#fm').val() == undefined )
				{
					alert('상품을 선택해 주십시오.');
					return;
				}
				
				var data = { "phoneNo" : document.fm.phoneNo.value, "userID":document.fm.userID.value, 
						"eventSeq":document.fm.eventSeq.value , "pushNo":document.fm.pushNo.value , 
						"param1":$('input[name=prize]:checked').val() };
				
				if ( confirm('접수 하시겠습니까?') == false ) return;
				
				$.ajax({
					url : "eventApply.do",
			        type: "post",
			        contentType: "application/json",
			        data : JSON.stringify( data ),
			        success : function(responseData){
			        	
			            if ( responseData.resCode == '0000' )
			            {
			            	$('#desc').hide();
			            	$('#result').show();
			            }
			        }
			    });
			}
			catch( ex )
			{
				alert( ex.message );
			}
		}
		
		jQuery(document).ready(function(){
			$('#phone1').val('<%= mobileNo1 %>');
			
			/*
			var text1 = 'Two';
			$("select option").filter(function() {
			    //may want to use $.trim in here
			    return $(this).text() == text1; 
			}).prop('selected', true);
			*/
		});
		
	</script>
</head>
<body>

<div id="wrapper">
	
	<div id="desc" style="text-align:center;">

		<form method="post" name="fm" id="fm" action="event1Result.jsp">

<%
	if ("N".equals( alreadyAppliedYN ) )
	{
%>		
		<div id="title">축하드립니다! 이벤트에 당첨되셨습니다.</div>
		
		<div id="promotionImg">
			<table style="width:100%">
				<tr>
					<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/culturecoupon5000.jpg" width="80%"/></td>
				</tr>
				<tr>
					<td style="width:50%;text-align:center;font-size:12px;vertical-align: center;" >
						<input type="radio" name="prize" value="1" />문화상품권 5천원</td>
				</tr>
				<tr>
					<td style="text-align:center;padding-top:10px;"><img src="<%= Constants.IMAGE_PATH %>/starbucks.jpg" width="50%"/></td>
				</tr>
				<tr>
					<td style="width:50%;text-align:center;font-size:12px;vertical-align: center;" >
						<input type="radio" name="prize" value="2" />스타벅스 아메리카노</td>
				</tr>
					<td colspan="2" style="width:50%;text-align:center;font-size:12px;padding-top:20px;" >&lt;위 2개중 택1&gt;</td>
				</tr>
			</table>
		</div>
	
		<div id="subTitle" style="margin-top:20px;font-weight:bold;">원하는 상품을 선택해 주십시오.</div>
	
		
		<input type="hidden" name="phoneNo" value="" />
		<input type="hidden" name="eventSeq" value="<%= eventSeq %>" />
		<input type="hidden" name="pushNo" value="<%= pushNo %>" />
		<input type="hidden" name="userID" value="<%= user.getUserID() %>" />

		<div style="margin-bottom:10px;"><br/>상품권은 MMS 로 발송됩니다.<br/><br/><br/>전송받을 휴대번호를 아래에 입력해 주십시오.</div>
		
		<select name="phone1" id="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select>
		
		<input type="text" name="phone2" id="phone2" size="4" maxlength="4" value="<%= mobileNo2 %>"/> - 
		<input type="text" name="phone3" id="phone3" size="4" maxlength="4" value="<%= mobileNo3 %>"/>
		<input type="button" value="보내기" onclick="applyRequest();"/>
		
		<br/><br/>
		<div style="margin-bottom:10px;">내 정보에 휴대폰번호를 등록해 두었으면<br/>자동으로 입력됩니다.</div>
		
<%
	} else {
%>		

		<div id="title" style="margin-top:30px;">이벤트 신청이 완료되었습니다.<br/>이용해 주셔서 감사합니다.</div>

<%
	}
%>
		</form>
	</div>
	
	<div id="result" style="text-align:center;display:none;">
		<div id="title" style="margin-top:30px;">이벤트 신청이 완료되었습니다.<br/>이용해 주셔서 감사합니다.</div>
	</div>
</div>

</body>
</html>
