<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%
	Notice notice = (Notice) request.getAttribute("notice");
	String title = notice.getTitle();
	String content = notice.getContent().replaceAll("\\r", "");
	content = content.replaceAll("\\n", "<br/>");
%>
<html>
<body>

<div style="font-size:14px;">
<%= content %>
</div>

</body>
</html>