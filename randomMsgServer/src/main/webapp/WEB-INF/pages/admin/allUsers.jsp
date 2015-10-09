<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">
	
</script>

</head>
<body>

	<table>
		<tr>
			<th>userID</th>
			<th>userName</th>
			<th>Type</th>
			<th>image</th>
			<th>CreatedDate</th>
			<th>isDeleted</th>
		</tr>

		<%
			for (int i = 0; i < userList.size(); i++) {
		%>
		<tr>
			<td style="padding:5px;"><%=userList.get(i).getUserID()%></td>
			<td style="padding:5px;"><%=userList.get(i).getUserName()%></td>
			<td style="padding:5px;"><%=userList.get(i).getType()%></td>
			<td style="padding:5px;">
			<% 
				if ( Util.isEmptyString( userList.get(i).getKakaoProfileImageURL() ) )
					out.println("이미지 없음");
				else
				{
			%>
					<a href="<%=userList.get(i).getKakaoProfileImageURL()%>">이미지 보기</a></td>
			<%	
				}
			%>
			<td style="padding:5px;"><%=userList.get(i).getCreatedDate()%></td>
			<td style="padding:5px;"><%=userList.get(i).getIsDeleted()%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>