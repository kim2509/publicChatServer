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
		friendList = (List<HashMap>) request.getAttribute("friendList");
	
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/common.css" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/userInfo.css?v=3" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/searchDestination.css?v=3" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
		
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>	

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

	
	});

	function openUserProfile( userID )
	{
		document.location.href='nearhere://openUserProfile?userID=' + userID;
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
					<div>
						<img class="userProfile" src='<%= Constants.getThumbnailImageURL() %>/user27.png' 
							width="120" height="120" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
					</div>
					
					<div id="userInfoTop">
						<div class="p5" style="padding-top:10px;text-align:center"><%= userInfo.get("userName") %></div>
						<div class="p5" style="margin-top:10px;text-align:center">프로필 완성도</div>
						<div class="w3-progress-container" style="margin-top:5px;margin-left:5px;">
							<div id="myBar" class="w3-progressbar w3-green w3-round" style="width:70%">
								<div class="w3-center w3-text-white" style="padding-top:2px;">70%</div>
							</div>
						</div>
					</div>
				</div>
				
				<div>
				
					<table>
						<colgroup>
							<col width="80px;"/>
						</colgroup>
						<tr>
							<td>성별</td>
							<td><%= "M".equals( userInfo.get("sex") ) ? "남자":"여자" %></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><%= userInfo.get("age") %>세</td>
						</tr>
						
<%						if ( userLocationList != null && userLocationList.size() > 0 ) {
							for ( int i = 0; i < userLocationList.size(); i++ ) {
								
								if ("현재위치".equals( userLocationList.get(i).get("locationName") ) ) continue;
%>						
						<tr>
							<td><%= userLocationList.get(i).get("locationName") %> 위치</td>
							<td><%= userLocationList.get(i).get("address") %></td>
						</tr>
<%
							}
						} 
%>						
						<tr>
							<td>직업</td>
							<td><%= userInfo.get("jobTitle") %></td>
						</tr>
					</table>
				</div>
			
			</div>
			
		</div>

		<div class="section">
			
			<div id="menu_category">
				<div class="title"><span class="s_tit">친구</span></div>
			</div>
			
			<div style="padding-top:10px;">
<%
				if ( friendList != null && friendList.size() > 0 ) {
%>			
				<table style="width:100%;">
					<tr>
<%
						for ( int i = 0; i < friendList.size(); i++ ) {								
%>						
					
						<td style="padding-right:2px;">
							<div>
								<img src='<%= Constants.getThumbnailImageURL() %>/<%= friendList.get(i).get("profileImageURL") %>' 
									width="100" height="100" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
							</div>
							<div style="text-align:center"><%= friendList.get(i).get("userName") %></div>
						</td>
						
<%						
						}
%>
					</tr>
					<tr><td colspan="3" style="text-align:center;padding-top:10px;">더 보기</td></tr>
	
				</table>				
<%
				} else {
%>
				<table style="width:100%;">
					<tr><td style="text-align:center;padding-top:10px;padding-bottom:10px;">친구 정보가 없습니다.</td></tr>
				</table>
<%							
				}
%>						
				
			</div>
			
		</div>
		
		<div class="section">
			
			<div id="menu_category">
				<div class="title"><span class="s_tit">최근 카풀(합승) 내역</span></div>
			</div>
			
			<div style="padding-top:10px;">
			
				<table style="width:100%;">
					<tr><td style="text-align:center;padding-top:10px;padding-bottom:10px;">내역이 없습니다.</td></tr>
				</table>
				
				<div id="postList">
					<dl class="slide_lst">
						<dd>
							<div class="imgStatus" onclick="openUserProfile('user27');">
								<img src="/nearhere/image//progressing.png" width="50" height="50">
							</div>
							<div class="userProfile" onclick="openUserProfile('user27');">
								<img class="lazy" data-original="http://172.30.1.200/thumbnail//user27.png" src="http://172.30.1.200/thumbnail//user27.png" width="70" height="70" style="display: inline;">
								<img src="/nearhere/image//kakaotalk_icon.png" width="18" height="18" id="kakao">
							</div>
							<div class="postDesc" onclick="goVIP('748')">
								
								<strong class="tit">이젠 고쳐짐3</strong>
								<div id="departureDateTime">04월 29일 출발</div>
								<div id="readCount">조회수: 1</div>
								<div id="personInfo"><div id="userSex"><img class="sex" src="/nearhere/image//ic_male.png" width="15" height="15"></div><div id="userName">김대용</div></div>
								<div id="tags"><span>카풀</span><span>나눠서 분담</span><span>반복</span></div>
							</div>
						</dd>
						
					</dl>
				</div>
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
