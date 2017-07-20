<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	
	<style type="text/css">
		body{background:#ffffff}
		#wrapper{margin:10px;}
		#title{font-weight:bold;text-align:center;font-size:17px;}
		#subTitle{text-align:center;}
		#content{margin-top:20px;text-indent:-1em;margin-left:15px;line-height:150%;}
		#detail{padding-left:15px;padding-top:10px;}
		#promotionImg{margin-top:20px;}
		
	</style>
</head>
<body>

<div id="wrapper">
	<div id="title">1. 여행정보 탭이 추가되었습니다.</div>
	<div id="promotionImg">
		<table style="width:100%">
			<tr>
				<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/notice4.png" width="90%"/></td>
			</tr>
		</table>
	</div>
	<br/>
	<div id="title">2. 상세지역별 조회가 가능합니다.</div>
	<div id="promotionImg">
		<table style="width:100%">
			<tr>
				<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/notice1.png" width="90%"/></td>
			</tr>
		</table>
	</div>
	<br/>
	<div id="title">3. 관심지역별로 뉴스 및<br/>블로그를 보실 수 있습니다.</div>
	<div id="promotionImg">
		<table style="width:100%">
			<tr>
				<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/notice5.png" width="90%"/></td>
			</tr>
			<tr>
				<td style="text-align:center">&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align:center"><img src="<%= Constants.IMAGE_PATH %>/notice6.png" width="90%"/></td>
			</tr>
			<tr>
				<td style="width:50%;text-align:center;padding-top:10px;font-size:12px;">보다 더 발전하는 이근처가 되겠습니다.</td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>
