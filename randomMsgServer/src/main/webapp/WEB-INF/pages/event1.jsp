<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	
	<style type="text/css">
		#title{font-weight:bold;text-align:center;font-size:17px;}
		#subTitle{text-align:center;}
		#content{margin-top:40px;text-indent:-1em;margin-left:15px;}
		#detail{padding-left:20px;padding-top:10px;}
		#promotionImg{margin-top:20px;}
		
	</style>
</head>
<body>

<div id="wrapper">
	<div id="title">매일매일 이마트 상품권을 쏩니다!!</div>
	<div id="subTitle">(2015-02-23 ~ 2015-02-28)</div>
	<div id="promotionImg">
		<img src="<%= Constants.IMAGE_PATH %>/emart5000.png"/>
	</div>
	<div id="content">1. 합승등록만 해도 이마트상품권을 드립니다.</div>
	<div id="detail">매일 선착순 3명에 한하여 무조건 이마트상품권(5천원권)을 드립니다.(단, 장난글 제외)</div>
	<div id="content">2. 진행중인 합승에 대해서 댓글만 달아도 이마트상품권을 드립니다.</div>
	<div id="detail">매일 선착순 3명에 한하여 무조건 이마트상품권(5천원권)을 드립니다.(단, 장난글 제외)</div>
</div>

</body>
</html>
