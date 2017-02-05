<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String cafeID = "";
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

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage_board.css?v=1" />

<script language="javascript">

var isApp = '<%= isApp %>';

</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">게시판 관리</div>
		</div>
		
		<div id="container">
		
			<div id="boardList">
				<ul>
					<li>공지사항</li>
					<li>자유게시판</li>
					<li>문의사항</li>
				</ul>
			</div>
		
			<div>
				<div class="inputContainer">
					<input type="text" class="inputTxt" placeholder="게시판 이름" value="" />
				</div>
				
			</div>
		
			<div class="wideBtn btnBG">추가하기</div>
			<div class="wideBtn redBG">삭제하기</div>
		
		</div>
					
	</div>
	
</body>
</html>