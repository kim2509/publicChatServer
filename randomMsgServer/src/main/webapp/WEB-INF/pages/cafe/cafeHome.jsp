<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
}

ul{
	margin:0;
	padding:0;
}

#wrapper{
}

li{ list-style:none; }

.menu{
}

.menuItem{
	float:left;
	width:30%;
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

a{
	box-sizing: border-box;
	position: relative;
    height: 45px;
    font-weight: bold;
    display: block;
    font-size: 16px;
    line-height: 45px;
    text-align: center;
    text-decoration: none;
}

.titleDiv{
	background:#d40700;
	color:white;
	height:42px;
	text-align:center;
	display: table; 
	width: 100%;
}

.title{
	font-weight:bold;
	vertical-align:middle;
	display: table-cell;
}

</style>

<script language="javascript">
		
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
		
		
		<div class="titleDiv">
			<span class="title">중고나라</span>
		</div>
		
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
			
	</div>

	
	
</body>
</html>