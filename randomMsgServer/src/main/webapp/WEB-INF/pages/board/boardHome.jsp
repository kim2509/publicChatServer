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
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/board.css" />


<script language="javascript">
		
</script>

</head>
<body>

	<div id="wrapper" style="padding-bottom:10px;">

<%
	if ( "Y".equals( isApp ) )
	{
%>
		<div class="titleDiv">
			<span class="title">자유게시판</span>
		</div>
	
<%		
	}
%>	
		
		<div id="menu">
			<div id="navBack">&lt; 자유게시판</div>
			<div id="btnNew">글쓰기</div>
			<div id="btnNoti">공지</div>
		</div>
		
		<div id="postContainerDiv">
			<ul>
				<li>
					<div id="commentCount">35</div>
					<div id="postDiv">
						<span id="noti">공지</span>그네는 너무 뻔뻔하다. 어찌 그 자리에 계속 있을 생각을 할까?
					</div>
					<div id="postInfo">
						<span>의식곤란</span>|<span>15.06.23</span>|<span>36,319</span>
					</div>
				</li>
				<li>
					<div id="commentCount"> 5</div>
					<div id="postDiv">
						후후 하루만에 완성해부렀고마. 점점 늘어만 가는 퍼블리싱
					</div>
					<div id="postInfo">
						<span>대용</span>|<span>15.06.23</span>|<span>36,319</span>
					</div>
				</li>
			</ul>
		</div>
	</div>

	
	
</body>
</html>