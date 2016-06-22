<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ArrayList<HashMap> items = (ArrayList<HashMap>) request.getAttribute("items");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>

<style type="text/css">

span{ padding:5px; }

</style>

</head>
<body>

<%
	for ( int i = 0; i < items.size(); i++ ) {
		
		HashMap<String,String> hash = items.get(i);
		String link = hash.get("link");
%>
		<span><%= hash.get("regionName") %></span><a href="<%= link %>"><%= hash.get("title") %></a><br/>		
<%
	}
%>

</body>
</html>