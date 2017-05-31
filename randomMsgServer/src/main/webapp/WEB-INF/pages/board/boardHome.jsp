<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String cafeID = request.getParameter("cafeID");

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
<title>게시판</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/board.css?v=2" />


<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var boardNo = '<%= boardNo %>';
	var boardName = '<%= boardName %>';

	function goPostDetail( postNo )
	{
		//var titleUrlEncoded = encodeURIComponent( title );
		//if ( isApp == 'Y' )
			//document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		
		document.location.href="/nearhere/cafe/boardPost/detail/" + postNo + "?boardName=" + encodeURIComponent(boardName);
	}
	
	function goNewBoardPost()
	{
		var url = '<%= Constants.getServerURL() + "/boardPost/newBoardPost.do" %>?cafeID=' + cafeID + '&boardNo=' + boardNo;

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
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
			<div id="btnNew" onclick="goNewBoardPost();">글쓰기</div>
			<div id="btnNoti">공지</div>
		</div>
		
		<div id="postContainerDiv">
		
			<% if ( boardPostList != null && boardPostList.size() > 0 ) { %>
			<ul>
				<% for ( int i = 0; i < boardPostList.size(); i++ ) { 
					
					HashMap boardPost = boardPostList.get(i);
					String postNo = Util.getStringFromHash(boardPost, "postNo");
					String postTitle = Util.getStringFromHash(boardPost, "title");
					String noticeYN = Util.getStringFromHash(boardPost, "noticeYN");
					String userName = Util.getStringFromHash(boardPost, "userName");
					String readCount = Util.getStringFromHash(boardPost, "readCount");
					String replyCount = Util.getStringFromHash(boardPost, "replyCount");
					String createdDate = Util.getStringFromHash(boardPost, "createdDate");
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