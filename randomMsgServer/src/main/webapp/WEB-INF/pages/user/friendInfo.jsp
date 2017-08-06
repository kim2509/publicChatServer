<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");

	List<HashMap> friendList = null;
	if ( request.getAttribute("friendList") != null )
		friendList = (List<HashMap>) request.getAttribute("friendList");
	
	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
%>
<html>

<head>
<title>이근처</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/common.css" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/userInfo.css?v=3" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/searchDestination.css?v=4" />
<link rel="stylesheet" href="<%=Constants.CSS_PATH%>/w3.css">
		
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>	

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

	
	});
	
	function goUserInfo( userID )
	{
		document.location.href='<%= userInfoPage %>' + '?userID=' + userID;
	}
	
</script>

<jsp:include page="../common/common.jsp" flush="true"></jsp:include>

</head>
<body>

	<div id="wrapper" style="margin:10px;">

		<div class="section">
			
			<div id="menu_category">
				<div class="title"><span class="s_tit">친구정보</span></div>
			</div>

			<div id="content">

<%	if ( friendList == null || friendList.size() == 0 ) { %>			
				친구 정보가 없습니다.
<%	} else { %> 

				<dl>
	
<%		for ( int i = 0; i < friendList.size(); i++ ) {
%>
				<dd onclick="goUserInfo('<%= friendList.get(i).get("userID") %>')">
					<div style="float:left;">
						<img src='<%= Constants.getThumbnailImageURL() %>/<%= friendList.get(i).get("profileImageURL") %>'
							style="border-radius: 10px;" 
							width="60" height="60" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
					</div>
					<div style="margin-left:80px;height:80px;">
						<div><%= friendList.get(i).get("userName") %></div>
					</div>
				</dd>
<% 		} %>
				</dl>
<%
	} 
%>			
			</div>

		</div>
	
	</div>

</body>
</html>
