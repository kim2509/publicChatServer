<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String errMsg = request.getAttribute("errMsg").toString();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>오류</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafe.css" />

<script language="javascript">

	var isApp = '<%= isApp %>';

	function goBack()
	{
		try
		{
			alert('<%= errMsg %>');
			window.history.back();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
</script>

</head>
<body>

	<script language="javascript">
		goBack();
	</script>

</body>
</html>