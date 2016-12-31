<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	HashMap cafeMainInfo = (HashMap) request.getAttribute("cafeMainInfo");
	String mainImageURL = cafeMainInfo.get("url1").toString() + cafeMainInfo.get("url2");
	List<HashMap> cafePublicMeetingList = (List<HashMap>) request.getAttribute("cafePublicMeetingList");
	List<HashMap> cafeMemberList = (List<HashMap>) request.getAttribute("cafeMemberList");
	String cafeMemberCount = request.getAttribute("cafeMemberCount").toString();
%>

<script language="javascript">
	function goMeetingDetail( cafeID, meetingNo )
	{
		var url = '<%= Constants.getServerURL() + "/cafe/meetingDetail.do" %>?cafeID=' +
				cafeID + '&meetingNo=' + meetingNo + "&userID=" + userID;
	
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
</script>

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
					<li onclick="goMeetingDetail('<%= meeting.get("cafeID") %>', '<%= meeting.get("meetingNo") %>');">
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