<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	List<HashMap> regionList = (List<HashMap>) request.getAttribute("regionList");
%>
<html>

<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<style type="text/css">
dl {
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

dd {
	display: block;
	position: relative;
	height: 50px;
	line-height: 50px;
	border-bottom: 1px solid #ccc;
	text-align: left;
}

a:link, a:hover, a:active {
	text-decoration: none;
}

.slide_lst {
	
}

.slide_lst .inp_box {
	padding-left: 10px;
	padding-right: 10px;
}

.slide_lst .inp_box .tit {
	color: #666;
}

.inp_box .arr {
	position: absolute;
	top: 50%;
	right: 10px;
	width: 7px;
	height: 11px;
	margin-top: -6px;
	background-position: -22px -31px;
	background-image: url(//pics.gmkt.kr/mobile/lpsrp/sp_mw_rtn.png);
	background-size: 200px auto;
}

table, td {
	margin: 0px;
}

#wrapper {
	margin-top: 15px;
	padding: 0px;
	padding-bottom: 20px;
}

.region tr {
	height: 40px;
}

.region td {
	padding-left: 5px;
	padding-right: 5px;
	text-align: center;
	font-size: 14px;
}

.countItem {
	clear: both;
	margin-top: 10px;
}

#divCountPerResion {
	margin-top: 10px
}

#progressingPostItems {
	margin-top: 10px;
	margin-bottom: 10px;
}

.postItem {
	clear: both;
	height: 60px;
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>

<script language="javascript">
	jQuery(document).ready(function() {

	});

	function goRegionPage( titleUrlEncoded, url )
	{
		document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '&showNewButton=Y';
	}
	
	function snsLogin()
	{
		document.location.href='nearhere://snsLogin';
	}
	
	function showOKDialog( title, message, param )
	{
		document.location.href='nearhere://showOKDialog?title=' + title + '&message=' + message + '&param=' + param;
	}
</script>
</head>
<body>

	<div id="wrapper">

		<div>
			<div onclick="snsLogin();">SNS로그인</div>
		</div>
		
		<div>
			<div onclick="showOKDialog('확인','안녕하세요.','abc');">OKDialog</div>
		</div>

		<div>

			<dl class="slide_lst">
<%
				String incheonAirportURL = Constants.getServerURL() + "/taxi/searchDestination.do?latitude=37.460195&longitude=126.438507&address=%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD";
				incheonAirportURL = URLEncoder.encode( incheonAirportURL, "UTF-8" );
%>
				<dd onclick="goRegionPage('%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD','<%= incheonAirportURL %>')">
					 <strong class="tit">인천공항</strong> <span
						class="sp_mw arr"></span>
					
				</dd>
				
<%
				for ( int i = 0; i < regionList.size(); i++ )
				{
					String regionNo = regionList.get(i).get("regionNo").toString();
					String title = regionList.get(i).get("regionName").toString();
					String titleUrlEncoded = URLEncoder.encode( title, "UTF-8" );
					String regionCount = regionList.get(i).get("regionCount").toString();
					String url = URLEncoder.encode( Constants.getServerURL() + "/taxi/listRegion.do?regionNo=" + regionNo, "UTF-8" );
%>
				<dd onclick="goRegionPage('<%= titleUrlEncoded %>','<%= url %>')">
					 <strong class="tit"><%= title %>(<%= regionCount %>)</strong> <span
						class="sp_mw arr"></span>
					
				</dd>
<%
				}
%>
			</dl>

		</div>

	</div>

</body>
</html>
