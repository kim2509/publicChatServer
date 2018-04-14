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
<title>게시글 작성</title>


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
	

	function registerMember()
	{
		var userID = $('#userID').val();
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		var userName = $('#userName').val();
		var sex = $('#sex').val();
		var email = $('#email').val();
		var mobile = $('#mobile').val();
		
		if ( userID == '' )
		{
			notice('아이디를 입력해 주십시오.');
			$('#userID').focus();
			return;
		}
		
		if ( password1 == '' )
		{
			notice('비밀번호를 입력해 주십시오.');
			$('#password1').focus();
			return;
		}
		
		if ( password2 == '' )
		{
			notice('비밀번호 확인란을 입력해 주십시오.');
			$('#password2').focus();
			return;
		}
		
		if ( password1 != password2 )
		{
			notice('비밀번호 확인값이 비밀번호와 일치하지 않습니다.');
			$('#password2').focus();
			return;
		}
		
		if ( userName == '' )
		{
			notice('사용자 이름을 입력해 주십시오.');
			$('#userName').focus();
			return;
		}
		
		if ( sex == '' )
		{
			notice('성별을 선택해 주십시오.');
			return;
		}
		
		if ( email == '' )
		{
			notice('이메일 주소를 입력해 주십시오.\r\n(아이디 비번찾기 시 사용됩니다.)');
			$('#userName').focus();
			return;
		}
		
		if ( confirm('회원가입 하시겠습니까?') )
		{
			var param = {"userID": userID, "password": password1, "userName": userName, "sex":sex,
					"email": email, "mobileNo": mobile };
			ajaxRequest('POST', '/nearhere/user/registerMemberAjax.do', param , onSaveResult );
		}
	}
	
	function onSaveResult( result )
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
			alert('회원가입이 완료되었습니다.');
			
			if ( isApp == 'Y' )
			{
				if ( Android && Android != null && typeof Android != 'undefined')
				{
					var param = {"loginUserInfo": result.data, "goMainActivity":"true" };
					return Android.finishActivity2( JSON.stringify( param ) );
				}
			}
		}
	}

</script>

	
</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">회원가입</div>
			<div id="refresh" onclick="document.location.reload()">
				<img src="<%=Constants.IMAGE_PATH%>/refresh.png" width="24" height="24">
			</div>
		</div>
		
		<div id="container">
		
			<p class="subTitle paddingLR10 paddingTop10">아이디</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="userID" class="inputTxt" placeholder="아이디" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">비밀번호</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="password" id="password1" class="inputTxt" placeholder="비밀번호" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">비밀번호 확인</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="password" id="password2" class="inputTxt" placeholder="비밀번호 확인" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">사용자 이름</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="userName" class="inputTxt" placeholder="사용자 이름(예, 홍길동)" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">성별</p>
			
			<div class="marginLR10 marginB20">
				<select name="sex" id="sex" style="padding:5px;width:150px;">
					<option value="">선택하세요.</option>
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">이메일</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="email" class="inputTxt" placeholder="이메일" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">휴대폰 번호(선택)</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="mobile" class="inputTxt" placeholder="휴대폰 번호" value="" />
			</div>
			
			<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
			
				<div class="wideBtn btnBG" onclick="registerMember();">회원가입하기</div>
				
			</div>
		    
		</div>
					
	</div>
	
</body>
</html>