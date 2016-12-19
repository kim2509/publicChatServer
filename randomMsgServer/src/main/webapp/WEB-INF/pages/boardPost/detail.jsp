<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String boardName = request.getParameter("boardName");
	HashMap postInfo = (HashMap) request.getAttribute("postInfo");
	List<HashMap> postReplyList = (List<HashMap>) request.getAttribute("postReplyList");
	
	String readCount = postInfo.get("readCount").toString();
	String createdDate = postInfo.get("createdDate").toString();
	Date dtCreatedDate = Util.getDateFromString(createdDate, "yyyy-MM-dd HH:mm:ss");
	
	String replyCount = postInfo.get("replyCount").toString();
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

		<div id="boardNavi">
			<div id="naviTitle">&lt; <%= boardName %></div>
		</div>
		
		<div id="postHeaderDiv">
			<div id="postTitle"><%= postInfo.get("title") %></div>
			
			<div id="postInfo">
				<span>대용</span>|<span><%= Util.getDateStringFromDate(dtCreatedDate, "yy.MM.dd") %></span>|<span><%= Util.getNumberWithComma(readCount) %></span>
			</div>
			
			<div id="btns">
				<div id="listBtn">목록</div>
			</div>
		</div>
		<div id="postBodyDiv">
			<%= postInfo.get("content") %>
		</div>
		<div id="postReplyDiv">
			<ul id="replyBtns">
				<li>댓글 <span><%= replyCount %></span></li>
				<li>댓글쓰기</li>
			</ul>
			
			<% if ( Integer.parseInt(replyCount) > 0 ) { %>
			<ul id="replies">
			
				<% for ( int i = 0; i < postReplyList.size(); i++ ) { 
					HashMap postReply = postReplyList.get(i);
					String createdDate2 = postReply.get("createdDate").toString();
					Date dtCreatedDate2 = Util.getDateFromString(createdDate2, "yyyy-MM-dd HH:mm:ss");
				%>
				<li>
					<div id="replyInfo"><span><%= postReply.get("userName") %></span>|<span><%= Util.getDateStringFromDate(dtCreatedDate2, "yy.MM.dd") %></span></div>
					<div><%= postReply.get("content") %></div>
				</li>
				<% } %>
			</ul>
			
			<% if ( Integer.parseInt(replyCount) > postReplyList.size() ) { %>
			<div id="goReply">댓글 더보기</div>
			<% } %>
			
			<% } %>
		</div>
		
	</div>

	
	
</body>
</html>