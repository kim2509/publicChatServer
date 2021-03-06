<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");
	String latitude = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");
	String address = request.getParameter("address");
	String version = request.getParameter("appVersion");
	double appVersion = 0;
	if ( !Util.isEmptyString(version) )
		appVersion = Double.parseDouble(version);
	
	//address = new String(address.getBytes("ISO-8859-1"), "UTF-8");
	if ( address != null && address.length() > 0 )
	{
		address = URLDecoder.decode(address, "UTF-8");
	}
	
	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
%>
<html>

<head>
<title>이근처</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/searchDestination.css?v=2" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

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
				"toDistance" : "100",
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
		
</script>
	
	<jsp:include page="../common/common.jsp" flush="true"></jsp:include>
	
</head>
<body>

	<div id="wrapper">

		<div class="searchRegion">
			<span>검색위치 : </span><%= address %>
		</div>
		<div id="postList">
		</div>

	</div>

</body>
</html>
