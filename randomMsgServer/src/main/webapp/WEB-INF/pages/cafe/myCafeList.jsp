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

span{ padding:5px; }

.destination {
    margin: 10px;
    border-radius: 10px;
    border: 1px solid #5f98f1;
    background: white;
    line-height: 40px;
    color: #5f98f1;
    text-align: center;
}

ul {
	margin:0;
	padding:0;
	text-align:center;
	display:block;
	overflow:hidden;
	list-style:none;
}

.cafeItem {
	float: left;
    height: 135px;
    width: 32%;
    text-align:center;
}

li img{
	border-radius: 10px;
}

.slide_lst{
	margin-top:10px;
}

.slide_lst2{
	
	
}

.slide_lst2 li {
	position:relative;
	clear:both;
	height:60px;
	padding-top:10px;
	padding-bottom:5px;
	border-bottom: 1px solid gray;
}

.desc{
	margin-top:5px;
	text-align:center;
	overflow:hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    line-height: 1.4;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    padding-left:10px;
    padding-right:10px;
}

.date{
	border:1px solid gray;
	border-radius: 5px;
	padding:5px;
	font-size:12px;
	font-weight:bold;
	float:left;
}

.postTitle{
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
    text-overflow: ellipsis;
	text-align:left;
	margin-left:70px;
	font-size:12px;
}

.cafeName{
	position:absolute;
	margin-left:70px;
	font-size:12px;
	font-weight:bold;
	bottom:10px;
	right:10px
}

.sectionTitle{
	padding-left:10px;
}

.btn1{
	margin-top:3px;
}

#pageInfo{
	text-align: center;
    margin-top: 10px;
    font-weight: bold;
}

a {
	text-decoration: none;
    color: black;
    line-height: 1.4em;
}

.tab{
	padding:10px;
	text-align:center;
}

.tabItem{
	background:white;
	margin:5px;
	float:left;
	padding:10px;
	border-radius:10px;
}

.selected{
	border:1px solid blue;
	color:blue;
}

</style>

	<script language="javascript">
		function goMyCafeList()
		{
			document.location.href="/nearhere/cafe/myCafeList.do";
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

	<div id="wrapper" style="padding-bottom:10px;">
		
		<div style="margin-top:10px;margin-bottom:10px;">
			<ul class="tab">
				<li class="tabItem selected">
					<div>내 가입 카페</div>
				</li>
				<li class="tabItem">
					<div>운영 카페</div>
				</li>
			</ul>
		</div>
		
		<div id="section">

			<ul class="slide_lst">
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1이구나야fdsafdsa카페1이구나야fdsafdsa
					</div>
				</li>
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1
					</div>
				</li>
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1
					</div>
				</li>
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1
					</div>
				</li>
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1
					</div>
				</li>
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1
					</div>
				</li>
			</ul>
			
		</div>
		
		<div id="pagingInfo" style="text-align:center;margin-top:10px;font-weight:bold;">
			<b><a href="javascript:void(0)" onclick="goPage(1);" style="padding:5px;" class="pageSelected">1</a></b>
			<a href="javascript:void(0)" onclick="goPage(2);" style="padding:5px;">2</a>
			<a href="javascript:void(0)" onclick="goPage(3);" style="padding:5px;">3</a>
			<a href="javascript:void(0)" onclick="goPage(4);" style="padding:5px;">4</a>
			<a href="javascript:void(0)" onclick="goPage(5);" style="padding:5px;">5</a>
			<a href="javascript:void(0)" onclick="goPage(6);" style="padding:5px;">&gt;</a>
			<a href="javascript:void(0)" onclick="goPage(176);" style="padding:5px;">&gt;&gt;</a>
		</div>
			
	</div>

	
	
</body>
</html>