<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
	public String getDetailInfoString( HashMap detailCommon, String contentTypeID, HashMap detailIntro, HashMap detailInfo )
	{
		String resultString = "";
		
		if ( detailIntro == null || Util.isEmptyString(contentTypeID) ) {
			return "";
		}
	
		String basicInfoString = "";
		
		if ( !Util.isEmptyString(detailCommon.get("zipcode")))
			basicInfoString += "우편번호 : " + detailCommon.get("zipcode") + "<br/>";
		
		if ( !Util.isEmptyString(detailCommon.get("telname")))
			basicInfoString += "전화명 : " + detailCommon.get("telname") + "<br/>";
		
		if ( !Util.isEmptyString(detailCommon.get("tel")))
			basicInfoString += "전화번호 : " + detailCommon.get("tel") + "<br/>";
		
		if ( !Util.isEmptyString(detailCommon.get("homepage")))
			basicInfoString += "홈페이지 : " + detailCommon.get("homepage") + "<br/>";
		
		if ( !Util.isEmptyString(detailCommon.get("addr1")))
			basicInfoString += "홈페이지 : " + Util.getString(detailCommon.get("addr1")) + Util.getString(detailCommon.get("addr2")) + "<br/>";

		if ( !Util.isEmptyString(basicInfoString) )
		{
			resultString += "<h3>기본정보</h3>";	
			resultString += basicInfoString;
		}
			
		String useGuideString = "";
		
		if ("15".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("sponsor1")))
				useGuideString += "주최자 정보 : " + detailIntro.get("sponsor1") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("sponsor1tel")))
				useGuideString += "주최자 연락처 : " + detailIntro.get("sponsor1tel") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("sponsor2tel")))
				useGuideString += "주관사 연락처 : " + detailIntro.get("sponsor2tel") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("eventstartdate")))
				useGuideString += "행사시작일 : " + detailIntro.get("eventstartdate") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("eventenddate")))
				useGuideString += "행사종료일 : " + detailIntro.get("eventenddate") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("playtime")))
				useGuideString += "공연시간 : " + detailIntro.get("playtime") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("eventplace")))
				useGuideString += "행사장소 : " + detailIntro.get("eventplace") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("usetimefestival")))
				useGuideString += "이용시간 : " + detailIntro.get("usetimefestival") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("spendtimefestival")))
				useGuideString += "관람소요시간 : " + detailIntro.get("spendtimefestival") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("agelimit")))
				useGuideString += "관람가능연령 : " + detailIntro.get("agelimit") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("placeinfo")))
				useGuideString += "행사장 위치안내 : " + detailIntro.get("placeinfo") + "<br/>";	
		}
		else if ("12".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("infocenter")))
				useGuideString += "문의 및 안내 : " + detailIntro.get("infocenter") + "<br/><br/>";
			if ( !Util.isEmptyString(detailIntro.get("expguide")))
				useGuideString += "체험안내 : " + detailIntro.get("expguide") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("useseason")))
				useGuideString += "이용시기 : " + detailIntro.get("useseason") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("usetime")))
				useGuideString += "이용시간 : " + detailIntro.get("usetime") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("parking")))
				useGuideString += "주차시설 : " + detailIntro.get("parking") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkbabycarriage")))
				useGuideString += "유모차 대여여부 : " + detailIntro.get("chkbabycarriage") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkpet")))
				useGuideString += "애완동물 동반가능여부 : " + detailIntro.get("chkpet") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkcreditcard")))
				useGuideString += "신용카드가능여부 : " + detailIntro.get("chkcreditcard") + "<br/>";
			
		}
		else if ("14".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("infocenterculture")))
				useGuideString += "문의 및 안내 : " + detailIntro.get("infocenterculture") + "<br/><br/>";
			if ( !Util.isEmptyString(detailIntro.get("usetimeculture")))
				useGuideString += "이용시간 : " + detailIntro.get("usetimeculture") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("restdateculture")))
				useGuideString += "쉬는날 : " + detailIntro.get("restdateculture") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("usefee")))
				useGuideString += "이용요금 : " + detailIntro.get("usefee") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("parkingculture")))
				useGuideString += "주차시설 : " + detailIntro.get("parkingculture") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkbabycarriageculture")))
				useGuideString += "유모차 대여여부 : " + detailIntro.get("chkbabycarriageculture") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkpetculture")))
				useGuideString += "애완동물 동반가능여부 : " + detailIntro.get("chkpetculture") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkcreditcardculture")))
				useGuideString += "신용카드가능여부 : " + detailIntro.get("chkcreditcardculture") + "<br/>";
			
		}
		else if ("39".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("infocenterfood")))
				useGuideString += "문의 및 안내 : " + detailIntro.get("infocenterfood") + "<br/><br/>";
			if ( !Util.isEmptyString(detailIntro.get("seat")))
				useGuideString += "좌석수 : " + detailIntro.get("seat") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("parkingfood")))
				useGuideString += "주차시설 : " + detailIntro.get("parkingfood") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("opendatefood")))
				useGuideString += "개업일 : " + detailIntro.get("opendatefood") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("opentimefood")))
				useGuideString += "영업시간 : " + detailIntro.get("opentimefood") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("restdatefood")))
				useGuideString += "쉬는날 : " + detailIntro.get("restdatefood") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("firstmenu")))
				useGuideString += "대표메뉴 : " + detailIntro.get("firstmenu") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("treatmenu")))
				useGuideString += "취급메뉴 : " + detailIntro.get("treatmenu") + "<br/>";
		}
		else if ("28".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("infocenterleports")))
				useGuideString += "문의 및 안내 : " + detailIntro.get("infocenterleports") + "<br/><br/>";
			if ( !Util.isEmptyString(detailIntro.get("openperiod")))
				useGuideString += "개장시간 : " + detailIntro.get("openperiod") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("usetimeleports")))
				useGuideString += "이용시간 : " + detailIntro.get("usetimeleports") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("parkingleports")))
				useGuideString += "주차시설 : " + detailIntro.get("parkingleports") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkbabycarriageleports")))
				useGuideString += "유모차 대여여부 : " + detailIntro.get("chkbabycarriageleports") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkpetleports")))
				useGuideString += "애완동물 동반가능여부 : " + detailIntro.get("chkpetleports") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkcreditcardleports")))
				useGuideString += "신용카드가능여부 : " + detailIntro.get("chkcreditcardleports") + "<br/>";
			
		}
		else if ("38".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("infocentershopping")))
				useGuideString += "문의 및 안내 : " + detailIntro.get("infocentershopping") + "<br/><br/>";
			if ( !Util.isEmptyString(detailIntro.get("saleitem")))
				useGuideString += "판매품목 : " + detailIntro.get("saleitem") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("saleitemcost")))
				useGuideString += "판매품목별 가격 : " + detailIntro.get("saleitemcost") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("opentime")))
				useGuideString += "영업시간 : " + detailIntro.get("opentime") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("parkingshopping")))
				useGuideString += "주차시설 : " + detailIntro.get("parkingshopping") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkbabycarriageshopping")))
				useGuideString += "유모차 대여여부 : " + detailIntro.get("chkbabycarriageshopping") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkpetshopping")))
				useGuideString += "애완동물 동반가능여부 : " + detailIntro.get("chkpetshopping") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkcreditcardshopping")))
				useGuideString += "신용카드가능여부 : " + detailIntro.get("chkcreditcardshopping") + "<br/>";
			
		}
		else if ("32".equals(contentTypeID)){
			
			if ( !Util.isEmptyString(detailIntro.get("infocenterlodging")))
				useGuideString += "문의 및 안내 : " + detailIntro.get("infocenterlodging") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("roomcount")))
				useGuideString += "객실수 : " + detailIntro.get("roomcount") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("roomtype")))
				useGuideString += "객실유형 : " + detailIntro.get("roomtype") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("parkinglodging")))
				useGuideString += "주차시설 : " + detailIntro.get("parkinglodging") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("chkcooking")))
				useGuideString += "조리가능 : " + detailIntro.get("chkcooking") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("checkintime")))
				useGuideString += "체크인 : " + detailIntro.get("checkintime") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("checkouttime")))
				useGuideString += "체크아웃 : " + detailIntro.get("checkouttime") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("reservationlodging")))
				useGuideString += "예약안내 : " + detailIntro.get("reservationlodging") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("reservationurl")))
				useGuideString += "예약안내홈페이지 : " + detailIntro.get("reservationurl") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("pickup")))
				useGuideString += "픽업서비스 : " + detailIntro.get("pickup") + "<br/>";
			if ( !Util.isEmptyString(detailIntro.get("subfacility")))
				useGuideString += "부대시설 : " + detailIntro.get("subfacility") + "<br/>";
			if ( "1".equals(detailIntro.get("publicpc")))
				useGuideString += "공용PC실 : 있음<br/>";
		}
		
		if ( !Util.isEmptyString(useGuideString) )
		{
			resultString += "<h3>이용안내</h3>";	
			resultString += useGuideString;
		}
		
		String detailInfoString = "";
		
		if ( detailInfo != null && detailInfo.get("items") != null )
		{
			ArrayList<HashMap> items = (ArrayList<HashMap>) detailInfo.get("items");
			
			for ( int i = 0; i < items.size(); i++ )
			{
				if ( "25".equals(contentTypeID) )
				{
					int num = 0;
					if ( !Util.isEmptyString(items.get(i).get("subnum")))
					{
						num = Integer.parseInt( items.get(i).get("subnum").toString() ) + 1;
					}
					
					detailInfoString += num + " : " + items.get(i).get("subname") + "<br/><br/>";
					
					if ( !Util.isEmptyString( items.get(i).get("subdetailimg") ) )
					{
						detailInfoString += "<img src='" + items.get(i).get("subdetailimg") + "' width='100%'/><br/><br/>";	
					}
					
					detailInfoString += items.get(i).get("subdetailoverview") + "<br/><br/>";
				}
				else if ( "32".equals(contentTypeID) )
				{
					if ( !Util.isEmptyString(items.get(i).get("roomtitle")))
					{
						detailInfoString += "*" + items.get(i).get("roomtitle") + "<br/><br/>";
					}
					
					if ( !Util.isEmptyString(items.get(i).get("roomimg1")))
					{
						detailInfoString += "<img src='" + items.get(i).get("roomimg1") + "' width='100%'/><br/><br/>";	
					}
					
					if ( !Util.isEmptyString(items.get(i).get("roomsize1")))
					{
						detailInfoString += "객실크기:" + items.get(i).get("roomsize1") + "평<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomcount")))
					{
						detailInfoString += "객실수:" + items.get(i).get("roomcount") + "<br/>";
					}
					
					if ( !Util.isEmptyString(items.get(i).get("roombasecount")))
					{
						detailInfoString += "기준인원:" + items.get(i).get("roombasecount") + "<br/>";
					}
					
					if ( !Util.isEmptyString(items.get(i).get("roomoffseasonminfee1")))
					{
						detailInfoString += "비수기주중최소:" + items.get(i).get("roomoffseasonminfee1") + " (성수기:" + items.get(i).get("roompeakseasonminfee1") + ")<br/>";
					}
					
					if ( !Util.isEmptyString(items.get(i).get("roomoffseasonminfee2")))
					{
						detailInfoString += "비수기주말최소:" + items.get(i).get("roomoffseasonminfee2") + " (성수기:" + items.get(i).get("roompeakseasonminfee2") + ")<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roombathfacility")))
					{
						detailInfoString += "목욕시설:" + items.get(i).get("roombathfacility") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomaircondition")))
					{
						detailInfoString += "에어컨:" + items.get(i).get("roomaircondition") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomtv")))
					{
						detailInfoString += "TV:" + items.get(i).get("roomtv") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roominternet")))
					{
						detailInfoString += "인터넷:" + items.get(i).get("roominternet") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomrefrigerator")))
					{
						detailInfoString += "냉장고:" + items.get(i).get("roomrefrigerator") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomtoiletries")))
					{
						detailInfoString += "세면도구:" + items.get(i).get("roomtoiletries") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomsofa")))
					{
						detailInfoString += "소파:" + items.get(i).get("roomsofa") + "<br/>";
					}
					if ( !Util.isEmptyString(items.get(i).get("roomhairdryer")))
					{
						detailInfoString += "드라이기:" + items.get(i).get("roomhairdryer") + "<br/>";
					}
					
					detailInfoString += "<br/>";
				}
				else
				{
					if ( !Util.isEmptyString(items.get(i).get("infotext")))
						detailInfoString += items.get(i).get("infoname") + " : " + items.get(i).get("infotext") + "<br/>";	
				}
			}
		}
		
		if ( !Util.isEmptyString(detailInfoString) )
		{
			resultString += "<h3>상세정보</h3>";
			resultString += detailInfoString;
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
	
	HashMap detailInfo = null;
	if ( request.getAttribute("detailInfo") != null )
	{
		detailInfo = (HashMap) request.getAttribute("detailInfo");
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
		
		<img src="<%= detailCommon.get("firstimage") %>" width="100%" /><br/><br/>
	
		<%= detailCommon.get("overview") %><br/><br/>
		
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
	
		<%= getDetailInfoString( detailCommon, contentTypeID ,detailIntro, detailInfo) %>
	
		<div id="footer" style="margin-top:40px;text-align:right;">
		출처 : 공공데이터 포털
		</div>
	
	</div>

</body>
</html>