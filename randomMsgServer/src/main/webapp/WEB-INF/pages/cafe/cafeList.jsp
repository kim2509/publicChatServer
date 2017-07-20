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
		$('#popularCafeList').hide();
		
		$('#cafeList .loading').show();
		
		if ( tabIndex == 0 )
		{
			$('#popularCafeList .empty').hide();
			$('#popularCafeList').html('');
			$('#popularCafeList').show();
			var param = {"startIndex":0, "showCount" : 10};
			ajaxRequest('POST', '/nearhere/cafe/getPopularCafeListAjax.do', param , onPopularCafeListReceived );			
		}
		else if ( tabIndex == 1 )
		{
			$('#myCafeList .empty').hide();
			$('#myCafeList').html('');
			$('#myCafeList').show();
			var param = {"startIndex":0, "showCount" : 10};
			ajaxRequest('POST', '/nearhere/cafe/getMyCafeListAjax.do', param , onMyCafeListReceived );
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
		$('#cafeList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#popularCafeList').html(html);
		}
	}
		
</script>

<div id="section">

	<ul id="cafeTab" class="tab2">
		<li onclick="cafeTabSelected(0);" class="selected">인기 카페</li>
		<li onclick="cafeTabSelected(1);">내 카페</li>
	</ul>

	<div id="cafeList">
	
		<div class="loading" style="display:none;">목록을 읽어오는 중입니다.</div>
	
		<div id="myCafeList" style="display:none;">
		</div>
		
		<div id="popularCafeList" style="display:none;">
		</div>

		
		<div class="more" onclick="goMoreCafeList();" >더 보기 &gt;</div>
		
	</div>

</div>
