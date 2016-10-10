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

</style>

	

</head>
<body>

	<script id="itemT" type="text/x-handlebars-template">
	<dl class="slide_lst">
		{{#each items}}
		<dd onclick="openDetailView('{{contenttypeid}}','{{contentid}}');" class="item">
			<div class="thumbnail" {{displayThumnailYN firstimage2}}>
				<img src='{{firstimage2}}' width="80" height="80"/>
			</div>
			<div class='desc' {{putLeftYN firstimage2}}>
				<strong class="tit">{{title}}</strong>
				<div style="font-size:14px;margin-top:10px;">분류 : {{getTypeName contenttypeid}}</div>
				<div style="font-size:14px;margin-top:5px;font-weight:bold;">조회수 : {{numberWithCommas readcount}}</div>
			</div>
		</dd>
		{{/each}}
	</dl>
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

			<div class="sectionTitle">내 가입 카페</div>

		</div>

	</div>

	
	
</body>
</html>