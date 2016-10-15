<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	
	<style type="text/css">
		body{background:#ffffff;padding-top:10px;}
		#title{font-weight:bold;text-align:center;font-size:17px;}
		#subTitle{text-align:center;}
		#content{margin-top:20px;text-indent:-1em;margin-left:15px;line-height:150%;}
		#detail{padding-left:15px;padding-top:10px;}
		#promotionImg{margin-top:20px;}
		
	</style>
</head>
<body>

<div id="wrapper">
	<div id="title">카카오 계정 연동하면 상품권을 드립니다.</div>
	<div id="subTitle">(2015-09-06 ~ 2015-09-30)</div>
	<div id="promotionImg">
		<table style="width:100%">
			<tr>
				<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/culturecoupon5000.jpg" width="50%"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;padding-top:10px;font-size:12px;">사용처 : 인터파크,지마켓,옥션,GSSHOP,이마트몰 등
				</td>
			</tr>
			<tr>
				<td style="text-align:center;padding-top:10px;"><img src="<%= Constants.IMAGE_PATH %>/starbucks.jpg" width="50%"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;padding-top:10px;font-size:12px;">스타벅스 아메리카노
				</td>
			</tr>
			<tr>
				<td style="text-align:center;padding-top:10px;"><img src="<%= Constants.IMAGE_PATH %>/s-oil.jpg" width="50%"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;padding-top:10px;font-size:12px;">S-OIL 주유할인권(5천원)</td>
			</tr>
			</tr>
				<td colspan="2" style="width:50%;text-align:center;font-size:12px;padding-top:20px;" >&lt;3개중 택1&gt;</td>
			</tr>
		</table>
	</div>
	<div id="content">* <font color="blue">선착순 50명</font>에게 상품권을 드립니다.</div>
	<div id="content">* 카카오 연동은 최신버전(1.39) 에서 가능합니다.</div>
</div>

</body>
</html>
