<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String cafeID = request.getParameter("cafeID");
	String isApp = request.getParameter("isApp");
	HashMap cafeMainInfo = null;
	String cafeName = "";
	String cafeMainDesc = "";
	String publishYN = "N";
	if ( request.getAttribute("cafeMainInfo") != null )
	{
		cafeMainInfo = (HashMap) request.getAttribute("cafeMainInfo");
		cafeName = cafeMainInfo.get("cafeName").toString();
		cafeMainDesc = cafeMainInfo.get("mainDesc").toString();
		publishYN = cafeMainInfo.get("publishYN").toString();
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>카페 관리하기</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage.css?v=" />

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	function goManageBoard( cafeID )
	{
		var url = '<%= Constants.getServerURL() + "/cafe/manageBoard.do" %>?cafeID=' + cafeID
	
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function goManageMember( cafeID )
	{
		var url = '<%= Constants.getServerURL() + "/cafe/manageMember.do" %>?cafeID=' + cafeID
	
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}

	jQuery(document).ready(function(){
		getCafeMainInfo();
	});
	
	function getCafeMainInfo()
	{
		var param = {"cafeID":"<%= cafeID %>" };
		ajaxRequest('POST', '/nearhere/cafe/cafeMainInfoAjax.do', param , onMainInfoResult );	
	}
	
	function onMainInfoResult( result )
	{
		console.log( JSON.stringify( result ) );
		
		if ( result == null || result.data == null || result.data.cafeMainInfo == null ) return;
		
		if ('Y' == result.data.cafeMainInfo.publishYN )
		{
			$('#btnUnPublish').show();
			$('#btnPublish').hide();
		}
		else
		{
			$('#btnUnPublish').hide();
			$('#btnPublish').show();		
		}
			
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">카페 관리</div>
		</div>
		
		<div id="container">
		
			<div class="inputContainer">
					<input type="text" class="inputTxt" placeholder="카페이름" value="<%= cafeName %>" />
			</div>
			
			<div class="inputContainer">
				<input type="text" class="inputTxt" placeholder="설명" value="<%= cafeMainDesc %>" />
			</div>
			
			<div class="wideBtn darkBG">카페 아이콘 업로드</div>
			
			<div class="wideBtn darkBG">메인 이미지 업로드</div>
			<div class="wideBtn whiteBG" onclick="goManageBoard('<%= cafeID %>');">게시판 관리</div>
			<div class="wideBtn whiteBG" onclick="goManageMember('<%= cafeID %>');">회원 관리</div>
			
			<div class="wideBtn btnBG">저장</div>
			
			<div id="btnUnPublish" class="wideBtn darkBG" style="display:none">카페 비공개</div>
			<div id="btnPublish" class="wideBtn blueBG" style="display:none">카페 공개</div>
			
			<div class="wideBtn redBG">카페 폐쇄</div>
		
		</div>
					
	</div>
	
</body>
</html>