<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript">
	function publicMeetingTabSelected( tabIndex )
	{
		$('#myCafeMeetingList').hide();
		$('#favRegionCafeMeetingList').hide();
		$('#popularCafeMeetingList').hide();
		
		if ( tabIndex == 0 )
		{
			$('#myCafeMeetingList').show();
		}
		else if ( tabIndex == 1 )
		{
			$('#favRegionCafeMeetingList').show();
		}
		else if ( tabIndex == 2 )
		{
			$('#popularCafeMeetingList').show();
			
			ajaxRequest('POST', '/nearhere/cafe/getPopularPublicMeetingListAjax.do', null , onPopularPublicMeetingListReceived );
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
	
	function onPopularPublicMeetingListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		$('#popularCafeMeetingList .loading').hide();
		
		if ( result != null && result.data != null && result.data.length > 0 )
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
		<li onclick="goMeetingDetail('junggonara','2')">
			<div id="title">{{title}}</div>
			<div id="meetingDate">{{displayDateFormat meetingDate 'MM-dd HH:mm'}}</div>
			<div id="memberCount">참석인원 : {{cntMembers}}/{{maxNo}}</div>
			<div id="cafeName">{{cafeName}}</div>
			<div id="location">서울시 강남구 역삼1동 738-5</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">카페가 존재하지 않습니다.</div>
	{{/if}}			
</script>

<div id="section">

	<ul id="publicMeetingTab" class="tab3">
		<li onclick="publicMeetingTabSelected(0);" class="selected">내 카페 정모</li>
		<li onclick="publicMeetingTabSelected(1);">관심지역 정모</li>
		<li onclick="publicMeetingTabSelected(2);">인기 정모</li>
	</ul>

	<div id="publicMeetingList">
	
		<div id="myCafeMeetingList" style="display:none;">
			<ul class="meetingListUL">
				<li onclick="goMeetingDetail('junggonara','2')">
					<div id="title">영화나 한편 볼까요?</div>
					<div id="meetingDate">05-18 00:00</div>
					<div id="memberCount">참석인원 : 3/10</div>
					<div id="cafeName">중고나라2</div>
					<div id="location">서울시 강남구 역삼1동 738-5</div>
				</li>
				<li onclick="goMeetingDetail('junggonara','2')">
					<div id="title">영화나 한편 볼까요?</div>
					<div id="meetingDate">05-18 00:00</div>
					<div id="memberCount">참석인원 : 3/10</div>
					<div id="cafeName">중고나라2</div>
					<div id="location">서울시 강남구 역삼1동 738-5</div>
				</li>
				<li onclick="goMeetingDetail('junggonara','2')">
					<div id="title">영화나 한편 볼까요?</div>
					<div id="meetingDate">05-18 00:00</div>
					<div id="memberCount">참석인원 : 3/10</div>
					<div id="cafeName">중고나라2</div>
					<div id="location">서울시 강남구 역삼1동 738-5</div>
				</li>
			</ul>
		</div>
		
		<div id="favRegionCafeMeetingList" style="display:none;">
			<ul class="meetingListUL">
				<li onclick="goMeetingDetail('junggonara','2')">
					<div id="title">영화나 한편 볼까요?</div>
					<div id="meetingDate">05-18 00:00</div>
					<div id="memberCount">참석인원 : 3/10</div>
					<div id="cafeName">중고나라2</div>
					<div id="location">서울시 강남구 역삼1동 738-5</div>
				</li>
				<li onclick="goMeetingDetail('junggonara','2')">
					<div id="title">영화나 한편 볼까요?</div>
					<div id="meetingDate">05-18 00:00</div>
					<div id="memberCount">참석인원 : 3/10</div>
					<div id="cafeName">중고나라2</div>
					<div id="location">서울시 강남구 역삼1동 738-5</div>
				</li>
			</ul>
		</div>
		
		<div id="popularCafeMeetingList" style="display:none;">
			<ul class="meetingListUL">
				<li onclick="goMeetingDetail('junggonara','2')">
					<div id="title">영화나 한편 볼까요?</div>
					<div id="meetingDate">05-18 00:00</div>
					<div id="memberCount">참석인원 : 3/10</div>
					<div id="cafeName">중고나라2</div>
					<div id="location">서울시 강남구 역삼1동 738-5</div>
				</li>
			</ul>
		</div>
		
		<div class="more" onclick="goMoreCafePublicMeetingList();">더 보기 &gt;</div>
	</div>
	
</div>