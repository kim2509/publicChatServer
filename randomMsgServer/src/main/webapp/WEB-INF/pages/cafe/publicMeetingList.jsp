<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript">

	var startIndex = 0;
	var pageSize = 3;

	function publicMeetingTabSelected( tabIndex )
	{
		$('#myCafeMeetingList').hide();
		$('#favRegionCafeMeetingList').hide();
		$('#popularCafeMeetingList').hide();
		
		$('#publicMeetingList .loading').show();
		
		if ( tabIndex == 0 )
		{
			$('#myCafeMeetingList .empty').hide();
			$('#myCafeMeetingList').show();
			
			var param = {"startIndex":0, "showCount" : 3};
			ajaxRequest('POST', '/nearhere/cafe/getMyPublicMeetingListAjax.do', param , onMyPublicMeetingListReceived );
		}
		else if ( tabIndex == 1 )
		{
			$('#favRegionCafeMeetingList').show();
			$('#publicMeetingList .loading').hide();
		}
		else if ( tabIndex == 2 )
		{
			$('#popularCafeMeetingList .empty').hide();
			$('#popularCafeMeetingList').show();
			
			var param = {"startIndex":0, "showCount" : 3};
			ajaxRequest('POST', '/nearhere/cafe/getPopularPublicMeetingListAjax.do', param , onPopularPublicMeetingListReceived );
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
		console.log(JSON.stringify(result));
		
		$('#publicMeetingList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#publicMeetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#myCafeMeetingList').html(html);
		}
	}
	
	function onPopularPublicMeetingListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		$('#publicMeetingList .loading').hide();
		
		if ( result != null && result.data != null )
		{
			var source = $('#publicMeetingT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#popularCafeMeetingList').html(html);
		}
	}
	
</script>
<script id="publicMeetingT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="meetingListUL">
		{{#each data}}
		<li onclick="goMeetingDetail('{{cafeID}}','{{meetingNo}}')">
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{cntMembers}}/{{maxNo}}</div>
			<div id="cafeName">{{cafeName}}</div>
			<div id="location">{{address}}</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">정모가 존재하지 않습니다.</div>
	{{/if}}			
</script>

<div id="section">

	<ul id="publicMeetingTab" class="tab3">
		<li onclick="publicMeetingTabSelected(0);" class="selected">내 카페 정모</li>
		<li onclick="publicMeetingTabSelected(1);">관심지역 정모</li>
		<li onclick="publicMeetingTabSelected(2);">인기 정모</li>
	</ul>

	<div id="publicMeetingList">
	
		<div class="loading" style="display:none;">목록을 읽어오는 중입니다.</div>
		
		<div id="myCafeMeetingList" style="display:none;">
			
		</div>
		
		<div id="favRegionCafeMeetingList" style="display:none;">
			
			<!-- 관심지역 정모 리스트 -->
			<jsp:include page="favoriteRegionMeetingList.jsp" flush="true"></jsp:include>
			<!-- 관심지역 정모 리스트 -->
			
		</div>
		
		<div id="popularCafeMeetingList" style="display:none;">
			
		</div>
		
		<div class="more" onclick="goMoreCafePublicMeetingList();">더 보기 &gt;</div>
	</div>
	
</div>