<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String latitude = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");
	String address = request.getParameter("address");
	//address = new String(address.getBytes("ISO-8859-1"), "UTF-8");
	if ( address != null && address.length() > 0 )
	{
		address = URLDecoder.decode(address, "UTF-8");
	}
%>
<html>

<head>
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

		Handlebars.registerHelper('printSexInfo', printSexInfo);
		
		getPosts();
		
	});

	var pageNo = 1;
	var bLoading = false;
	
	function getPosts()
	{
		if ( bLoading ) return;
		
		bLoading = true;
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getPostsNearHereAjax.do",
			data : JSON.stringify({
				"toLatitude" : <%= latitude %>,
				"toLongitude" : <%= longitude %>,
				"toDistance" : "10",
				"pageNo" : pageNo
			}),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

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
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	
	function displayPosts(data) {
		
		if ( data == null || data.data.postsNearHere == null || data.data.postsNearHere.length < 1 ) return;
		
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
	
	function printSexInfo( sex )
	{
		if ( sex == 'M' )
			return new Handlebars.SafeString('<img class="sex" src="<%= Constants.IMAGE_PATH %>/ic_male.png" width="15" height="15"/>');
		else if ( sex == 'F' )
			return new Handlebars.SafeString('<img class="sex" src="<%= Constants.IMAGE_PATH %>/ic_female.png" width="15" height="15"/>');
	}
	
	function openUserProfile( userID )
	{
		document.location.href='nearhere://openUserProfile?userID=' + userID;
	}
	
</script>
</head>
<body>

	<div id="wrapper">

		<div>
			<%= address %>
		</div>
		<div id="postList">
		</div>

	</div>

	<script id="postT" type="text/x-handlebars-template">
		<dl class="slide_lst">
			{{#each postsNearHere}}
			<dd>
				<div class='userProfile' onclick="openUserProfile('{{user.userID}}');">
					<img class="lazy" data-original='<%= Constants.getThumbnailImageURL() %>/{{user.profileImageURL}}' 
						src="<%= Constants.IMAGE_PATH %>/no_image.png" width="80" height="80"/>
				</div>
				<div class='postDesc' onclick="goVIP('{{postID}}')">
					<strong class="tit">{{message}}</strong>
					<div id="departureDateTime">{{departureDateTime}}</div>
					<div id="readCount">조회수 : {{readCount}}</div>
					<div id="personInfo"><div id="userSex">{{printSexInfo user.sex}}</div><div id="userName">{{user.userName}}</div></div>
					<div id="tags"><span>{{vehicle}}</span><span>{{fareOption}}</span><span>{{numOfUsers}}</span></div>
				</div>
			</dd>
			{{/each}}
		</dl>
	</script>
</body>
</html>
