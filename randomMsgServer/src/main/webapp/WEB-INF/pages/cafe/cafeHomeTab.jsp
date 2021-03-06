<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	HashMap cafeMainInfo = (HashMap) request.getAttribute("cafeMainInfo");
	String mainImageURL = Util.getStringFromHash(cafeMainInfo, "mainImageURL");
	List<HashMap> cafePublicMeetingList = (List<HashMap>) request.getAttribute("cafePublicMeetingList");
	
	int totalCafeMeetingCount = Integer.parseInt(request.getAttribute("totalCafeMeetingCount").toString());
	int upcomingCafePublicMeetingCount = Integer.parseInt(request.getAttribute("upcomingCafePublicMeetingCount").toString());
	List<HashMap> cafeMemberList = (List<HashMap>) request.getAttribute("cafeMemberList");
	String cafeMemberCount = request.getAttribute("cafeMemberCount").toString();
	int totalCafeMemberCount = Integer.parseInt(cafeMemberCount);
	
	String publishYN = Util.getStringFromHash(cafeMainInfo, "publishYN");
	
	HashMap cafeUserInfo = (HashMap) request.getAttribute("cafeUserInfo");
	String ownerYN = "N";
	String memberYN = "N";
	String memberType = "";
	if ( cafeUserInfo != null )
	{
		ownerYN = cafeUserInfo.get("ownerYN").toString();
		memberYN = cafeUserInfo.get("memberYN").toString();
		memberType = cafeUserInfo.get("memberType").toString();
	}
%>

<script language="javascript">

	var ownerYN = '<%= ownerYN %>';
	var memberYN = '<%= memberYN %>';
	var memberType = '<%= memberType %>';
	var publicMeetingMakeModal = null;
	
	jQuery(document).ready( function(){
		
		if (ownerYN == 'N' && memberYN == 'N' ) {
			$('#btnRegister').show();
			$('#btnRetire').hide();
		}
		else if ( ownerYN == 'N' && memberYN == 'Y' ) {
			$('#btnRegister').hide();
			$('#btnRetire').show();
		}
	
		// 모달창 인스턴트 생성
		publicMeetingMakeModal = new Example.Modal({
		    id: "publicMeetingMakeDiv" // 모달창 아이디 지정
		});
		
	});
	
	function registerCafeMember()
	{
		if ( confirm('가입하시겠습니까?') )
		{
			var param = {"cafeID":"<%= cafeMainInfo.get("cafeID") %>" };
			ajaxRequest('POST', '/nearhere/cafe/registerCafeMemberAjax.do', param , onRegisterCafeMemberResult );	
		}
	}
	
	function onRegisterCafeMemberResult( result )
	{
		if ( result != null && result.resCode == '0000' )
		{
			alert('성공적으로 가입되었습니다.');
			location.reload();
		}
		else if ( result != null )
		{
			alert( result.resMsg );
		}
		else
		{
			alert('가입 도중 오류가 발생했습니다. 관리자에게 문의해 주시기 바랍니다.');
		}
	}
	
	function cancelCafeMember()
	{
		if ( confirm('탈퇴하시겠습니까?') )
		{
			var param = {"cafeID":"<%= cafeMainInfo.get("cafeID") %>" };
			ajaxRequest('POST', '/nearhere/cafe/cancelCafeMemberAjax.do', param , onCancelCafeMemberResult );	
		}
	}
	
	function onCancelCafeMemberResult( result )
	{
		if ( result != null && result.resCode == '0000' )
		{
			alert('성공적으로 탈퇴되었습니다.');
			location.reload();
		}
		else if ( result != null )
		{
			alert( result.resMsg );
		}
		else
		{
			alert('가입 도중 오류가 발생했습니다. 관리자에게 문의해 주시기 바랍니다.');
		}
	}
	
	function goMakePublicMeeting()
	{
		var url = '<%= Constants.getServerURL() + "/cafe/makePublicMeeting.do" %>?cafeID=' + cafeID;

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
</script>

		<div id="cafeInfo">
		
			<% if (!"Y".equals( publishYN )) {%>
			<div id="cafeStatus">
			카페가 비공개 상태입니다.<br/>관리하기 메뉴에서 공개로 전환가능합니다.
			</div>
			<% } %>
			
			<% if (!"".equals( mainImageURL ) ) { %>
			<div id="cafeImage">
				<img src="<%= mainImageURL %>" height="140"/>
			</div>
			<% } %>
			
			<% if ( !Util.isEmptyString(cafeMainInfo.get("mainDesc"))) {
			%>
			<div id="cafeDesc">
				<%= cafeMainInfo.get("mainDesc") %>
			</div>
			<% } else { %>
				<div class="emptyDiv">카페 정보가 설정되지 않았습니다.<br/>관리하기 메뉴에서 설정할 수 있습니다.</div>
			<% } %>
			
			<% if ( cafePublicMeetingList != null && cafePublicMeetingList.size() > 0 ) { %>
			<div id="cafeMeeting">
				정모
				<ul class="meetingListUL">
				
					<% for ( int i = 0; i < cafePublicMeetingList.size(); i++ ) {
						
						HashMap meeting = cafePublicMeetingList.get(i);
						String dateString = meeting.get("meetingDate").toString();
						Date meetingDate = Util.getDateFromString(dateString, "yyyy-MM-dd HH:mm:ss");
					%>
					<li onclick="goMeetingDetail('<%= meeting.get("cafeID") %>', '<%= meeting.get("meetingNo") %>');">
						
						<div id="title"><%= Util.getStringFromHash(meeting, "title") %></div>
						<div id="meetingDate"><%= Util.getDateStringFromDate(meetingDate, "MM-dd HH:mm") %></div>
						<div id="memberCount">
							참석인원 : <%= Util.getStringFromHash(meeting, "cntMembers") %>/<%= Util.getStringFromHash(meeting, "maxNo") %>
						</div>
						<div id="cafeName"><%= Util.getStringFromHash(meeting, "cafeName") %></div>
						<div id="location"><%= Util.getStringFromHash(meeting, "regionName") %></div>
					</li>
					<% } %>
				</ul>
			</div>
			
			<% if ( totalCafeMeetingCount > 0 || upcomingCafePublicMeetingCount > 3 ){ %>
				<div class="moreDiv" onclick="goMoreCafeMeetingList( cafeID );">더 보기</div>
			<% } %>
			
			<% } %>
			
			<% if ( "Y".equals(ownerYN) || "Y".equals(memberYN) && Constants.CafeMemberTypeOperator.equals( memberType ) ) { %>
				<div id="btnMakeMeeting" onclick="goMakePublicMeeting();">정모만들기</div>
			<% } %>
			
			<% if ( cafeMemberList != null && cafeMemberList.size() > 0 ) {
			%>
			<div id="cafeMemberInfo">
				카페 멤버<span id="membCnt">(<%= cafeMemberCount %>명)</span>
				<ul>
					<% for ( int i = 0; i < cafeMemberList.size(); i++ ) { 
						HashMap member = cafeMemberList.get(i);
					%>
					<li onclick="openUserProfile('<%= Util.getStringFromHash(member, "userID") %>')">
						<div id="imgProfile">
							<img src="<%= Constants.getThumbnailImageURL() %>/<%= member.get("profileImageURL") %>" 
							width=60 height=60
							onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
						</div>
						<div id="memberInfo">
							<div id="memberName"><%= member.get("userName") %></div>
							<div id="memberType"><%= Util.getStringFromHash(member, "memberType") %></div>
						</div>
					</li>
					<% } %>
				</ul>
			</div>
			
			<% if ( totalCafeMemberCount > 6 ){ %>
				<div class="moreDiv" onclick="goMoreCafeMemberList( cafeID );">더 보기</div>
			<% } %>
			
			<% } %>
			
			<div id="cafeButtons">
			
			<div id="btnRegister" onclick="registerCafeMember();">가입하기</div>
			<div id="btnRetire" onclick="cancelCafeMember();">탈퇴하기</div>
			
			<% if ( "Y".equals(ownerYN) || "Y".equals(memberYN) && Constants.CafeMemberTypeOperator.equals( memberType ) ) { %>
				<div id="btnManage" onclick="goCafeManage('<%= cafeMainInfo.get("cafeID") %>');">관리하기</div>
			<% } %>
			
			</div>
		</div>		