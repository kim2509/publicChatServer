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
	<div id="subTitle">(2015-05-16 ~ 2015-05-31)</div>
	<div id="promotionImg">
		<table style="width:100%">
			<tr>
				<td style="width:50%"><img src="<%= Constants.IMAGE_PATH %>/cu5000.jpg" width="140"/></td>
				<td style="width:50%"><img src="<%= Constants.IMAGE_PATH %>/gs5000.jpg" width="140"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;font-size:12px;" >5천원권</td>
				<td style="width:50%;text-align:center;font-size:12px;" >5천원권</td>
			</tr>
			<tr>
				<td style="width:50%"><img src="<%= Constants.IMAGE_PATH %>/shinsegye.jpg" width="140"/></td>
				<td style="width:50%"><img src="<%= Constants.IMAGE_PATH %>/starbucks.jpg" width="140"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;font-size:12px;" >5천원권</td>
				<td style="width:50%;text-align:center;font-size:12px;" >스타벅스 아메리카노</td>
			</tr>
				<td colspan="2" style="width:50%;text-align:center;font-size:12px;padding-top:20px;" >&lt;4개중 택1&gt;</td>
			</tr>
		</table>
	</div>
	<div id="content">1. 선착순 5명에 한하여 무조건 상품권을 드립니다.
		<br/>(단, 장난글 제외)</div>
	<div id="content">2. 남은 이벤트 기간동안 추첨을 통해 5명에게<br/>위 상품권을 드립니다.</div>
</div>

</body>
</html>
