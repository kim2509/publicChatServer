<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<%
	User user = (User) request.getAttribute("user");
	String eventSeq = request.getAttribute("eventSeq").toString();
	String pushNo = request.getAttribute("pushNo").toString();
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
				
				$.ajax({
					url : "eventInput.do",
			        type: "post",
			        contentType: "application/json",
			        data : JSON.stringify({ "phoneNo" : document.fm.phoneNo.value, 
			        	"eventSeq":document.fm.eventSeq.value , "pushNo":document.fm.pushNo.value }),
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
			//alert('ready');
		});
		
	</script>
</head>
<body>

<div id="wrapper">
	
	<div id="desc" style="text-align:center;">

		<div id="title">축하드립니다! 이벤트에 당첨되셨습니다.</div>
		<div id="promotionImg">
			<img src="<%= Constants.IMAGE_PATH %>/emart5000.png"/>
		</div>
	
		<div id="subTitle" style="margin-top:20px;font-weight:bold;">축하드립니다. 이마트 상품권(5천원권)에 <br/>당첨되셨습니다.</div>
	
		<form method="post" name="fm" action="event1Result.jsp">
		<input type="hidden" name="phoneNo" value="" />
		<input type="hidden" name="eventSeq" value="<%= eventSeq %>" />
		<input type="hidden" name="pushNo" value="<%= pushNo %>" />
		
		<div id="input">
		<div style="margin-bottom:10px;">상품권은 MMS 로 발송되며,<br/>발송후 서버에서 삭제처리됩니다.<br/><br/><br/>전송받을 휴대번호를 아래에 입력해 주십시오.</div>
		
		<select name="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select>
		
		<input type="text" name="phone2" size="4" maxlength="4"/> - 
		<input type="text" name="phone3" size="4" maxlength="4"/>
		
		<div style="margin-top:30px;"><input type="button" value="보내기" onclick="applyRequest();"/></div>

		</div>

		</form>
	</div>
	
	<div id="result" style="display:none;text-align:center">접수가 완료되었습니다.<br/><br/>24시간이내에 발송처리될 예정입니다.<br/><br/>감사합니다.</div>
</div>

</body>
</html>
