<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
	public String getDetailInfoString( HashMap detailCommon, String contentTypeID, HashMap detailIntro )
	{
		String resultString = "";
		
		if ( detailIntro == null || Util.isEmptyString(contentTypeID) ) {
			return "";
		}
	
		if ("15".equals(contentTypeID)){
			resultString += "<h3>기본정보</h3>";
			resultString += "우편번호 : " + Util.getString(detailCommon.get("zipcode")) + "<br/>";
			resultString += "전화명 : " + Util.getString(detailCommon.get("telname")) + "<br/>";
			resultString += "전화번호 : " + Util.getString(detailCommon.get("tel")) + "<br/>";
			resultString += "홈페이지 : <br/>" + Util.getString(detailCommon.get("homepage"));
			resultString += "주소 : " + Util.getString(detailCommon.get("addr1")) + Util.getString(detailCommon.get("addr2")) + "<br/>";
			
			resultString += "<h3>이용안내</h3>";
			resultString += "주최자 정보 : " + Util.getString(detailIntro.get("sponsor1")) + "<br/>";
			resultString += "주최자 연락처 : " + Util.getString(detailIntro.get("sponsor1tel")) + "<br/>";
			resultString += "주관사 연락처 : " + Util.getString(detailIntro.get("sponsor2tel")) + "<br/>";
			resultString += "행사시작일 : " + Util.getString(detailIntro.get("eventstartdate")) + "<br/>";
			resultString += "행사종료일 : " + Util.getString(detailIntro.get("eventenddate")) + "<br/>";
			resultString += "공연시간 : " + Util.getString(detailIntro.get("playtime")) + "<br/>";
			resultString += "행사장소 : " + Util.getString(detailIntro.get("eventplace")) + "<br/>";
			resultString += "이용시간 : " + Util.getString(detailIntro.get("usetimefestival")) + "<br/>";
			resultString += "관람소요시간 : " + Util.getString(detailIntro.get("spendtimefestival")) + "<br/>";
			resultString += "관람가능연령 : " + Util.getString(detailIntro.get("agelimit")) + "<br/><br/>";
			resultString += "행사장 위치안내 : " + Util.getString(detailIntro.get("placeinfo")) + "<br/>";
			
		}
		else if ("32".equals(contentTypeID)){
			resultString += Util.getString(detailIntro.get("foodplace")) + "<br/>";
			resultString += Util.getString(detailIntro.get("parkinglodging")) + "<br/>";
			resultString += Util.getString(detailIntro.get("reservationlodging")) + "<br/>";
			resultString += Util.getString(detailIntro.get("reservationurl")) + "<br/>";
			resultString += Util.getString(detailIntro.get("roomtype")) + "<br/>";
			resultString += Util.getString(detailIntro.get("roomcount")) + "<br/>";
			resultString += Util.getString(detailIntro.get("pickup")) + "<br/>";
			resultString += Util.getString(detailIntro.get("chkcooking")) + "<br/>";
			resultString += Util.getString(detailIntro.get("checkintime")) + "<br/>";
			resultString += Util.getString(detailIntro.get("checkouttime")) + "<br/>";	
		}
		
		return resultString;
	}
%>

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	
	String contentTypeID = request.getParameter("contentTypeID");
	
	HashMap detailCommon = null;
	if ( request.getAttribute("detailCommon") != null )
	{
		detailCommon = (HashMap) request.getAttribute("detailCommon");
		ArrayList items = (ArrayList) detailCommon.get("items");
		detailCommon = (HashMap) items.get(0);
	}
	
	HashMap detailIntro = null;
	if ( request.getAttribute("detailIntro") != null )
	{
		detailIntro = (HashMap) request.getAttribute("detailIntro");
		ArrayList items = (ArrayList) detailIntro.get("items");
		detailIntro = (HashMap) items.get(0);
	}
	
	HashMap detailImage = null;
	ArrayList imageList = new ArrayList();
	if ( request.getAttribute("detailImage") != null )
	{
		detailImage = (HashMap) request.getAttribute("detailImage");
		imageList = (ArrayList) detailImage.get("items");
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>

<style type="text/css">

span{ padding:5px; }

.section{
	border-radius: 10px;
	border: 1px solid gray;
	background:white;
	padding:10px;
	margin-bottom:10px;
}

#menu_category {background:#fff;}
#menu_category .title {position:relative; height:33px; padding:0 12px 0 12px; background:#dee2e8; border-top:1px solid #bcc4cd; /*border-bottom:2px solid #0c1420;*/ display:box; box-orient:vertical;box-pack:center;display:-webkit-box;-webkit-box-orient:vertical;-webkit-box-pack:center;display:-moz-box;-moz-box-orient:vertical;-moz-box-pack:center; -webkit-box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing: border-box}
#menu_category .title .s_tit {display:block; font-weight:normal; font-size:0.81em; letter-spacing:-1px; color:#707b8b}

li{
	padding:3px;
	border-bottom: 1px solid #eeeeee;
}
a{
	text-decoration: none;color:black;
	line-height: 1.4em;
}

.hostURL{
    color: #ffffff;
    background: #5c5aa7;
    border: 1;
    border: 1px solid #7f9bea;
    border-radius: 10px;
    padding: 10px;
    margin: 10px;
}

</style>

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		console.log('ready');
		
	});
	
	function goFavoriteRegionPage()
	{
		if ( isApp == 'Y' )
		{
			var titleUrlEncoded = encodeURIComponent( '관심지역설정' );
			var url = '<%= Constants.getServerURL() %>/news/favoriteRegion.do?userID=<%= userID %>&isApp=<%= isApp %>';
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + encodeURIComponent( url );
		}
		else
			document.fm.submit();
	}
	
	function openURL( title, url )
	{
		var titleUrlEncoded = encodeURIComponent( '상세' )
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&disableWebViewClient=Y&fullURL=' + encodeURIComponent( url );
		else
			document.location.href= url;
	}
	
	function goHostURL( url )
	{
		document.location.href='nearhere://openExternalURL?url=' + encodeURIComponent(url);
	}
	
	</script>
</head>
<body>

	<div id="wrapper">
	
	<% if ( detailCommon != null ) { %>
	
		<%= detailCommon.get("title") %><br/><br/>
		
		<img src="<%= detailCommon.get("firstimage") %>" width="100%" /><br/>
	
		<%= detailCommon.get("overview") %><br/>
		
	<% } %>
	
	
	<% 
	if ( imageList != null && imageList.size() > 0 )
	{ 
		for ( int i = 0; i < imageList.size(); i++ )
		{
			HashMap item = (HashMap) imageList.get(i);
	%>
			
			<img src="<%= item.get("originimgurl") %>" width="100%" /><br/><br/>
	
	<%		
		}
	 } 
	%>
	
		<%= getDetailInfoString( detailCommon, contentTypeID ,detailIntro) %>
	
		<div id="footer" style="margin-top:40px;text-align:right;">
		출처 : 공공데이터 포털
		</div>
	
	</div>

</body>
</html>