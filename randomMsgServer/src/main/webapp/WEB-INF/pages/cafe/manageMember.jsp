<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String cafeID = request.getParameter("cafeID");
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

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage_member.css?v=" />

<script language="javascript">

var isApp = '<%= isApp %>';

</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">회원 관리</div>
		</div>
		
		<div id="headerInfo">
			회원 전체 50명
		</div>
		
		<div id="container">
		
			<ul id="memberList">
				<li>
					<div id="imgProfile">
						<img src="http://www.hereby.co.kr/thumbnail//user27.png" width=80 height=80/>
					</div>
					<div id="memberType">카페 주인</div>
					<div id="memberInfo">
						<div>대용</div>
					</div>
					<div id="manageBtns">
						<div>
							<input type="button" value="운영진임명" />
							<input type="button" value="운영진해제" />
							<input type="button" value="탈퇴" />
						</div>
					</div>
				</li>
				<li>
					<div id="imgProfile">
						<img src="http://www.hereby.co.kr/thumbnail//user27.png" width=80 height=80/>
					</div>
					<div id="memberType">카페 주인</div>
					<div id="memberInfo">
						<div>대용</div>
					</div>
					<div id="manageBtns">
						<div>
							<input type="button" value="운영진임명" />
							<input type="button" value="운영진해제" />
							<input type="button" value="탈퇴" />
						</div>
					</div>
				</li>
			</ul>
			
			<div id="pagingInfo" style="text-align:center;font-weight:bold;">
				<b><a href="javascript:void(0)" onclick="goPage(1);" class="pageSelected">1</a></b>
				<a href="javascript:void(0)" onclick="goPage(2);">2</a>
				<a href="javascript:void(0)" onclick="goPage(3);">3</a>
				<a href="javascript:void(0)" onclick="goPage(4);">4</a>
				<a href="javascript:void(0)" onclick="goPage(5);">5</a>
				<a href="javascript:void(0)" onclick="goPage(6);">&gt;</a>
				<a href="javascript:void(0)" onclick="goPage(171);">&gt;&gt;</a>
			</div>
		</div>
					
	</div>
	
</body>
</html>