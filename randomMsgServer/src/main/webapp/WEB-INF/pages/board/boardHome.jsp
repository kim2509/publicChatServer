<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	List<HashMap> boardPostList = (List<HashMap>) request.getAttribute("boardPostList");
	
	String boardNo = "";
	String boardName = "";
	
	HashMap boardInfo = (HashMap) request.getAttribute("boardInfo");
	
	if ( boardInfo != null )
	{
		boardNo = boardInfo.get("boardNo").toString();	
		boardName = boardInfo.get("boardName").toString();
	}
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
	href="<%=Constants.CSS_PATH%>/board.css?v=2" />


<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var boardName = '<%= boardName %>';

	function goPostDetail( postNo )
	{
		//var titleUrlEncoded = encodeURIComponent( title );
		//if ( isApp == 'Y' )
			//document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		
		document.location.href="/nearhere/cafe/boardPost/detail/" + postNo + "?boardName=" + encodeURIComponent(boardName);
	}
	
</script>

</head>
<body>

	<div id="wrapper" style="padding-bottom:10px;">

		<div class="titleDiv">
			<span class="title"><%= boardName %></span>
		</div>
	
		<div id="menu">
			<div id="navBack">&lt; <%= boardName %></div>
			<div id="btnNew">글쓰기</div>
			<div id="btnNoti">공지</div>
		</div>
		
		<div id="postContainerDiv">
		
			<% if ( boardPostList != null && boardPostList.size() > 0 ) { %>
			<ul>
				<% for ( int i = 0; i < boardPostList.size(); i++ ) { 
					String postNo = boardPostList.get(i).get("postNo").toString();
					String postTitle = boardPostList.get(i).get("title").toString();
					String noticeYN = boardPostList.get(i).get("noticeYN").toString();
					String userName = boardPostList.get(i).get("userName").toString();
					String readCount = boardPostList.get(i).get("readCount").toString();
					String replyCount = boardPostList.get(i).get("replyCount").toString();
					String createdDate = boardPostList.get(i).get("createdDate").toString();
					Date dtCreatedDate = Util.getDateFromString(createdDate, "yyyy-MM-dd HH:mm:ss");
				%>
				<li onclick="goPostDetail('<%= postNo %>');">
				
					<% if ( Integer.parseInt(replyCount) > 0 ) { %>
					<div id="commentCount"><%= replyCount %></div>
					<% } %>
					
					<div id="postDiv">
						<% if ("Y".equals( noticeYN )) { %>
						<span id="noti">공지</span>
						<% } %>
						
						<%= postTitle %>
					</div>
					<div id="postInfo">
						<span><%= userName %></span>|<span><%= Util.getDateStringFromDate(dtCreatedDate, "yy.MM.dd") %></span>|<span><%= Util.getNumberWithComma(readCount) %></span>
					</div>
				</li>
				<% } %>
			</ul>
			<% } else { %>
			
			<div id="emptyDiv">게시글이 존재하지 않습니다.</div>
			
			<% } %>
		</div>
	</div>

	
	
</body>
</html>