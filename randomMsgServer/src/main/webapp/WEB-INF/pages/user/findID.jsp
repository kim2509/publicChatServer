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
<title>아이디 찾기</title>


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
	

	function findID()
	{
		var userName = $('#userName').val();
		var email = $('#email').val();
		
		if ( userName == '' )
		{
			notice('사용자 이름을 입력해 주십시오.');
			$('#userName').focus();
			return;
		}
		
		if ( email == '' )
		{
			notice('이메일을 입력해 주십시오.');
			$('#email').focus();
			return;
		}
		
		var param = { "userName": userName, "email": email };
		ajaxRequest('POST', '/nearhere/user/findIDAjax.do', param , onResult );
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
			if ( result.data != null && result.data.userInfo != null ){
			
				var userInfo = result.data.userInfo;
				$('#spUserID').html( userInfo.userID );
				
			} else {
				$('#resultDiv #guide').html('조건에 맞는 사용자가 존재하지 않습니다.<br/>다시 조회해 주시기 바랍니다.')
			}
			
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
			<div class="title">아이디 찾기</div>
			<div id="refresh" onclick="document.location.reload()">
				<img src="<%=Constants.IMAGE_PATH%>/refresh.png" width="24" height="24">
			</div>
		</div>
		
		<div id="container">
		
			<div id="inputDiv">
			
				<div>
					<p class="subTitle paddingLR10 paddingTop10 upperLine">사용자 이름</p>
				
					<div class="inputContainer marginLR10 marginB10">
						<input type="text" id="userName" class="inputTxt" placeholder="사용자 이름(예, 홍길동)" value="" />
					</div>
					
					<p class="paddingLR10 marginB10" style="font-size:12px;color:gray;">회원가입시 입력한 이름을 입력해주세요.</p>
					
				</div>
				
				<div>
					<p class="subTitle paddingLR10 paddingTop10 upperLine">이메일</p>
				
					<div class="inputContainer marginLR10 marginB10">
						<input type="text" id="email" class="inputTxt" placeholder="이메일" value="" />
					</div>
				    
				    <p class="paddingLR10 marginB10" style="font-size:12px;color:gray;">회원가입시 입력한 이메일을 입력해주세요.</p>
				    
				</div>
				
				<div class="upperLine">
					
					<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
					
						<div class="wideBtn btnBG" onclick="findID();">아이디 찾기</div>
						
					</div>
					
				</div>
			
			</div>
			
			<div id="resultDiv" style="display:none;">
			
				<div id="guide" style="text-align:center;height:100px;padding-top:80px;">
					조회하신 회원님의 아이디는
					<span id="spUserID"></span>
					입니다.
				</div>
				
				<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
					
					<div class="wideBtn btnBG" onclick="closeActivity();">닫기</div>
					
				</div>
			
			</div>
			
		</div>
					
	</div>
	
</body>
</html>