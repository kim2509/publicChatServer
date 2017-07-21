<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	String cafeID = request.getAttribute("cafeID").toString();
	
	String cafeName = "";
	HashMap cafeMainInfo = null;
	if ( request.getAttribute("cafeMainInfo") != null )
	{
		cafeMainInfo = (HashMap) request.getAttribute("cafeMainInfo");
		cafeName = cafeMainInfo.get("cafeName").toString();
	}
	
	HashMap cafeUserInfo = (HashMap) request.getAttribute("cafeUserInfo");
	String ownerYN = "N";
	String memberYN = "N";
	String memberType = "";
	String blockYN = "N";
	if ( cafeUserInfo != null )
	{
		ownerYN = cafeUserInfo.get("ownerYN").toString();
		memberYN = cafeUserInfo.get("memberYN").toString();
		memberType = cafeUserInfo.get("memberType").toString();
		blockYN = Util.getStringFromHash(cafeUserInfo, "blockYN");
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>이근처 카페</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<!-- Swipe Library http://idangero.us/swiper/#.WFIRj9WLRhE -->
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/swiper.min.css" />

<style>
body{background:#eee;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size:14px;color:#000;margin:0;padding:0;}
.swiper-container{width:100%;margin:0}
.swiper-slide{
	font-size:18px;
	background:#fff;
	display:-webkit-box;
	display:-ms-flexbox;
	display:-webkit-flex;
	display:flex;
	-webkit-box-pack:center;
	-ms-flex-pack:center;
	-webkit-justify-content:center;
	justify-content:center;
	-webkit-box-align:center;
	-ms-flex-align:center;
	-webkit-align-items:center;
	align-items:center;
}
</style>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/swiper.min.js"></script>
<!-- Swipe Library http://idangero.us/swiper/#.WFIRj9WLRhE -->

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=1"></script>

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common_v2.css?v=2" />
	
<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafe_common.css?v=1" />
		
<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafeHome.css?v=18" />	

<script type="text/javascript" src="<%=Constants.JS_PATH%>/modal_dialog.js"></script>

<script language="javascript">
		
	var isApp = '<%= isApp %>';
	var userID = '<%= userID %>';
	var cafeID = '<%= cafeID %>';
	var cafeName = '<%= cafeName %>';
	var swiper = null;
	
	jQuery(document).ready(function(){
		swiper = $('.swiper-container').swiper({
			onSlideChangeStart:onSlideChange
		});
		
		if ( cafeName == null || cafeName.length < 1 )
		{
			if ( isApp =='Y' )
			{
				
			}
			else
			{
				window.history.back();
			}
		}
		
		<% if ("Y".equals( blockYN )) { %>
		
		alert('탈퇴된 회원은 카페접근이 불가능합니다.');
		
		if ( isApp =='Y' )
		{
			finishActivity();
		}
		else
		{
			window.history.back();
		}
		
		<% } %>
		
		<% if (!"Y".equals( Util.getStringFromHash(cafeMainInfo, "publishYN") ) &&
				!"Y".equals(ownerYN) && !Constants.CafeMemberTypeOperator.equals(memberType) ) { %>
		
		alert('해당 카페는 비공개상태로 진입이 불가능합니다.');
		
		if ( isApp =='Y' )
		{
			finishActivity();
		}
		else
		{
			window.history.back();
		}
		
		<% } %>
	
	});
	
	function goSlide( slideNo )
	{
		swiper.slideTo(slideNo);
	}
	
	function onSlideChange( swiper )
	{
		//goSlide( swiper.activeIndex, $('.menu ul li a').eq(swiper.activeIndex) );
		var element = $('.menu ul li a').eq(swiper.activeIndex);
		$('.menu ul li a').removeClass();
		$(element).addClass('link_tab');
	}
	
	function goCafeManage( cafeID )
	{
		var url = '<%= Constants.getServerURL() + "/cafe/manage.do" %>?cafeID=' + cafeID

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
</script>

<jsp:include page="../common/common.jsp" flush="true"></jsp:include>

</head>
<body>

	<div id="wrapper">
		
		<% if ( !Util.isEmptyString( cafeName ) ) { %>
		
		<div class="titleDiv">
			<div class="title"><%= cafeName %></div>
			
			<% if ( "Y".equals(ownerYN) || "Y".equals(memberYN) && Constants.CafeMemberTypeOperator.equals( memberType ) ) { %>
			<div id="setting" onclick="goCafeManage('<%= cafeMainInfo.get("cafeID") %>');"><img src="<%= Constants.IMAGE_PATH %>/ic_setting_on.png" width="24" height="24" /></div>
			<% } %>
			
			<div id="search" onclick="goSearchCafeBoard('<%= cafeID %>','');">
				<img src="<%=Constants.IMAGE_PATH%>/search.png" width="24" height="24">
			</div>
		</div>
	
		<div class="menu">
		
			<ul>
				<li class="menuItem">
					<a href="javascript:void(0)" onclick="goSlide(0)" class="link_tab">홈</a>
				</li>
				<li class="menuItem">
					<a href="javascript:void(0)" onclick="goSlide(1)">게시판</a>
				</li>
				<li class="menuItem">
					<a href="javascript:void(0)" onclick="goSlide(2)">이미지</a>
				</li>
			</ul>
		</div>
		
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
				
					<jsp:include page="cafeHomeTab.jsp" flush="true"></jsp:include>
				
				</div>
				<div class="swiper-slide">
				
					<jsp:include page="cafeBoardListTab.jsp" flush="true"></jsp:include>
					
				</div>
				
				<div class="swiper-slide">
				
					<jsp:include page="cafeBoardImageTab.jsp" flush="true"></jsp:include>
				
				</div>
			</div>
		</div>

		<% } %>
		
	</div>

	
	
</body>
</html>