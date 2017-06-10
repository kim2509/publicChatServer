<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String cafeID = request.getParameter("cafeID");
	String boardNo = request.getParameter("boardNo");
	String boardName = request.getParameter("boardName");
	HashMap postInfo = (HashMap) request.getAttribute("postInfo");
	String postNo = Util.getStringFromHash(postInfo, "postNo");
	
	List<HashMap> contentList = null;
	if ( request.getAttribute("contentList") != null )
		contentList = (List<HashMap>) request.getAttribute("contentList");
	
	List<HashMap> postReplyList = null;
	if ( request.getAttribute("postReplyList") != null )
		postReplyList = (List<HashMap>) request.getAttribute("postReplyList");
	
	String readCount = postInfo.get("readCount").toString();
	String createdDate = postInfo.get("createdDate").toString();
	Date dtCreatedDate = Util.getDateFromString(createdDate, "yyyy-MM-dd HH:mm:ss");
	
	String replyCount = postInfo.get("replyCount").toString();
	String lastReplyIndex = "0";
	
	String loginUserID = Util.getString( request.getAttribute("loginUserID") );
	
	String ownerYN = Util.getString( request.getAttribute("loginUserID") );
	String memberYN = Util.getString( request.getAttribute("loginUserID") );
	String memberType = Util.getString( request.getAttribute("loginUserID") );
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>게시 글 상세</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/board.css?v=1" />

</head>

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var boardNo = '<%= boardNo %>';
	var postNo = '<%= postNo %>';
	
	var loginUserID = '<%= loginUserID %>';
	var ownerYN = '<%= ownerYN %>';
	var memberYN = '<%= memberYN %>';
	var memberType = '<%= memberType %>';
	
	jQuery(document).ready(function(){
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );	
		Handlebars.registerHelper('displayDeleteButton', displayDeleteButton);
	});
	
	function displayDateFormat( jsonDate )
	{
		var date = new Date(jsonDate);
		return date.format('yy-MM-dd HH:mm');
	}
	
	function goModifyBoardPost()
	{
		var url = '<%= Constants.getServerURL() + "/boardPost/newBoardPost.do" %>?cafeID=' + cafeID + '&boardNo=' + boardNo + '&postNo=' + postNo;

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function deleteBoardPost()
	{
		if ( confirm('게시 글을 삭제하시겠습니까?') )
		{
			var param = { "cafeID" : cafeID, "boardNo": boardNo, "postNo": postNo };
			
			ajaxRequest('POST', '/nearhere/boardPost/deleteBoardPostAjax.do', param , deleteBoardPostResult );
		}
	}
	
	function deleteBoardPostResult( result )
	{
		if ( result == null )
		{
			alert('처리결과가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
			return;
		}
		else if ( result != null && result.resCode != '0000')
		{
			alert( result.resMsg );
		}
		else
		{
			finish();
		}
	}
	
	function goNewBoardPostReply()
	{
		var url = '<%= Constants.getServerURL() + "/boardPost/newBoardPostReply.do" %>?cafeID=' + cafeID + '&boardNo=' + boardNo + '&postNo=' + postNo;

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function deleteBoardPostReply( postNo, postReplyNo )
	{
		if ( confirm('댓글을 삭제하시겠습니까?') )
		{
			var param = { "cafeID" : cafeID, "replyNo": postReplyNo, "postNo": postNo };
			ajaxRequest('POST', '/nearhere/boardPost/deleteBoardPostReplyAjax.do', param , deleteBoardPostReplyResult );
		}
	}
	
	function deleteBoardPostReplyResult( result )
	{
		if ( result == null )
		{
			alert('처리결과가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
			return;
		}
		else if ( result != null && result.resCode != '0000')
		{
			alert( result.resMsg );
		}
		else
		{
			document.location.reload();
		}
	}
	
</script>
<body>

	<div id="wrapper" style="padding-bottom:10px;">

		<div id="boardNavi">
			<div id="btnDelete" onclick="deleteBoardPost();">삭제하기</div>
			<div id="btnModify" onclick="goModifyBoardPost();">수정하기</div>
			<div id="naviTitle">&lt; <%= boardName %></div>
		</div>
		
		<div id="postHeaderDiv">
			<div id="postTitle">
			<% if ("Y".equals( Util.getStringFromHash(postInfo, "noticeYN") ) ) { %>
			<span id="noti">공지</span>
			<% } %>
			<%= postInfo.get("title") %></div>
			
			<div id="postInfo">
				<span>대용</span>|<span><%= Util.getDateStringFromDate(dtCreatedDate, "yy.MM.dd") %></span>|<span><%= Util.getNumberWithComma(readCount) %></span>
			</div>
			
			<div id="btns">
				<div id="listBtn" onclick="history.back(-1);">목록</div>
			</div>
		</div>
		<div id="postBodyDiv">
			<% if ( contentList != null && contentList.size() > 0 ) {
				
				for ( int i = 0; i < contentList.size(); i++ )
				{
					String type = Util.getStringFromHash( contentList.get(i), "type");
					String content = Util.getStringFromHash( contentList.get(i), "content");
					String imageURL = Util.getStringFromHash( contentList.get(i), "imageURL");
					
					if ("1".equals( type ) )
						out.println( content );
					else
						out.println("<img src='" + imageURL + "' />");
				}
			}
			%>
		</div>
		<div id="postReplyDiv">
			<ul id="replyBtns">
				<li>댓글 <span><%= replyCount %></span></li>
				<li onclick="goNewBoardPostReply();">댓글쓰기</li>
			</ul>
			
			<% if ( Integer.parseInt(replyCount) > 0 ) { %>
			<ul id="replies">
			
				<% for ( int i = 0; i < postReplyList.size(); i++ ) { 
					HashMap postReply = postReplyList.get(i);
					String createdDate2 = postReply.get("createdDate").toString();
					Date dtCreatedDate2 = Util.getDateFromString(createdDate2, "yyyy-MM-dd HH:mm:ss");
					lastReplyIndex = String.valueOf(i+1);
					String writeUserID = Util.getStringFromHash(postReply, "userID");
					String deleteYN = "N";
					if (loginUserID.equals(writeUserID) && !"".equals(loginUserID))
						deleteYN = "Y";
					else if ( "Y".equals(ownerYN) || "운영자".equals(memberType))
						deleteYN = "Y";
					else
						deleteYN = "N";
					
					String replyNo = Util.getStringFromHash(postReply, "replyNo");
				%>
				<li>
					<div id="replyInfo">
						<span><%= postReply.get("userName") %></span>|<span><%= Util.getDateStringFromDate(dtCreatedDate2, "yy-MM-dd HH:mm") %></span><% if ("Y".equals(deleteYN) ) { %>|<span onclick="deleteBoardPostReply('<%= postNo %>','<%= replyNo %>')">삭제하기</span><% } %>
					</div>
					<div><%= postReply.get("content") %></div>
				</li>
				<% } %>
			</ul>
			
			<% if ( Integer.parseInt(replyCount) > postReplyList.size() ) { %>
			<div id="replyDiv" onclick="loadMoreReplies()">댓글 더보기</div>
			<% } %>
			
			<% } %>
		</div>
		
	</div>

<script id="replyT" type="text/x-handlebars-template">
		{{#each data}}
		<li>
			<div id="replyInfo"><span>{{userName}}</span>|<span>{{displayDateFormat createdDate}}</span>{{displayDeleteButton userID replyNo}}</div>
			<div>{{content}}</div>
		</li>
		{{/each}}
</script>
<script language="javascript">

	var lastReplyIndex = <%= lastReplyIndex %>;
	var replyCount = <%= replyCount %>;
	
	function loadMoreReplies()
	{
		var param = {"postNo":"<%= postInfo.get("postNo") %>", 
				"startIndex": lastReplyIndex, "showCount": 5};
		
		ajaxRequest('POST', '/nearhere/cafe/boardPost/getMoreRepliesAjax.do', param , onResult );		
	}
	
	function onResult( result )
	{
		console.log(JSON.stringify(result));
		
		var source = $('#replyT').html();
		var template = Handlebars.compile(source);
		var html = template(result);

		lastReplyIndex += result.data.length;
		
		$('#replies').append(html);
		
		if ( replyCount > lastReplyIndex )
			$('#replyDiv').show();
		else
			$('#replyDiv').hide();
			
	}
	
	function displayDeleteButton( userID, replyNo)
	{
		console.log( loginUserID + ' ' + userID + ' ' + replyNo );
		
		if ( loginUserID == userID || ownerYN == 'Y' || memberType == '운영자')
			return new Handlebars.SafeString('|<span onclick="deleteBoardPostReply(\'' + postNo + '\',\'' + replyNo + '\')">삭제하기</span>');
		else return '';
	}
	
</script>
	
</body>
</html>