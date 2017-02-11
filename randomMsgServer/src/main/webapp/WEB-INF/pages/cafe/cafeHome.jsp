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
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>이근처</title>


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
	href="<%=Constants.CSS_PATH%>/cafeHome.css?v=4" />	

<script language="javascript">
		
	var isApp = '<%= isApp %>';
	var userID = '<%= userID %>';
	var cafeID = '<%= cafeID %>';
	var swiper = null;
	
	jQuery(document).ready(function(){
		swiper = $('.swiper-container').swiper({
			onSlideChangeStart:onSlideChange
		});
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
	
</script>

</head>
<body>

	<div id="wrapper">
		
		<div class="titleDiv">
			<div class="title"><%= cafeName %></div>
			<div id="manage">i</div>
			<div id="setting"><img src="<%= Constants.IMAGE_PATH %>/ic_setting_on.png" width="24" height="24" /></div>
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


		
	</div>

	
	
</body>
</html>