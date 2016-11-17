<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafe.css" />

<script language="javascript">
		
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
					<input type="text" id="grpname" class="inp_use" placeholder="카페이름" value="">
					<span class="txt_byte"><span id="grpnameCount">0</span>/30</span>
				</span>
				<p class="notice">한글, 영문, 숫자, 기호만 입력해주세요.</p>
				
			</div>
			
			<div class="hr"></div>
			
			<div class="section">
			
				<p>카페위치</p>
			
				<span class="box_use">
					<input type="text" id="grpname" class="inp_use" placeholder="위치검색" value="">
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
			
			</div>
			
		</div>
		
			
	</div>

	
	
</body>
</html>