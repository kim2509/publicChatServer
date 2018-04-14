<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>비밀번호 변경</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=4"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/registerNewMember.css?v=2" />

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		Handlebars.registerHelper('if_eq', function(a, b, opts) {
		    if(a == b) // Or === depending on your needs
		        return opts.fn(this);
		    else
		        return opts.inverse(this);
		});
		
	});

	function changePassword()
	{
		var oldPassword = $('#oldPassword').val();
		var newPassword = $('#newPassword').val();
		var newPasswordConfirm = $('#newPasswordConfirm').val();
		
		if ( oldPassword == '' )
		{
			notice('현재의 비밀번호를 입력해 주십시오.');
			$('#oldPassword').focus();
			return;
		}
		
		if ( newPassword == '' )
		{
			notice('새 비밀번호를 입력해 주십시오.');
			$('#newPassword').focus();
			return;
		}
		
		if ( newPasswordConfirm == '' )
		{
			notice('비밀번호 확인란을 입력해 주십시오.');
			$('#newPasswordConfirm').focus();
			return;
		}
		
		if ( newPassword != newPasswordConfirm )
		{
			notice('비밀번호와 비밀번호 확인란의 값이 일치하지 않습니다.');
			$('#newPasswordConfirm').focus();
			return;
		}
		
		var param = { "oldPassword": oldPassword, "newPassword": newPassword };
		ajaxRequest('POST', '/nearhere/user/changePasswordAjax.do', param , onResult );
	}
	
	function onResult( result )
	{
		if ( result == null )
		{
			notice('처리결과가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
			return;
		}
		else if ( result != null && result.resCode != '0000')
		{
			notice( result.resMsg );
		}
		else
		{
			$('#inputDiv').hide();
			$('#resultDiv').show();
		}
	}
	
	function closeActivity(){
		
		try {
		
			if ( isApp == 'Y' )
			{
				finishActivity();
			}
			
		} catch ( ex ){
			alert(ex.message);
		}
	}

</script>

	
</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">비밀번호 변경</div>
			<div id="refresh" onclick="document.location.reload()">
				<img src="<%=Constants.IMAGE_PATH%>/refresh.png" width="24" height="24">
			</div>
		</div>
		
		<div id="container">
		
			<div id="inputDiv">
			
				<p class="subTitle paddingLR10 paddingTop10">현재 비밀번호</p>
				
				<div class="inputContainer marginLR10 marginB20">
					<input type="password" id="oldPassword" class="inputTxt" placeholder="비밀번호를 입력해 주십시오." value="" />
				</div>
				
				<p class="subTitle paddingLR10 paddingTop10">새로운 비밀번호</p>
				
				<div class="inputContainer marginLR10 marginB20">
					<input type="password" id="newPassword" class="inputTxt" placeholder="비밀번호를 입력해 주십시오." value="" />
				</div>
				
				<p class="subTitle paddingLR10 paddingTop10">비밀번호 확인</p>
				
				<div class="inputContainer marginLR10 marginB20">
					<input type="password" id="newPasswordConfirm" class="inputTxt" placeholder="비밀번호를 입력해 주십시오." value="" />
				</div>
				
				<div class="upperLine">
					
					<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
						<div class="wideBtn btnBG" id="btnSubmit" onclick="changePassword();">변경하기</div>
					</div>
					
				</div>
			
			</div>
			
			<div id="resultDiv" style="display:none;">
			
				<div id="guide" style="text-align:center;height:150px;padding-top:50px;margin-left:10px;margin-right:10px;">
					비밀번호가 변경되었습니다.
				</div>
				
				<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
					<div class="wideBtn btnBG" onclick="closeActivity();">닫기</div>
				</div>
			
			</div>
			
		</div>
					
	</div>
	
</body>
</html>