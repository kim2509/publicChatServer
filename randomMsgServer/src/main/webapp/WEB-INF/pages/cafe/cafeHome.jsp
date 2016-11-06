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
	href="<%=Constants.CSS_PATH%>/common_v2.css?v=2" />


<style type="text/css">

body{
	background:white;
	margin:0;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}


.menu{
	height:45px;
	border-bottom:1px solid #A3A3A3
}

ul{
	padding:0;
	margin: 0 15px;
	margin-right:105px;
	height:45px;
}

#wrapper{
}

li{ 
	list-style:none;
}


.menuItem{
	float:left;
	width:33.33%;
}

.link_tab::before{
	content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 1px;
    background: #d40700;
}

.link_tab{
	color: #e8291c;
}

.menu a, .cafe_bnr a{
	box-sizing: border-box;
	position: relative;
    height: 45px;
    display: block;
    font-size: 16px;
    line-height: 45px;
    text-align: center;
    text-decoration: none;
    color:black;
}

.titleDiv{
	background:#45a8e2;;
	color:white;
	height:50px;
	text-align:center;
	display: table; 
	width: 100%;
}

.title{
	font-weight:bold;
	font-size:20px;
	vertical-align:middle;
	display: table-cell;
}

.link_bnr
{
	display: block;
    margin-right: 43px;
    padding-left: 15px;
    font-size: 14px;
    line-height: 44px;
    color: #333;
    text-align: center;
}


#boardList{
	margin-top:10px;
}

#boardList p{
	padding-top:5px;
	padding-left:10px;
}

#boardList ul{
	border-top:1px solid #d3d3d3;
	margin:0;
	margin-top:10px;
}

#boardList ul li{
	line-height:30px;
	border-bottom:1px solid #d3d3d3;
	padding:5px 10px;
}

#boardList ul li a{
	text-decoration:none;
	color:black;
	display:block;
	line-height:30px;
}

</style>

<script language="javascript">
		
	var isApp = '<%= isApp %>';

	function goBoardHome( boardNo, boardName, url )
	{
		var titleUrlEncoded = encodeURIComponent( boardName );
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href="/nearhere/board/3";
	}
</script>

</head>
<body>

	<script id="cafeItemT" type="text/x-handlebars-template">
	<ul class="slide_lst">
		{{#each items}}
		<li>
			<div class="thumbnail">
				<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
			</div>
			<div class='desc'>
				카페1
			</div>
		</li>
		{{/each}}
	</ul>
</script>

	<div id="wrapper">
		
<%
	if ( "Y".equals( isApp ) )
	{
%>
		<div class="titleDiv">
			<span class="title">중고나라</span>
		</div>
	
<%		
	}
%>		
		
		<div class="menu">
			<ul>
				<li class="menuItem">
					<a href="" class="link_tab">게시판</a>
				</li>
				<li class="menuItem">
					<a href="">전체글</a>
				</li>
				<li class="menuItem">
					<a href="">이미지</a>
				</li>
			</ul>
		</div>
		
		<div class="cafe_bnr" style="background-color:#ffffc3">
			<button type="button" style="float:right;"><span class="ico_cafe ico_close">닫기</span></button>
			<a href="" class="link_bnr"><span class="ico_cafe ico_bnr">알림</span>게시판 새글 소식을 빨리 받고 싶다면!</a>
		</div>
			
		<div id="boardList">
			
			<p>전체 게시판</p>
		
			<ul>
				<li>
					<a href="javascript:void(0)" onclick="goBoardHome('','공지사항','<%= Constants.getServerURL() + "/board/3?isApp=" + isApp %>');">공지사항</a> 
				</li>
				<li>
					<a href="javascript:void(0)" onclick="goBoardHome();">휴대폰/악세사리</a> 
				</li>
				<li>
					<a href="javascript:void(0)" onclick="goBoardHome();">문의 게시판</a> 
				</li>
			</ul>
		</div>
	</div>

	
	
</body>
</html>