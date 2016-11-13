<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");

	HashMap userInfo = null;
	if ( request.getAttribute("userInfo") != null )
		userInfo = (HashMap) request.getAttribute("userInfo");
	
	List<HashMap> userLocationList = null;
	if ( request.getAttribute("userLocationList") != null )
		userLocationList = (List<HashMap>) request.getAttribute("userLocationList");
	
	List<HashMap> friendList = null;
	if ( request.getAttribute("friendList") != null )
	{
		friendList = (List<HashMap>) request.getAttribute("friendList");
	}
	
	List<HashMap> userPostList = null;
	if ( request.getAttribute("userPostList") != null )
		userPostList = (List<HashMap>) request.getAttribute("userPostList");
	
	String userID = userInfo.get("userID").toString();
	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
	String friendInfoPage = Constants.getServerSSLURL() + "/user/friendInfo.do?userID=" + userID;
	String profilePoint = userInfo.get("profilePoint").toString();
	
%>
<html>

<head>
<title>이근처</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css" href="<%=Constants.SECURE_CSS_PATH%>/common.css" />
<link rel="stylesheet" type="text/css" href="<%=Constants.SECURE_CSS_PATH%>/userInfo.css?v=3" />
<link rel="stylesheet" type="text/css" href="<%=Constants.SECURE_CSS_PATH%>/searchDestination.css?v=4" />
<link rel="stylesheet" href="<%=Constants.SECURE_CSS_PATH%>/w3.css">
		
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/handlebars-v3.0.3.js"></script>
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery.lazyload.min.js"></script>	

<script language="javascript">

	var isApp = '<%= isApp %>';
	var loginID = '';
	var loginUserType = '';
	
	jQuery(document).ready(function() {
		if ( isApp == 'Y' && Android && Android != null && typeof Android != 'undefined')
		{	
			loginID = Android.getUserID();
			loginUserType = Android.getUserType();
			
			if ( loginUserType == 'Guest' )
			{
				$('#btnFriendAsk').hide();
				$('#btnFriendAsking').hide();
				return;
			}

			var requestParam = {"userID": loginID, "userID2":"<%= userID %>" };
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/friend/getFriendStatus.do",
				data : JSON.stringify( requestParam ),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( result.resCode != '0000' ) return;
						
						if ( result.data == '' )
						{
							$('#btnFriendAsk').show();
							$('#btnFriendAsking').hide();
						}
						else if ( result.data == '0' )
						{
							$('#btnFriendAsk').hide();
							$('#btnFriendAsking').show();
						}
						
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
					bLoading = false;
				},
				error : function(xhr, status, error) {
					alert("에러발생(getFriendStatus)" + error );
				}
			});
		}
	});

	function openUserProfile( userID )
	{
		var url = '<%= userInfoPage %>' + '?userID=' + userID;
		
		document.location.href='nearhere://openURL?title=' + encodeURIComponent('사용자정보') + '&url=' + encodeURIComponent(url);
	}
	
	function goFriendInfo()
	{
		document.location.href='<%= friendInfoPage %>';
	}
	
	function goUserInfo( userID )
	{
		document.location.href='<%= userInfoPage %>' + '?userID=' + userID;
	}
	
	function goVIP(postID)
	{
		document.location.href='nearhere://viewPost?postID=' + postID;
	}
	
	function openPhotoViewer( url )
	{
		document.location.href='nearhere://openPhotoViewer?url=' + url;
	}
	
	function goFacebook( url )
	{
		document.location.href='nearhere://openExternalURL?url=' + encodeURIComponent(url);
	}
	
	function goUserMessageActivity()
	{
		if ( isApp == 'Y' && Android && Android != null && typeof Android != 'undefined')
		{
			var userType = Android.getUserType();
			if ( userType != 'Normal' )
			{
				alert('SNS 연동후에 이용가능합니다.');
				return;
			}
			
			document.location.href='nearhere://goUserMessageActivity?userID=<%= userInfo.get("userID") %>';
		}
	}
	
	function askFriendRequest()
	{
		if ( confirm('친구요청을 하시겠습니까?') )
		{
			var requestParam = {"userID": loginID, "userID2":"<%= userID %>" };
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/friend/askFriendRequest.do",
				data : JSON.stringify( requestParam ),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( result.resCode != '0000' ) return;
						
						$('#btnFriendAsk').hide();
						$('#btnFriendAsking').show();
						
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
					bLoading = false;
				},
				error : function(xhr, status, error) {
					alert("에러발생(askFriendRequest)" + error );
				}
			});
		}
	}
	
</script>

</head>
<body>

	<div id="wrapper" style="margin:10px;">

<%		if ( userInfo != null ) { %>
		<div class="section">
			
			<div id="menu_category">
				<div class="title"><span class="s_tit">사용자 정보</span></div>
			</div>
			
			<div id="content">
			
				<div>
					<div onclick="openPhotoViewer('<%= userInfo.get("profileImageURL") %>')">
						<img class="userProfile" src='<%= Constants.getThumbnailImageSSLURL() %>/<%= userInfo.get("profileImageURL") %>' 
							width="100" height="100" onError="this.src='<%= Constants.SECURE_IMAGE_PATH %>/no_image.png';"/>
					</div>
					
					<div id="userInfoTop">
						<div class="p5" style="padding-top:10px;">
							<%= userInfo.get("userName") %>
							<span>
							<% if ("M".equals( userInfo.get("sex") ) ) { %>
							<img class="sex" src="/nearhere/image/ic_male.png" width="15" height="15">
							<% } else if ( "F".equals( userInfo.get("sex") ) ) { %>
							<img class="sex" src="/nearhere/image/ic_female.png" width="15" height="15">
							<% } %>
							
							<% if ( !Util.isEmptyString( userInfo.get("kakaoID") ) ) { %>
								<img src="/nearhere/image/kakaotalk_icon.png" width="18" height="18" id="kakao">
							<% } %>
							<% if ( !Util.isEmptyString( userInfo.get("facebookID") ) ) { %>
								<img src="/nearhere/image/facebook_icon.png" width="18" height="18" id="kakao">
							<% } %>
							
							</span>
						</div>
						<div class="p5" style="margin-top:10px;">프로필 완성도</div>
						<div class="w3-progress-container" style="margin-top:5px;margin-left:5px;">
							<div id="myBar" class="w3-progressbar w3-green w3-round" style="width:<%= profilePoint%>%">
								<div class="w3-center w3-text-white" style="padding-top:2px;"><%= profilePoint %>%</div>
							</div>
						</div>
					</div>
				</div>
				
				<div>
				
					<table>
						<colgroup>
							<col width="90px;"/>
						</colgroup>
						<% if ( !Util.isEmptyString(userInfo.get("facebookURL") ) ) { %>
						<tr>
							<td class="td1">Facebook</td>
							<td class="td2" style="color:#4e88cf;font-weight:bold;" onclick="goFacebook('<%= userInfo.get("facebookURL") %>');">
								페이스북 바로가기
							</td>
						</tr>
						<% } %>
						<% if ( !Util.isEmptyString(userInfo.get("sex") ) ) { %>
						<tr>
							<td class="td1">성별</td>
							<td class="td2"><%= "M".equals( userInfo.get("sex") ) ? "남자":"여자" %></td>
						</tr>
						<% } %>
						<% if ( !Util.isEmptyString(userInfo.get("age") ) ) { %>
						<tr>
							<td class="td1">나이</td>
							<td class="td2">
								<% if ( userInfo.get("age") != null ) { %>									
									<%= userInfo.get("age") %>세									
								<% }  %>
							</td>	
						</tr>
						<% } %>
<%						if ( userLocationList != null && userLocationList.size() > 0 ) {
							for ( int i = 0; i < userLocationList.size(); i++ ) {
								
								if ("현재위치".equals( userLocationList.get(i).get("locationName") ) ) continue;
%>						
						<tr>
							<td class="td1"><%= userLocationList.get(i).get("locationName") %> 위치</td>
							<td class="td2"><%= userLocationList.get(i).get("address") %></td>
						</tr>
<%
							}
						} 
%>						
						<% if ( !Util.isEmptyString(userInfo.get("jobTitle") ) ) { %>
						<tr>
							<td class="td1">직업</td>
							<td class="td2">
								<%= userInfo.get("jobTitle") %>
							</td>
						</tr>
						<% } %>
					</table>
					
					<div class="btn" onclick="goUserMessageActivity();">메세지</div>
					
					<% if ( Double.parseDouble( userInfo.get("appVersion").toString() ) >= 1.53 ) { %>
					<div class="btn" id='btnFriendAsk' onclick="askFriendRequest();" style="display:none;">친구요청</div>
					<% } %>
					
					<div class="btn" id='btnFriendAsking' style="background:gray;inline-block;display:none;">요청중</div>
				</div>
			
			</div>
			
		</div>

		<div class="section">
			
			<div id="menu_category">
				<div class="title"><span class="s_tit">친구</span></div>
			</div>

			<div id="content" style="padding:0px;">

<%	if ( friendList == null || friendList.size() == 0 ) { %>			
				<div style="padding:10px;">친구 정보가 없습니다.</div>
<%	} else { %> 

				<dl>
	
<%		for ( int i = 0; i < friendList.size(); i++ ) {
				if ( i > 2 ) break;
%>
				<dd onclick="goUserInfo('<%= friendList.get(i).get("userID") %>')">
					<div style="float:left;">
						<img src='<%= Constants.getThumbnailImageSSLURL() %>/<%= friendList.get(i).get("profileImageURL") %>'
							style="border-radius: 10px;" 
							width="60" height="60" onError="this.src='<%= Constants.SECURE_IMAGE_PATH %>/no_image.png';"/>
					</div>
					<div style="margin-left:80px;height:80px;">
						<div><%= friendList.get(i).get("userName") %></div>
					</div>
				</dd>
<% 		} %>
				</dl>
<%
		if ( friendList.size() > 3 )
		{
%>
				<div style="text-align:center;color:#4e88cf;font-weight:bold;padding:10px;" onclick="goFriendInfo();">더 보기</div>
<%			
		}
	} 
%>			
			</div>

		</div>
		
		<div class="section">
			
			<div id="menu_category">
				<div class="title"><span class="s_tit">최근 카풀(합승) 내역</span></div>
			</div>
			
			<div>
			
<%				if ( userPostList != null && userPostList.size() > 0 ) { %>				
				<div id="postList">
					<dl class="slide_lst">
<%					for ( int i = 0; i < userPostList.size(); i++ ) {
	
						HashMap post = userPostList.get(i);
						HashMap user = null;
						String userName = "";
						String departureDateTime = "";
						String readCount = "";
						String vehicle = post.get("vehicle").toString();
						String fareOption = post.get("fareOption").toString();
						String repetitiveYN = "";
						
						if ( post.get("user") != null )
						{
							user = (HashMap) post.get("user");
							userName = user.get("userName").toString();
						}
						
						if ( post.get("departureDateTime") != null )
						{
							departureDateTime = post.get("departureDateTime").toString();
							if ( departureDateTime.length() >= 16 )
								departureDateTime = departureDateTime.substring(0, 16);
						}
						
						if ( !Util.isEmptyString( post.get("readCount") ) )
						{
							int count = Integer.parseInt( post.get("readCount").toString() );
							if ( count > 0 )
								readCount = String.valueOf( count );
						}
						
						if ( !Util.isEmptyString( post.get("repetitiveYN") ) && "Y".equals( post.get("repetitiveYN") ))
						{
							repetitiveYN = "반복";
						}
%>					
						<dd style="height:100px;">
							<div class="imgStatus">
								<img src="/nearhere/image//progressing.png" width="50" height="50">
							</div>
							<div class="userProfile">
								<img src='<%= Constants.getThumbnailImageSSLURL() %>/<%= user.get("profileImageURL") %>' 
									width="70" height="70" onError="this.src='<%= Constants.SECURE_IMAGE_PATH %>/no_image.png';"/>
								<% if ( !Util.isEmptyString( user.get("kakaoID") ) ) { %>
									<img src="/nearhere/image//kakaotalk_icon.png" width="18" height="18" id="kakao">
								<% } %>
							</div>
							<div class="postDesc" onclick="goVIP('<%= post.get("postID") %>')">
								
								<strong class="tit"><%= post.get("message") %></strong>
								<div id="departureDateTime"><%= departureDateTime %></div>
								<div id="readCount">조회수: <%= readCount %></div>
								<div id="personInfo">
									<div id="userSex">
										<% if ("M".equals( user.get("sex") ) ) { %>
										<img class="sex" src="/nearhere/image//ic_male.png" width="15" height="15">
										<% } else if ( "F".equals( user.get("sex") ) ) { %>
										<img class="sex" src="/nearhere/image//ic_female.png" width="15" height="15">
										<% } %>
									</div>
									<div id="userName"><%= userName %></div>
								</div>
								<div id="tags">
								<% if ( !Util.isEmptyString(vehicle) ) { %>
									<span><%= vehicle %></span>
								<% } %>	
								<% if ( !Util.isEmptyString(fareOption) ) { %>
									<span><%= fareOption %></span>
								<% } %>	
								<% if ( !Util.isEmptyString(repetitiveYN) ) { %>
									<span><%= repetitiveYN %></span>
								<% } %>	
								</div>
							</div>
						</dd>
<%					} %>						
					</dl>					
				</div>
<%				} else { %>

				<table style="width:100%;">
					<tr><td style="text-align:center;padding-top:10px;padding-bottom:10px;">내역이 없습니다.</td></tr>
				</table>
				
<%				} %>				
			</div>
			
		</div>

<%		} else { %>
		
		<div class="section">
		
			<div id="content">
				사용자정보가 없습니다.
			</div>
		
		</div>
		
<%		} %>		
	</div>

</body>
</html>
