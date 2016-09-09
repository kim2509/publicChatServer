<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");
	String snsLoginYN = request.getParameter("snsLogin");
	String showHotSpot = request.getParameter("showHotSpot");
	String showRecentPosts = request.getParameter("showRecentPosts");
	String version = request.getParameter("appVersion");
	double appVersion = 0;
	if ( !Util.isEmptyString(version) )
		appVersion = Double.parseDouble(version);

	List<HashMap> regionList = (List<HashMap>) request.getAttribute("regionList");
	List<HashMap> hotspotList = (List<HashMap>) request.getAttribute("hotspotList");
	
	String showSearchDiv = request.getParameter("showSearchDiv");
	if ( Util.isEmptyString(showSearchDiv) || !"Y".equals( showSearchDiv ) )
		showSearchDiv = "N";
	else
		showSearchDiv = "Y";
	
	String moreRecentPostPage = Constants.getServerURL() + "/taxi/moreRecentPosts.do?isApp=Y" + isApp + "&appVersion=" + appVersion;
	moreRecentPostPage = URLEncoder.encode( moreRecentPostPage, "UTF-8" );
	
	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/category.css?v=3" />
<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/searchDestination.css?v=2" />	
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>	

<script language="javascript">

	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function() {

<%
	if ( "Y".equals( showRecentPosts ) )
	{
%>
		getPosts();
<%
	}
%>
	
	});

	function goRegionPage( titleUrlEncoded, url )
	{
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + url + '&showNewButton=Y';
		else
			document.location.href = decodeURIComponent(url);
	}
	
	function showMoreRecentPosts()
	{
		var url = '<%= moreRecentPostPage %>';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=%EC%B5%9C%EA%B7%BC%20%EC%B9%B4%ED%92%80%20%EB%82%B4%EC%97%AD&url=' + url + '&showNewButton=N';
		else
			document.location.href = decodeURIComponent(url);
	}
	
	function snsLogin()
	{
		document.location.href='nearhere://snsLogin';
	}
	
	function showOKDialog( title, message, param )
	{
		document.location.href='nearhere://showOKDialog?title=' + title + '&message=' + message + '&param=' + param;
	}
	
	function openMap()
	{
		document.location.href='nearhere://openSearchDestination';
	}
	
	function getPosts()
	{
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getRecentPosts.do?strPageSize=5",
			data : null,
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					displayPosts( data );
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				
			},
			error : function(xhr, status, error) {
				
			}
		});
	}
	
	function displayPosts(data) {
		
		if ( data == null || data.data.postsNearHere == null || data.data.postsNearHere.length < 1 )
		{
			return;
		}
		
		var source = $('#postT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data);

		$('#postList').html(html);
		
		$("img.lazy").lazyload({
		    effect : "fadeIn"
		});
	}
	
	function goVIP(postID)
	{
		document.location.href='nearhere://viewPost?postID=' + postID;
	}
	
	function openUserProfile( userID )
	{
		<% if ( appVersion < 1.53 ) { %>
			
		document.location.href='nearhere://openUserProfile?userID=' + userID;
		
		<% } else { %>
		
		var url = '<%= userInfoPage %>' + '?userID=' + userID;
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + encodeURIComponent('사용자정보') + '&url=' + encodeURIComponent(url);
		else
			document.location.href = decodeURIComponent(url);
		
		<% }%>
	}
	
</script>

	<jsp:include page="common/common.jsp" flush="true"></jsp:include>

</head>
<body>

	<div id="wrapper" style="margin:10px;">

<%
		if ("Y".equals( snsLoginYN ) )
		{
%>
		<div class="snsLogin" onclick="snsLogin();">
			<div>SNS계정으로 로그인을 하시면 상대방에게 보다 더 믿음을 주실 수 있습니다.</div>
			<div class="snsBtns">
				<img class="kakaoLogin" src="<%= Constants.IMAGE_PATH %>/kakao_login_btn.png" width="42%;" height="40px"/>
				<img class="fbLogin" src="<%= Constants.IMAGE_PATH %>/facebook_logo.png" width="42%;" height="40px"/>
			</div>
		</div>

<%			
		}
%>		
		
		<!-- div>
			<div onclick="showOKDialog('확인','안녕하세요.','abc');">OKDialog</div>
		</div-->

<%
if ("Y".equals( showSearchDiv ) )
{
%>
		<div class="section">
			<div id="menu_category">
				<div class="title"><span class="s_tit">원하는 목적지 검색</span></div>
			</div>
			
			<div class="destination" onclick="openMap();">목적지 검색</div>
		</div>
<%	
}
%>		
		
		<div class="section">
		
			<div id="menu_category">
				<div class="title"><span class="s_tit">지역별 목적지</span></div>
			</div>
			
			<div class="set_service">
	
				<ul>
	<%
					String incheonAirportURL = Constants.getServerURL() + "/taxi/searchDestination.do?latitude=37.460195&longitude=126.438507&address=%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD";
					incheonAirportURL = URLEncoder.encode( incheonAirportURL, "UTF-8" );
	%>
					<!-- dd onclick="goRegionPage('%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD','<%= incheonAirportURL %>')">
						 <strong class="tit">인천공항</strong> <span
							class="sp_mw arr"></span>
						
					</dd-->
					
	<%
					for ( int i = 0; i < regionList.size(); i++ )
					{
						String regionNo = regionList.get(i).get("regionNo").toString();
						String title = regionList.get(i).get("regionName").toString();
						String titleUrlEncoded = URLEncoder.encode( title, "UTF-8" );
						String regionCount = regionList.get(i).get("regionCount").toString();
						String url = URLEncoder.encode( Constants.getServerURL() + "/taxi/listRegion.do?lRegionNo=" + regionNo + "&isApp=" + isApp + "&appVersion=" + version , "UTF-8" );
						int newCount = Util.getInt( regionList.get(i).get("newCount") );
	%>
					<li>
						 <a href="javascript:void()" onclick="goRegionPage('<%= titleUrlEncoded %>','<%= url %>')">
						 	<%= title %>(<%= regionCount %>) <%= newCount > 0 ? "<img src='" + Constants.IMAGE_PATH + "/new_post.png' width='15' height='15' />":"" %> 
						 </a>
					</li>
	<%
					}
	%>
				</ul>
	
			</div>
		
		</div>

<%
	if ( "Y".equals( showRecentPosts ) )
	{
%>
		<div class="section">
			<div id="menu_category">
				<div class="title"><span class="s_tit">최근 등록된 합승내역</span></div>
			</div>
			
			<div id="postList">
			</div>
			
			<div style="text-align:center;color:#4e88cf;font-weight:bold;padding:10px;" onclick="showMoreRecentPosts();">더 보기</div>
			
		</div>			
<%
	}
%>


<% if ("Y".equals( showHotSpot ) ) { %>
		<div class="section">
		
			<div id="menu_category">
				<div class="title"><span class="s_tit">유명지 및 관광지</span></div>
			</div>
			
			<div class="set_service" style="margin-bottom:10px">
				<ul>
<% 
			for ( int i = 0; i < hotspotList.size(); i++ )
			{
				String regionNo = hotspotList.get(i).get("regionNo").toString();
				String title = hotspotList.get(i).get("regionName").toString();
				String titleUrlEncoded = URLEncoder.encode( title, "UTF-8" );
				String regionCount = hotspotList.get(i).get("regionCount").toString();
				String url = URLEncoder.encode( Constants.getServerURL() + "/taxi/listRegion.do?lRegionNo=" + regionNo, "UTF-8" );
				int newCount = Util.getInt( hotspotList.get(i).get("newCount") );
%>
					<li>
						<a href="javascript:void()" onclick="goRegionPage('<%= titleUrlEncoded %>','<%= url %>')">
						 	<%= title %>(<%= regionCount %>) <%= newCount > 0 ? "<img src='" + Constants.IMAGE_PATH + "/new_post.png' width='15' height='15' />":"" %> 
						 </a>
					</li>
<%				
			}
%>				
				</ul>
			</div>
		
		</div>
<%
}
%>
	</div>

</body>
</html>
