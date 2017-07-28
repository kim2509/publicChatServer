<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript">

	var startIndex = 0;
	var pageSize = 3;

	jQuery(document).ready(function(){
	
		publicMeetingTabSelected(0);
	});
	
	function publicMeetingTabSelected( tabIndex )
	{
		$('#myCafeMeetingList').hide();
		$('#popularCafeMeetingList').hide();
		
		$('#publicMeetingList .loading').show();
		
		if ( tabIndex == 0 )
		{
			$('#popularCafeMeetingList .empty').hide();
			$('#popularCafeMeetingList').show();
			
			var param = {"startIndex":0, "showCount" : 3};
			ajaxRequest('POST', '/nearhere/cafe/getPopularPublicMeetingListAjax.do', param , onPopularPublicMeetingListReceived );
		}
		else if ( tabIndex == 1 )
		{
			$('#myCafeMeetingList .empty').hide();
			$('#myCafeMeetingList').show();
			
			var param = {"startIndex":0, "showCount" : 3};
			ajaxRequest('POST', '/nearhere/cafe/getMyPublicMeetingListAjax.do', param , onMyPublicMeetingListReceived );
		}
		
		$('#publicMeetingTab li').removeClass('selected');
		$('#publicMeetingTab li').eq(tabIndex).addClass('selected');
	}
	
	function goMoreCafePublicMeetingList()
	{
		var titleUrlEncoded = encodeURIComponent('정모 리스트');
		var url = '<%= Constants.getServerURL() %>/cafe/moreCafePublicMeetingList.do';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function onMyPublicMeetingListReceived( result )
	{
		$('#publicMeetingList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#publicMeetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#myCafeMeetingList').html(html);
			
			if ( result.data.length > 0 )
			{
				$('#meetingListHomeDiv').show();
			}
		}
	}
	
	function onPopularPublicMeetingListReceived( result )
	{
		$('#publicMeetingList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#publicMeetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#popularCafeMeetingList').html(html);
			
			if ( result.data.length > 0 )
			{
				$('#meetingListHomeDiv').show();
			}
		}
	}
	
</script>

<div id="meetingListHomeDiv" style="background:white;border-radius:10px;border:1px solid gray;padding:10px;margin-bottom:10px;">

	<ul id="publicMeetingTab" class="tab2">
		<li onclick="publicMeetingTabSelected(0);" class="selected">인기 정모</li>
		<li onclick="publicMeetingTabSelected(1);">내 카페 정모</li>
	</ul>

	<div id="publicMeetingList">
	
		<div class="loading" style="display:none;">목록을 읽어오는 중입니다.</div>
		
		<div id="myCafeMeetingList" style="display:none;">
			
		</div>
		
		<div id="popularCafeMeetingList" style="display:none;">
			
		</div>
		
		<div class="more" onclick="goMoreCafePublicMeetingList();">정모 더 보기 &gt;</div>
	</div>
	
</div>