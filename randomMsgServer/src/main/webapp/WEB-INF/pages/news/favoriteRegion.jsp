<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ArrayList<HashMap> cities = (ArrayList<HashMap>) request.getAttribute("cities");
	String userID = request.getParameter("userID");
	
	String favoriteRegions = request.getAttribute("favoriteRegions").toString();
	if ( Util.isEmptyString(favoriteRegions) )
	{
		favoriteRegions = "설정된 지역이 없습니다.";
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=Constants.CSS_PATH%>/jquery.mobile-1.4.5.min.css">

<!-- Include the jQuery library -->
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>
<!-- Include the jQuery Mobile library -->
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/jquery.mobile-1.4.5.min.js"></script>

<style type="text/css">
span {
	padding: 5px;
}

.section {
	border-radius: 10px;
	border: 1px solid gray;
	background: white;
	padding: 10px;
	margin-bottom: 10px;
}

#menu_category {
	background: #fff;
}

#menu_category .title {
	position: relative;
	height: 33px;
	padding: 0 12px 0 12px;
	background: #dee2e8;
	border-top: 1px solid #bcc4cd; /*border-bottom:2px solid #0c1420;*/
	display: box;
	box-orient: vertical;
	box-pack: center;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-box-pack: center;
	display: -moz-box;
	-moz-box-orient: vertical;
	-moz-box-pack: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box
}

#menu_category .title .s_tit {
	display: block;
	font-weight: normal;
	font-size: 0.81em;
	letter-spacing: -1px;
	color: #707b8b
}

li {
	padding: 3px;
}

a {
	text-decoration: none;
	color: #2e4986;
	line-height: 1.2em;
}
</style>

	<script language="javascript">
	
	var favoriteRegions = '<%= favoriteRegions %>';
	
		jQuery(document).ready( function() {
			
			var favRegionsAr = favoriteRegions.split(',');
			
			if ( favRegionsAr != null && favRegionsAr.length > 0 )
			{
				$('#selectedRegionDiv').html( favoriteRegions );
				
				$('input[type=checkbox]').each(function(){
					for ( var i = 0; i < favRegionsAr.length; i++ )
					{
						if ( $(this).attr('regionName') == favRegionsAr[i] )
							$(this).attr('checked', true).checkboxradio('refresh');
					}
				});
			}
			else
				$('#selectedRegionDiv').html( '지역을 선택하세요.' );
			
			$("input[type=checkbox]").click(function(){
				
				var selectedRegion = '';
				$('input[type=checkbox]:checked').each(function(){
					selectedRegion += $(this).attr('regionName') + ',';
				});
				
				if ( selectedRegion.match(/,$/))
					selectedRegion = selectedRegion.substring(0, selectedRegion.length -1 );
				
				if ( selectedRegion == '' ) selectedRegion = '지역을 선택하세요.';
				
		        $('#selectedRegionDiv').html( selectedRegion );
		    });
			
			$('#btnSave').click(function(){
				
				document.fm.selectedRegionNo.value = '';
				
				$('input[type=checkbox]:checked').each(function(){
					document.fm.selectedRegionNo.value += $(this).attr('regionNo') + ',';
				});
				
				document.fm.submit();
			});
			
			$('#btnCancel').click(function(){
				window.history.back();
			});
			
		});
	</script>
</head>
<body>

	<div id="wrapper" data-role="page">

		<div class="section">
		
			<form action="/nearhere/news/setFavoriteRegion.do?userID=<%= userID %>" method="post" name="fm">
				<input type="hidden" name="returnURL" value="/nearhere/news/list.do?userID=<%= userID %>" />
				<input type="hidden" name="selectedRegionNo" value="" />
			</form>
			
			<div id="menu_category">
				<div class="title">
					<span class="s_tit">관심지역 설정</span>
				</div>
				<div style="padding: 5px;" id="selectedRegionDiv">지역을 선택하세요.</div>
			</div>

			<%
				for (int i = 0; i < cities.size(); i++) {
					
					HashMap city = cities.get(i);
					
					ArrayList<HashMap> regionList = (ArrayList<HashMap>) city.get("regionList");
			%>

			<div data-role="collapsible" data-collapsed="true">
				<h4><%=cities.get(i).get("regionName")%></h4>
				<fieldset data-role="controlgroup">
				
					<% for ( int j = 0; j < regionList.size(); j++ ) { 
						HashMap region = regionList.get(j);
					%>
					<input type="checkbox" name="ch<%= region.get("regionNo") %>" id="ch<%= region.get("regionNo")%>" regionNo="<%= region.get("regionNo")%>" regionName="<%= region.get("regionName")%>"> 
					<label for="ch<%= region.get("regionNo")%>"><%= region.get("regionName") %></label>
					<% } %>
				</fieldset>
			</div>

			<%
				}
			%>

			<fieldset>
				<input type="button" id="btnSave" value="저장" /> <input type="button" id="btnCancel" value="취소" />
			</fieldset>
			
		</div>



	</div>

</body>
</html>