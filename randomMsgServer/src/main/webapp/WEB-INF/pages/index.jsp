<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");
	String snsLoginYN = request.getParameter("snsLogin");

	List<HashMap> regionList = (List<HashMap>) request.getAttribute("regionList");
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/category.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

	});

	function goRegionPage( titleUrlEncoded, url )
	{
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '&showNewButton=Y';
		else
			document.location.href = decodeURIComponent(url);
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

<%
		if ("Y".equals( snsLoginYN ) )
		{
%>
		<div class="snsLogin" onclick="snsLogin();">
			<div>SNS계정으로 로그인을 하시면 상대방에게 보다 더 믿음을 주실 수 있습니다.</div>
			<div class="snsBtns">
				<img class="kakaoLogin" src="<%= Constants.IMAGE_PATH %>/kakao_login_btn.png" width="42%;" height="40px"/>
				<img class="fbLogin" src="<%= Constants.IMAGE_PATH %>/facebook_logo.png" width="42%;" height="40px"/>
			</div>
		</div>

<%			
		}
%>		
		
		<!-- div>
			<div onclick="showOKDialog('확인','안녕하세요.','abc');">OKDialog</div>
		</div-->

		<div>

			<dl class="slide_lst">
<%
				String incheonAirportURL = Constants.getServerURL() + "/taxi/searchDestination.do?latitude=37.460195&longitude=126.438507&address=%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD";
				incheonAirportURL = URLEncoder.encode( incheonAirportURL, "UTF-8" );
%>
				<!-- dd onclick="goRegionPage('%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD','<%= incheonAirportURL %>')">
					 <strong class="tit">인천공항</strong> <span
						class="sp_mw arr"></span>
					
				</dd-->
				
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
