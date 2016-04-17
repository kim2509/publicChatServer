<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>
<%@ page import="java.util.*"%>

<%
	String regionNo = request.getParameter("regionNo");
	String longitude = request.getParameter("longitude");
	String address = request.getParameter("address");
	String isApp = request.getParameter("isApp");
	if ( isApp == null || !"Y".equals( isApp ) ) isApp = "N";
//	Constants.bReal = false;

	HashMap regionInfo = (HashMap) request.getAttribute("regionInfo");
	String isHotspot = regionInfo.get("isHotSpot") == null ? "" : regionInfo.get("isHotSpot").toString();
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/searchDestination.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">
	jQuery(document).ready(function() {

		getPosts();
		
	});

	var pageNo = 1;
	var bLoading = false;
	
	function getPosts()
	{
		if ( bLoading ) return;
		bLoading = true;
		
		//if ( pageNo == 1 )
			//$('#loading').show();
		
		$('#empty').hide();
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getPostsNearHereAjax.do",
			data : JSON.stringify({
				"regionNo" : <%= regionNo %>,
				"pageNo" : pageNo
			}),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					//$('#loading').hide();
					
					displayPosts( data );
					
					$("img.lazy").lazyload({
					    effect : "fadeIn"
					});

					$(window).resize();

					$(window).bind('scroll', function()
		            {
						if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
							        // you're at the bottom of the page
							pageNo++;
							getPosts();
						}
					});
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
				//$('#loading').hide();
			}
		});
	}
	
	function displayPosts(data) {
		
		if ( data == null || data.data.postsNearHere == null || data.data.postsNearHere.length < 1 )
		{
			if ( pageNo == 1 )
				$('#empty').show();
			return;
		}
		
		var source = $('#postT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data);

		if ( pageNo == 1 )
			$('#postList').html(html);
		else if ( pageNo > 0 )
			$('#postList dl').append($(html).find('dd'));
	}
	
	function goVIP(postID)
	{
		document.location.href='nearhere://viewPost?postID=' + postID;
	}
	
	function openUserProfile( userID )
	{
		document.location.href='nearhere://openUserProfile?userID=' + userID;
	}
	
	function snsLogin()
	{
		document.location.href='nearhere://snsLogin';
	}
	
	function showOKDialog( title, message, param )
	{
		document.location.href='nearhere://showOKDialog?title=' + title + '&message=' + message + '&param=' + param;
	}
	
	function goNewPost()
	{
		var nextUrl = encodeURIComponent('<%= request.getRequestURL() + request.getQueryString() %>');
<%
		if ("Y".equals( isHotspot ) )
		{
%>
			document.location.href='<%= Constants.getServerURL() %>/taxi/newHotspot.do?isApp=<%= isApp %>&regionNo=<%= regionNo %>&nextUrl=' + nextUrl;
<%
		}
		else
		{
%>
			document.location.href='<%= Constants.getServerURL() %>/taxi/newPost.do?isApp=<%= isApp %>&regionNo=<%= regionNo %>&nextUrl=' + nextUrl;
<%
		}
%>		
	}
	
	function getNewPostURL()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
<%
			if ("Y".equals( isHotspot ) )
			{
%>
				Android.setNewPostURL('<%= Constants.getServerURL() %>/taxi/newHotspot.do?isApp=<%= isApp %>&regionNo=<%= regionNo %>');
<%
			}
			else
			{
%>
				Android.setNewPostURL('<%= Constants.getServerURL() %>/taxi/newPost.do?isApp=<%= isApp %>&regionNo=<%= regionNo %>');
<%
			}
%>			
		}
	}
	
</script>

	<jsp:include page="../common/common.jsp" flush="true"></jsp:include>
	
</head>
<body>

	<div id="wrapper">

		<!-- div>
			<div onclick="snsLogin();">SNS로그인</div>
		</div>
		
		<div>
			<div onclick="showOKDialog('확인','안녕하세요.','abc');">OKDialog</div>
		</div-->
		
<%
		if ( "N".equals( isApp ) )
		{
%>
			<div id="btnNewPost" onclick="goNewPost();">
				<img class="newButton" src="<%= Constants.IMAGE_PATH %>/plus_image.png" width=50 height=50 />
			</div>
<%			
		}
%>		
		
		<div id="postList">
		</div>

		<div id="loading" style="display:none">
			로딩중입니다.
		</div>
		
		<div id="empty" style="display:none">
			등록된 내역이 없습니다.
		</div>
	</div>
	
</body>
</html>
