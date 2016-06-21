<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String host = request.getAttribute("host").toString();
	ArrayList<HashMap<String, String>> items = (ArrayList<HashMap<String, String>>) request.getAttribute("items");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	for ( int i = 0; i < items.size(); i++ ) {
		
		HashMap<String,String> hash = items.get(i);
		String link = hash.get("link");
		
		if ( link.startsWith("javascript:") ) continue;
		
		if ( link.toLowerCase().startsWith("http") == false )
			link = host + link;
%>
		<a href="<%= link %>"><%= hash.get("title") %></a><br/>		
<%
	}
%>

</body>
</html>