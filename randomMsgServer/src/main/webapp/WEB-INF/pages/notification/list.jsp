<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");

	List<HashMap> userPushMessageList = null;
	if ( request.getAttribute("userPushMessageList") != null )
		userPushMessageList = (List<HashMap>) request.getAttribute("userPushMessageList");
	
%>
<html>

<head>
<title>이근처</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.SECURE_CSS_PATH%>/common.css" />
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/handlebars-v3.0.3.js"></script>
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/jquery.lazyload.min.js"></script>	
<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

	
	});
	
	function viewPost( postID, element )
	{
		if ( isApp == 'Y' )
		{
			document.location.href='nearhere://viewPost?postID=' + postID;
		}
		
		$(element).find('#new').hide();
	}
	
	function goEventViewer( pushNo, param1, element )
	{
		var url = '<%= Constants.getServerURL() + "/taxi/eventDetail.do" %>';
		url += '?eventSeq=' + param1 + '&pushNo=' + pushNo;
		
		if ( isApp == 'Y' )
		{
			document.location.href='nearhere://openURL?title=' + encodeURIComponent('이벤트') + '&url=' + encodeURIComponent(url);
		}
		
		$(element).find('#new').hide();
	}
	
	function goMemberList( element, pushNo, cafeID )
	{
		$(element).find('#new').hide();
		var param = {"cafeID":cafeID, "pushNo":pushNo};
		ajaxRequest('POST', '/nearhere/notification/updatePushMessageAsReadAjax.do', param , onPushReadResult );
		
		goMoreCafeMemberList( cafeID );
	}
	
	function onPushReadResult( result )
	{
		document.location.reload();
	}
	
	function goCafeBoardPostDetail( element, pushNo, postNo )
	{
		$(element).find('#new').hide();
		var param = {"pushNo":pushNo};
		ajaxRequest('POST', '/nearhere/notification/updatePushMessageAsReadAjax.do', param , onPushReadResult );
		
		goPostDetail( postNo );
	}
	
</script>

<style type="text/css">
	dd{
	    border-bottom: 1px solid #ccc;
	    padding-top:10px;
	    padding-bottom:10px;
	    padding-left:10px;
	    padding-right:10px;
	}
	
	dd div{
		font-size:14px;
	}
</style>

<jsp:include page="../common/common.jsp" flush="true"></jsp:include>

</head>
<body>

	<div id="wrapper">

<%		if ( userPushMessageList != null && userPushMessageList.size() > 0 ) { %>
		<dl>
		<%	for ( int i = 0; i < userPushMessageList.size(); i++ ) {
			String script = "";
			
			HashMap message = userPushMessageList.get(i);
			
			String type = Util.getStringFromHash(message, "type");
			String param1 = Util.getStringFromHash(message, "param1");
			String pushNo = Util.getStringFromHash(message, "pushNo");
			
			
			if ( "newPostByDistance".equals( type ) || "postReply".equals( type ) )
			{
				script = "viewPost('" + param1 + "', this );";
			}
			else if ( "event".equals( type ) || "eventssl".equals( type ))
			{
				script = "goEventViewer('" + message.get("pushNo") + "', '" + param1 + "', this );"; 				
			}
			else if ("newMember".equals( type ) || "memberLeave".equals(type) )
			{
				script = "goMemberList( this, '" + pushNo + "', '" + param1 + "')";
			}
			else if ("newCafeBoardPostReply".equals( type ))
			{
				script = "goCafeBoardPostDetail( this, '" + pushNo + "', '" + param1 + "')";
			}
		%>
			<dd>
				<div onclick="<%= script %>">
				<div >
				<% if ( "N".equals( message.get("isRead") ) ) { %>
				<span style="color:red;padding-right:5px;" id="new">(N)</span>
				<% } %>
				<%= message.get("message") %></div>
				<div style="margin-top:10px;"><%= message.get("createdDate").toString().substring(0,10) %></div>
				</div>
			</dd>
		<%	} %>
		</dl>
<%		} else { %>
		<div style="height:100%;text-align:center;padding-top:180px;">새로운 알림이 없습니다.</div>
<%		} %>
	</div>

</body>
</html>
