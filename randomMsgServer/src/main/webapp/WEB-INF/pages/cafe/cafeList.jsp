<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");	
%>

<script language="javascript">

	function cafeTabSelected( tabIndex )
	{
		$('#myCafeList').hide();
		$('#favRegionCafeList').hide();
		$('#popularCafeList').hide();
		
		$('#cafeList .loading').show();
		
		if ( tabIndex == 0 )
		{
			$('#myCafeList').show();
			var param = {"startIndex":0, "showCount" : 10};
			ajaxRequest('POST', '/nearhere/cafe/getMyCafeListAjax.do', param , onMyCafeListReceived );			
		}
		else if ( tabIndex == 1 )
		{
			$('#favRegionCafeList').show();
			$('#cafeList .loading').hide();
		}
		else if ( tabIndex == 2 )
		{
			$('#popularCafeList').show();
			var param = {"startIndex":0, "showCount" : 10};
			ajaxRequest('POST', '/nearhere/cafe/getPopularCafeListAjax.do', param , onPopularCafeListReceived );
		}
			
		$('#cafeTab li').removeClass('selected');
		$('#cafeTab li').eq(tabIndex).addClass('selected');
	}
	
	function goMoreCafeList()
	{
		var titleUrlEncoded = encodeURIComponent('카페 리스트');
		var url = '<%= Constants.getServerURL() %>/cafe/moreCafeList.do?isApp=<%= isApp %>';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function onMyCafeListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		$('#cafeList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#myCafeList').html(html);
			
			if ( result.data.length == 0 )
			{
				$('#myCafeList .empty').html('가입한 카페가 존재하지 않습니다.');
			}
		}
	}
	
	function onPopularCafeListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		$('#cafeList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#popularCafeList').html(html);
		}
	}
	
	function goCafeHome( cafeID )
	{
		var url = '<%= Constants.getServerURL() %>/cafe/' + cafeID +'?isApp=<%= isApp %>';

		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent( url ) + '';
		else
			document.location.href= url;
	}
	
</script>
<script id="cafeT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="cafeListUL">
		{{#each data}}
		<li onclick="goCafeHome('{{cafeID}}');">
			<div>
				<div class="cafeImage">
				<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
				</div>
				<div class="cafeInfo">
					<div class="cafeTitle">{{cafeName}}</div>
					<div class="cafeDesc">{{mainDesc}}</div>
					<div class="regionInfo">{{lRegionName}} {{mRegionName}} {{sRegionName}} {{tRegionName}}</div>
					<div class="memberInfo">멤버수 : {{cntMembers}}명</div>
				</div>
			</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">카페가 존재하지 않습니다.</div>
	{{/if}}
</script>

<div id="section">

	<ul id="cafeTab" class="tab3">
		<li onclick="cafeTabSelected(0);" class="selected">내 카페</li>
		<li onclick="cafeTabSelected(1);">관심지역 카페</li>
		<li onclick="cafeTabSelected(2);">인기 카페</li>
	</ul>

	<div id="cafeList">
	
		<div class="loading" style="display:none;">목록을 읽어오는 중입니다.</div>
	
		<div id="myCafeList" style="display:none;">
		</div>
		
		<div id="favRegionCafeList" style="display:none;">
		</div>
		
		<div id="popularCafeList" style="display:none;">
		</div>

		
		<div class="more" onclick="goMoreCafeList();" >더 보기 &gt;</div>
		
	</div>

</div>
