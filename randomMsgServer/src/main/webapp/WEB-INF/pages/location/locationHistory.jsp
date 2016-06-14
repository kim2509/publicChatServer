<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");

	HashMap userInfo = null;
	String userID = "";
	
	if ( request.getAttribute("userInfo") != null )
	{
		userInfo = (HashMap) request.getAttribute("userInfo");
		userID = userInfo.get("userID").toString();
	}
	
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css" href="<%=Constants.SECURE_CSS_PATH%>/common.css" />
<link rel="stylesheet" href="<%=Constants.SECURE_CSS_PATH%>/jquery.mobile-1.4.5.min.css">
		
<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>
<!-- Include the jQuery Mobile library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var isApp = '<%= isApp %>';
	var loginID = '';
	var loginUserType = '';
	
	jQuery(document).ready(function() {
		if ( isApp == 'Y' && Android && Android != null && typeof Android != 'undefined')
		{	
		}
	});

</script>

<style type="text/css">


.content{
	height:300px;
}

.msg{
	text-align:center;
	width:100%;
	padding-top:150px;
	color: #7d4f27;
}

.hint{
    border-radius: 5px;
    border: 1px solid gray;
    margin-top:120px;
    margin-left:40px;
    margin-right:40px;
    padding:10px;
    color: #962c58;
    background: #fff9d0;
}

dd{
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>

	<div id="wrapper">

		<div class="content" style="display:none">
		
			<div class="msg">위치전송내역이 없습니다.</div>
			
			<div class="hint">친구끼리 위치를 물어본 내역이<br/>여기에 표시됩니다.</div>
		
		</div>
				
		<div class="content">
		
			<dl>
				<dd>
				abc
				</dd>
				<dd>
				abc
				</dd>
			</dl>
		
		</div>
		
	</div>

</body>
</html>
