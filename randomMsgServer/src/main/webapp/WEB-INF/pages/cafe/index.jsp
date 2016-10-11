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
    height: 130px;
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
	clear:both;
}

.desc{
	margin-top:5px;
	text-align:center;
	overflow:hidden;
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
	text-align:left;
	margin-left:80px;
}

.cafeName{
	float:right;
}
</style>

	

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

		<div id="section">

			<div class="destination" onclick="openMap();">카페 검색</div>		

		</div>	
		
		<div id="section">

			<div style="float:right;margin-right:10px;"><input type="button" value="카페 만들기" class="btn1" /></div>
			<div style="padding: 5px;font-weight:bold;">이근처 사람들과 모여모여~</div>

		</div>
		
		<div id="section">

			<div style="float:right;margin-right:5px;font-weight:bold;">더 보기</div>
			<div class="sectionTitle">내 가입 카페</div>

			<ul class="slide_lst">
				<li class="cafeItem">
					<div class="thumbnail">
						<img src='http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png' width="80" height="80"/>
					</div>
					<div class='desc'>
						카페1이구나야fdsafdsa
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
		
		
		<div id="section">

			<div style="float:right;margin-right:5px;font-weight:bold;">더 보기</div>
			<div class="sectionTitle">이근처 정모</div>

			<ul class="slide_lst2">
				<li>
					<div class='date'>
						화요일<br/>
						19<br/>
						오후 7:00
					</div>
					<div class="postTitle">
						불금에 삼겹살에 소주 한잔~
					</div>
					<div class='cafeName'>
						역삼모임
					</div>
				</li>
				
			</ul>
		</div>

	</div>

	
	
</body>
</html>