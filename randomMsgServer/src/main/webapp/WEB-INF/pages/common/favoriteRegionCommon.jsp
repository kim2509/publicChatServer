<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<link rel="stylesheet" type="text/css" href="<%=Constants.SECURE_CSS_PATH %>/favoriteRegionCommon.css" />

<%
	List<HashMap> myFavRegionList = (List<HashMap>) request.getAttribute("myFavRegionList");
	
	String emptyMsg = "관심지역이 설정되어 있지 않습니다.";
	if ( !Util.isEmptyString( request.getAttribute("favoriteRegionEmptyMessage") ) )
		emptyMsg = request.getAttribute("favoriteRegionEmptyMessage").toString();
%>

	<div id="favoriteRegionDiv">
		<div id="linkDiv" onclick="goFavoriteRegionPage();">설정</div>
		<div id="subTitle">관심지역</div>
		<% if ( myFavRegionList != null && myFavRegionList.size() > 0 ) { %>
		<ul class="favoriteRegionUL">
		<%
			for ( int i = 0; i < myFavRegionList.size(); i++ )
			{
				String level = myFavRegionList.get(i).get("level").toString();
				String regionNo = myFavRegionList.get(i).get("regionNo").toString();
				String regionName = myFavRegionList.get(i).get("regionName").toString();
				String lastRegionName = Util.getStringFromHash(myFavRegionList.get(i), "lastRegionName");
				
				if ( i == 0 )
					out.println("<li class='selected' level='" + level + "' regionNo='" + regionNo + "' lastRegionName='" + lastRegionName + 
					"' onclick=\"changeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
						 regionName + "</li>");
				else
					out.println("<li  level='" + level + "' regionNo='" + regionNo + "' lastRegionName='" + lastRegionName + 
					"' onclick=\"changeRegion( this, '" + regionNo + "', '" + level + "')\">" + 
							regionName + "</li>");
			}
		
			if ( myFavRegionList.size() % 2 != 0 ){
				out.println("<li>&nbsp;</li>");
			}
		%>	
		</ul>
		<% } else { %>
		<p><%= emptyMsg %></p>
		<% } %>
	</div>