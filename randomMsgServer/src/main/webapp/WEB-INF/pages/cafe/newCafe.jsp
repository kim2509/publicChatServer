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
<title>카페 생성</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafe.css" />

<script language="javascript">

	isApp = '<%= isApp %>';
	
	function makeCafe()
	{
		try
		{
			if ( $('#cafeName').val() == '' )
			{
				notice('카페이름을 입력해 주십시오.');
				return;
			}
			
			if ( isAlphaNumberKorOnly($('#cafeName').val()) == false )
			{
				notice("한글, 영문, 숫자만 입력할 수 있습니다.");
			 	return;
			}
			
			if ( $('#cafeID').val() == '' )
			{
				notice('카페 아이디를 입력해 주십시오.');
				return;
			}
			
			if ( isAlphaNumberOnly($('#cafeID').val()) == false )
			{
				notice("숫자와 영문만 입력할 수 있습니다.");
			 	return;
			}
			
			if ( $('#agree1').is(":checked") == false )
			{
				notice('이근처 카페 약관에 동의하여 주십시오.');
				return;
			}
			
			if ( $('#agree2').is(":checked") == false )
			{
				notice('개인정보 보호의무에 동의하여 주십시오.');
				return;
			}
			
			var param = {"cafeName": $('#cafeName').val(), "cafeID" : $('#cafeID').val() };
			ajaxRequest('POST', '/nearhere/cafe/makeCafeAjax.do', param , onResult );	
		}
		catch( ex )
		{
			notice( ex.message );
		}
	}
	
	function onResult( result )
	{
		try
		{
			console.log( JSON.stringify( result ) );
			
			if ( result.resCode != '0000' )
			{
				notice( result.resMsg );
				return;
			}
			
			var url ='<%= Constants.getServerURL() %>/cafe/newCafeResult.do?cafeID=' + result.data.cafeID 
					+ '&cafeName=' + encodeURIComponent(result.data.cafeName);
			
			if ( isApp == 'Y' )
				document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + url + '';
			else
				document.location.href=url;
		}
		catch( ex )
		{
			notice( ex.message );
		}
	}
	
</script>

</head>
<body>

	<div id="wrapper">
		
		<div id="header">
			<div id="btnCancel">취소</div>
			<div id="btnSubmit">완료</div>
			카페 만들기
		</div>
		
		<div id="content">
		
			<div class="section">
				<p class="title">카페이름</p>
			
				<span class="box_use">
					<input type="text" id="cafeName" class="inp_use" placeholder="카페이름" value="">
				</span>
				<p class="notice">한글, 영문, 숫자만 입력해주세요.</p>
				
			</div>
			
			<div class="hr"></div>
			
			<div class="section">
			
				<p>카페아이디</p>
			
				<span class="box_use">
					<span>
						<input type="text" id="cafeID" class="inp_use" placeholder="카페아이디" value="">
					</span>
				</span>
				
				<ul id="cafe_terms">
					<li>
						<a href="/nearhere/cafe/terms.do?name=normal&version=1.0">보기</a>
						<input type="checkbox" id="agree1"/>
						<label for="agree1">이근처카페 약관에 동의</label><br/>
					</li>
					<li>
						<a href="/nearhere/cafe/terms.do?name=personal_info&version=1.0">보기</a>
						<input type="checkbox" id="agree2"/>
						<label for="agree2">개인정보 보호의무에 동의</label>
					</li>
				</ul>
			
				<div id="btnDiv">
					<input type="button" class="btnMake" value="카페 만들기" onclick="makeCafe();"/>
				</div>
				
			</div>
			
		</div>
		
			
	</div>

	
	
</body>
</html>