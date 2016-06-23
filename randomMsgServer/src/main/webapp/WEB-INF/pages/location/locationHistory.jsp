<!DOCTYPE html> 
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");

	HashMap userInfo = null;
	String loginUserID = "";
	
	if ( request.getAttribute("userInfo") != null )
	{
		userInfo = (HashMap) request.getAttribute("userInfo");
		loginUserID = userInfo.get("userID").toString();
	}
	
	List<HashMap> locationHistory = null;
	if ( request.getAttribute("locationHistory") != null )
		locationHistory = (List<HashMap>) request.getAttribute("locationHistory");
	
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	
	function respondLocationRequest()
	{
		if ( isApp == 'Y' && Android && Android != null && typeof Android != 'undefined')
		{
			Android.respondLocationRequest();
		}
	}

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

#wrapper{
	background:#eeeeee;
}
</style>

</head>
<body>

	<div id="wrapper" data-role="page">

<% if ( locationHistory == null || locationHistory.size() == 0 ) { %>
		<div class="content">
		
			<div class="msg">위치전송내역이 없습니다.</div>
			
			<div class="hint">친구끼리 위치를 물어본 내역이<br/>여기에 표시됩니다.</div>
		
		</div>
<% 
	} else {
%>				
		<div class="content" style="padding:10px;">
		
			<ul data-role="listview" data-inset="true">
			<% 
				for ( int i = 0; i < locationHistory.size(); i++ ) {
					
					HashMap item = locationHistory.get(i);
					
					String profileImageURL = item.get("profileImageURL").toString();
					String userName = item.get("userName").toString();
					String status = "";
					int clickType = 0;
					
					if ( "Y".equals( item.get("senderYN") ) )
					{
						if ( "0".equals( item.get("status").toString() ) )
							status = "님에게 위치 물어보는중";
						else
							status = "";
					}
					else
					{
						if ( "0".equals( item.get("status").toString() ) )
						{
							status = "님이 고객님의 위치를 물어봅니다.";
							clickType = 1;
						}
						else
							status = "";
					}
					
			%>
				<li>
					<% if ( clickType == 1 ) { %>
					<a href="javascript:void(0)" onclick="respondLocationRequest();">
					<%} %>
						<img src='<%= Constants.getThumbnailImageURL() %>/<%= profileImageURL %>' width="100" height="100"
							onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
					<h2><%= userName %></h2><p><%= status %></p>
					<p class="ui-li-aside">06-19 19:30</p>
					<% if ( clickType == 1 ) { %>
					</a>
					<%} %>
				</li>
				<li data-icon="info"><a href="">
						<img src='<%= Constants.getThumbnailImageURL() %>/user3984.png' width="100" height="100"
							onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
					<h2>김영조</h2><p>님의 위치가 도착했습니다</p>
					<p class="ui-li-aside">06-19 19:30</p>
					</a>
				</li>
				<li>
					<a href="">
						<img src='<%= Constants.getThumbnailImageURL() %>/user3982.png' width="100" height="100"
							onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
					<h2>오동욱</h2><p>님이 김대용님의 위치를 물어봅니다.</p>
					<p class="ui-li-aside">06-19 19:30</p>
					</a>
				</li>
				<li>
					
						<img src='<%= Constants.getThumbnailImageURL() %>/user3980.png' width="100" height="100"
							onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
					<h2>오동욱</h2><p>님에게 위치를 전송했습니다.</p>
					<p class="ui-li-aside">06-19 19:30</p>
					
				</li>
			<% } %>
			</ul>
		
		</div>
<% } %>		
	</div>

</body>
</html>
