<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title></title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafe.css" />

<script language="javascript">

	var isApp = '<%= isApp %>';

	function goCafeHome( cafeID )
	{
		var url ='<%= Constants.getServerURL() %>/cafe/' + cafeID;
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href= url;
	}
</script>

</head>
<body>

	<div id="wrapper">
		
		<div id="header">
			카페 만들기
		</div>
		
		<div id="content">
		
			<div id="makeCafeResultDiv">
				<div id="cafeName"><%= request.getParameter("cafeName") %></div>
				<div id="resultBody">카페 개설을 축하드립니다.<br/>카페 공개 후 회원들을 초대해 보세요.</div>
				<div id="resultFooter">
					<span onclick="goCafeHome('<%= request.getParameter("cafeID") %>');">개설카페로 이동</span>
				</div>
			</div>
			
		</div>
		
			
	</div>

	
	
</body>
</html>