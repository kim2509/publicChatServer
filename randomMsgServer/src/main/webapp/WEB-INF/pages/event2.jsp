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
		#content{margin-top:20px;text-indent:-1em;margin-left:15px;line-height:150%;}
		#detail{padding-left:15px;padding-top:10px;}
		#promotionImg{margin-top:20px;}
		
	</style>
</head>
<body>

<div id="wrapper">
	<div id="title">합승 등록만 해도 상품권을 쏩니다!</div>
	<div id="subTitle">(2015-06-01 ~ 2015-06-15)</div>
	<div id="promotionImg">
		<table style="width:100%">
			<tr>
				<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/culturecoupon5000.jpg" width="80%"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;padding-top:10px;font-size:14px;">사용처 : 인터파크,지마켓,옥션,GSSHOP,이마트몰 등
				</td>
			</tr>
			<tr>
				<td style="text-align:center;padding-top:10px;"><img src="<%= Constants.IMAGE_PATH %>/starbucks.jpg" width="50%"/></td>
			</tr>
			</tr>
				<td colspan="2" style="width:50%;text-align:center;font-size:12px;padding-top:20px;" >&lt;2개중 택1&gt;</td>
			</tr>
		</table>
	</div>
	<div id="content">* 전체 10명(선착순 5명,추첨 5명)에 한하여 상품권을 드립니다.
		<br/>(단, 장난글 제외, 5월당첨자 제외)</div>
</div>

</body>
</html>
