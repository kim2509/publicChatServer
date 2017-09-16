<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String version = request.getParameter("appVersion");
	double appVersion = 0;
	if ( !Util.isEmptyString(version) )
		appVersion = Double.parseDouble(version);
%>

<script language="javascript">

function goKaraoke(){
	document.location.href='nearhere://openExternalURL?url=' + 
			encodeURIComponent('https://play.google.com/store/apps/details?id=com.tessoft.mykaraoke');
}

</script>

<% if ( appVersion > 2.0 ) { %>
	<div style="height:120px;width:100%;margin-bottom:10px;"
	onclick="goKaraoke();">
		<img src="<%= Constants.IMAGE_PATH %>/ad_karaoke.png" style="border-radius:10px;" 
		width="100%" height="100%"/>
	</div>
<% } %>