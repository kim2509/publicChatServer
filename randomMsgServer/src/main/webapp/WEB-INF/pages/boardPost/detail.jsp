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
	if ( !"Y".equals( isApp ) )
	{
%>
		<div class="titleDiv">
			<span class="title">자유게시판</span>
		</div>
	
<%		
	}
%>	
		
		<div id="postHeaderDiv">
			<div id="postTitle">3월이 왔네요...</div>
			
			<div id="postInfo">
				<span>대용</span>|<span>15.06.23</span>|<span>36,319</span>
			</div>
		</div>
		<div id="postBodyDiv">
			만남의 시간을 가지려고 하였지만 회원들의 개인사정으로 무기한 연기합니다. 개인적으로 코트에 나와서 운동하세요. 이목사님과 구성모씨 은빛님은 다음주중에 호출하면 늦은시간이라도 나오세요.
		</div>
		<div id="postReplyDiv">
			<ul id="replyBtns">
				<li>댓글 <span>2</span></li>
				<li>댓글쓰기</li>
			</ul>
			<ul id="replies">
				<li>
					<div><span>개폼15년째</span><span>13.03.01</span></div>
					<div>잘 하셨어요. 계속 성원과 관심 주시고 항상 체력관리 잘 하셔서 만나면 게임 한번 하시죠 ㅎㅎ</div>
				</li>
				<li>
					<div><span>은빛</span><span>13.03.02</span></div>
					<div>네. 자주 방문하겠습니다.</div>
				</li>
			</ul>
			<div id="goReply">댓글 전체보기</div>
		</div>
		
	</div>

	
	
</body>
</html>