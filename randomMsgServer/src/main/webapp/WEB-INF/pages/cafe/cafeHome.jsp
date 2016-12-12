<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
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
			<div id="cafeTitle">
				중고나라
			</div>
			<div id="cafeImage">
				<img src="http://nv2.tveta.naver.net/libs/1147/1147955/20161207160806-1P7780XT.jpg" height="140"/>
			</div>
			<div id="cafeDesc">
				이근 처 사람들과 중고 물품을 교환할 수 있는 카페입니다.
			</div>
			<div id="cafeMeeting">
				정모
				<ul class="slide_lst2">
					<li>
						<div class="date">
							일요일<br>
							8<br>
							18:00
						</div>
						<div class="postTitle">
							불금에 삼겹살에 소주 한잔
						</div>
						<div class="cafeName">
							중고나라
						</div>
						<div class="regionName">
							서울 강남구 역삼동
						</div>
					</li>
					<li>
						<div class="date">
							일요일<br>
							8<br>
							18:00
						</div>
						<div class="postTitle">
							불금에 삼겹살에 소주 한잔
						</div>
						<div class="cafeName">
							중고나라
						</div>
						<div class="regionName">
							서울 강남구 역삼동
						</div>
					</li>
					
					<div id="btnMakeMeeting">정모만들기</div>
				</ul>
			</div>
			<div id="cafeMemberInfo">
				카페 멤버<span id="membCnt">(3명)</span>
				<ul>
					<li>
						<div id="imgProfile">
							<img src="http://img1.daumcdn.net/thumb/C76x76/?fname=http://i1.daumcdn.net/cfile280/image/2163673B581E33C927A3EA" 
							width=60 height=60/>
						</div>
						<div id="memberInfo">
							<div>김대용</div>
						</div>
					</li>
					<li>
						<div id="imgProfile">
							<img src="http://img1.daumcdn.net/thumb/C76x76/?fname=http://i1.daumcdn.net/cfile280/image/2163673B581E33C927A3EA" 
							width=60 height=60/>
						</div>
						<div id="memberInfo">
							<div>김광중</div>
						</div>
					</li>
					<li>
						<div id="imgProfile">
							<img src="http://img1.daumcdn.net/thumb/C76x76/?fname=http://i1.daumcdn.net/cfile280/image/2163673B581E33C927A3EA" 
							width=60 height=60/>
						</div>
						<div id="memberInfo">
							<div>오동욱</div>
						</div>
					</li>
				</ul>
			</div>
			<div id="cafeButtons">
				<div id="btnRegister">가입하기</div>
				<div id="btnRetire">탈퇴하기</div>
				<div id="btnManage">관리하기</div>
			</div>
		</div>
		
	</div>

	
	
</body>
</html>