<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	HashMap cafeMainInfo = (HashMap) request.getAttribute("cafeMainInfo");
	String mainImageURL = cafeMainInfo.get("url1").toString() + cafeMainInfo.get("url2");
	List<HashMap> cafePublicMeetingList = (List<HashMap>) request.getAttribute("cafePublicMeetingList");
	List<HashMap> cafeMemberList = (List<HashMap>) request.getAttribute("cafeMemberList");
	String cafeMemberCount = request.getAttribute("cafeMemberCount").toString();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common_v2.css?v=2" />
<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafeHome.css" />	

<script language="javascript">
		
	var isApp = '<%= isApp %>';

	function goBoardHome( boardNo, boardName, url )
	{
		var titleUrlEncoded = encodeURIComponent( boardName );
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href="/nearhere/cafe/board/3";
	}
</script>

</head>
<body>

	<div id="wrapper">
		
<%
	if ( !"Y".equals( isApp ) )
	{
%>
		<div class="titleDiv">
			<div class="title">중고나라</div>
			<div id="manage">i</div>
			<div id="setting"><img src="<%= Constants.IMAGE_PATH %>/ic_setting_on.png" width="24" height="24" /></div>
		</div>
	
<%		
	}
%>		
		
		<div class="menu">
		
			<ul>
				<li class="menuItem">
					<a href="" class="link_tab">홈</a>
				</li>
				<li class="menuItem">
					<a href="">게시판</a>
				</li>
				<li class="menuItem">
					<a href="">이미지</a>
				</li>
				<li class="menuItem">
					<a href="">상품</a>
				</li>
			</ul>
		</div>
		
		<div id="cafeInfo">
			
			<% if (!"".equals( mainImageURL ) ) { %>
			<div id="cafeImage">
				<img src="<%= mainImageURL %>" height="140"/>
			</div>
			<% } %>
			
			<div id="cafeDesc">
				<%= cafeMainInfo.get("mainDesc") %>
			</div>
			
			<% if ( cafePublicMeetingList != null && cafePublicMeetingList.size() > 0 ) { %>
			<div id="cafeMeeting">
				정모
				<ul class="slide_lst2">
				
					<% for ( int i = 0; i < cafePublicMeetingList.size(); i++ ) {
						
						HashMap meeting = cafePublicMeetingList.get(i);
						String dateString = meeting.get("meetingDate").toString();
						Date meetingDate = Util.getDateFromString(dateString, "yyyy-MM-dd HH:mm:ss");
						String regionName = meeting.get("regionName").toString();
					%>
					<li>
						<div class="date">
							<%= Util.getDateDay( meetingDate ) %>요일<br>
							<%= Util.getDate(meetingDate ) %><br>
							<%= Util.getDateStringFromDate(meetingDate, "HH:mm") %>
						</div>
						<div class="postTitle">
							<%= meeting.get("title") %>
						</div>
						<div class="cafeName">
							<%= meeting.get("cafeName") %>
						</div>
						<div class="regionName">
							<%= regionName %>
						</div>
					</li>
					<% } %>
					
					<div id="btnMakeMeeting">정모만들기</div>
				</ul>
			</div>
			
			<% } %>
			
			<% if ( cafeMemberList != null && cafeMemberList.size() > 0 ) {
			%>
			<div id="cafeMemberInfo">
				카페 멤버<span id="membCnt">(<%= cafeMemberCount %>명)</span>
				<ul>
					<% for ( int i = 0; i < cafeMemberList.size(); i++ ) { 
						HashMap member = cafeMemberList.get(i);
					%>
					<li>
						<div id="imgProfile">
							<img src="<%= Constants.getThumbnailImageSSLURL() %>/<%= member.get("profileImageURL") %>" 
							width=60 height=60/>
						</div>
						<div id="memberInfo">
							<div><%= member.get("userName") %></div>
						</div>
					</li>
					<% } %>
				</ul>
			</div>
			
			<% } %>
			
			<div id="cafeButtons">
				<div id="btnRegister">가입하기</div>
				<div id="btnRetire">탈퇴하기</div>
				<div id="btnManage">관리하기</div>
			</div>
		</div>
		
	</div>

	
	
</body>
</html>