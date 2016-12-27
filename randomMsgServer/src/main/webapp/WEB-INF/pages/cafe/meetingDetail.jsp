<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	HashMap meetingInfo = (HashMap) request.getAttribute("meetingInfo");
	List<HashMap> meetingMembers = (List<HashMap>) request.getAttribute("meetingMembers");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>정모 상세</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/meetingDetail.css" />

</head>

<script language="javascript">
	
	jQuery(document).ready(function(){
		console.log( 'ready' );	
	});
	
	
</script>
<body>

	<div id="wrapper">
	
		<div id="Navi">
			<div id="naviTitle">&lt; 정모 상세</div>
		</div>

		<div id="HeaderDiv">
			<div id="title"><%= meetingInfo.get("title") %></div>
			
			<div id="info">
				<span><%= meetingInfo.get("meetingDate") %></span> | 
				<span>최대인원 : <%= meetingInfo.get("maxNo") %></span> | <span>참석인원 : <%= meetingInfo.get("curNo") %></span>
			</div>
		</div>
		
		<div>
			<ul>
				<% for ( int i = 0; i < meetingMembers.size(); i++ ) {
					HashMap meetingMember = meetingMembers.get(i);
				%>
					<li>
					<img src="<%= Constants.getThumbnailImageSSLURL() %>/<%= meetingMember.get("profileImageURL") %>" 
							width=60 height=60/>
					<%= meetingMember.get("userName") %>
					<%= meetingMember.get("memberType") %>
					</li>
				<% } %>
			</ul>
		</div>
	</div>
	
</body>
</html>