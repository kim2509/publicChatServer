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

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=3"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/board.css?v=2" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=1" />


<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var boardNo = '<%= boardNo %>';
	var boardName = '<%= boardName %>';

	var startIndex = 0;
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	var pageNo = 1;
	var pageSize = 10;
	var totalItemCount = 0;
	
	jQuery(document).ready(function(){
		
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );
		Handlebars.registerHelper('displayPostTitle', displayPostTitle );
		Handlebars.registerHelper('numberWithCommas', numberWithCommas );
		
		getBoardPostList();
		
	});
	
	function getBoardPostList()
	{
		var param = {"startIndex":startIndex, "showCount" : pageSize, "boardNo": boardNo};
		ajaxRequest('POST', '/nearhere/boardPost/getCafeBoardPostListAjax.do', param , onBoardPostListFetched );
	}
	
	function onBoardPostListFetched( result )
	{
		console.log(JSON.stringify( result ) );
		
		var source = $('#boardPostT').html();
		var template = Handlebars.compile(source);
		var html = template(result.data);

		$('#postContainerDiv').html(html);
		
		totalItemCount = result.data2;
		
		if ($('#pagingInfo').length > 0 && totalItemCount > 0 )
		{
			$('#pagingInfo').show();
			displayPagingInfo();
		}
	}
	
	function displayPostTitle(noticeYN, title)
	{
		var innerHTML = '';
		
		if ( noticeYN == 'Y')
			innerHTML += '<span id="noti">공지</span>';

		innerHTML += title;

		return new Handlebars.SafeString( innerHTML );
	}
	
	function goPostDetail( postNo )
	{
		var url = "<%= Constants.getServerURL() %>/boardPost/detail/" + postNo + "?cafeID=" + cafeID + "&boardNo=" + boardNo +
				"&boardName=" + encodeURIComponent(boardName);

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_BOARD_POST_DETAIL %>&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function goNewBoardPost()
	{
		var url = '<%= Constants.getServerURL() + "/boardPost/newBoardPost.do" %>?cafeID=' + cafeID + '&boardNo=' + boardNo;

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function displayPagingInfo()
	{
		$('#pagingInfo').empty();
		
		if ( totalItemCount < 1 )
			return;
		
		if ( pageNo <= numOfPagesOnScreen )
			firstPage = 1;
		else
		{
			firstPage = parseInt(pageNo / numOfPagesOnScreen) * numOfPagesOnScreen;
			if ( pageNo % numOfPagesOnScreen == 0 )
				firstPage = firstPage - numOfPagesOnScreen + 1;
			else
				firstPage++;
		}
		
		lastPage = parseInt( totalItemCount / pageSize );
		if ( (parseInt(totalItemCount) % parseInt(pageSize)) > 0)
			lastPage++;
		
		if ( firstPage > numOfPagesOnScreen + 1)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(1);">&lt;&lt;</a>');
		
		if ( firstPage != 1 )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage - 1) + ');">&lt;</a>');
		
		for ( var i = 0; i < numOfPagesOnScreen; i++ )
		{
			if ( firstPage + i == pageNo)
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" class="pageSelected">' + (firstPage + i) + '</a>');
			}
			else
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" >' + (firstPage + i) + '</a>');
			}
		
			if ( (firstPage + i) == lastPage )
				break;
		}
		
		if ( lastPage > firstPage + numOfPagesOnScreen )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + numOfPagesOnScreen) + ');" >&gt;</a>');
		
		if ( firstPage + numOfPagesOnScreen <= lastPage )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + lastPage + ');" >&gt;&gt;</a>');
		
	}
	
	function goPage(num)
	{
		pageNo = num;
		startIndex = (pageNo - 1) * pageSize;
		
		getBoardPostList();
	}
	
</script>
<script id="boardPostT" type="text/x-handlebars-template">
	{{#if boardPostList}}
	<ul>
		{{#each boardPostList}}
		<li onclick="goPostDetail('{{postNo}}');">
			<div id="commentCount">{{replyCount}}</div>
			<div id="postDiv">{{displayPostTitle noticeYN title}}</div>
			<div id="postInfo">
				<span>{{userName}}</span>|<span>{{displayDateFormat createdDate 'yyyy-MM-dd HH:mm:ss'}}</span>|<span>{{numberWithCommas readCount}}</span>
			</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div id="emptyDiv">게시글이 존재하지 않습니다.</div>
	{{/if}}
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
		</div>
		
		<div id="pagingInfo" style="text-align: center; margin-top: 20px; font-weight: bold; display: block;">
		</div>
		
	</div>

	
	
</body>
</html>