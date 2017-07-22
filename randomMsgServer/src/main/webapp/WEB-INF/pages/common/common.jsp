<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String version = request.getParameter("appVersion");
	double appVersion = 0;
	if ( !Util.isEmptyString(version) )
		appVersion = Double.parseDouble(version);

	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
	
%>
<script id="postT" type="text/x-handlebars-template">
	<dl class="slide_lst">
		{{#each postsNearHere}}
		<dd>
			<div class="imgStatus" onclick="openUserProfile('{{user.userID}}');">
				<img src='{{printPostStatus status}}' width="50" height="50"/>
			</div>
			<div class='userProfile' onclick="openUserProfile('{{user.userID}}');">
				<img src='<%= Constants.getThumbnailImageURL() %>/{{user.profileImageURL}}' 
					width="70" height="70" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
				{{printKakaoIcon user.kakaoID}}
			</div>
			<div class='postDesc' onclick="goVIP('{{postID}}')">
				{{printReplyCount replyCount}}
				<strong class="tit">{{message}}</strong>
				<div id="departureDateTime">{{departureDateTime}}</div>
				<div id="readCount">조회수: {{readCount}}</div>
				<div id="personInfo"><div id="userSex">{{printSexInfo user.sex}}</div><div id="userName">{{user.userName}}</div></div>
				<div id="tags"><span>{{vehicle}}</span><span>{{fareOption}}</span>{{printNumOfUsers numOfUsers}}{{printRepeat repetitiveYN}}</div>
				<div id="addressInfo">{{fromAddress}} >> {{toAddress}}</div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>

<script language="javascript">

function printPostStatus( status )
{
	var imgURL = '<%= Constants.IMAGE_PATH %>/progressing.png';
	
	if ( status == '진행중' )
		return imgURL;
	else
		return '<%= Constants.IMAGE_PATH %>/finished.png';
	
	return imgURL;
}

function printSexInfo( sex )
{
	if ( sex == 'M' )
		return new Handlebars.SafeString('<img class="sex" src="<%= Constants.IMAGE_PATH %>/ic_male.png" width="15" height="15"/>');
	else if ( sex == 'F' )
		return new Handlebars.SafeString('<img class="sex" src="<%= Constants.IMAGE_PATH %>/ic_female.png" width="15" height="15"/>');
}


jQuery(document).ready(function() {

	Handlebars.registerHelper('printSexInfo', printSexInfo);
	Handlebars.registerHelper('printPostStatus', printPostStatus);
	Handlebars.registerHelper('printRepeat', printRepeat);
	Handlebars.registerHelper('printReplyCount', printReplyCount);
	Handlebars.registerHelper('printKakaoIcon', printKakaoIcon);
	Handlebars.registerHelper('printNumOfUsers', printNumOfUsers);
});

function printRepeat( value )
{
	if ( value == 'Y')
		return new Handlebars.SafeString('<span>반복</span>');
	else
		return '';
}

function printReplyCount( count )
{
	if ( count == null || count == '' ) return '';
	
	if ( parseInt( count) < 1 ) return '';
	
	return new Handlebars.SafeString('<div id="replyCount"><div style="position:absolute;color:white;top:7px;right:17px;padding-top:5px;font-size:11px;">' 
		+ count + '</div><div style="clear:both"><img src=\'<%= Constants.IMAGE_PATH %>/ic_chat.png\' width=\'20\' height=\'20\' /></div></div>');
}

function printKakaoIcon( kakaoID )
{
	if ( kakaoID != null && kakaoID.length > 0 )
		return new Handlebars.SafeString('<img src=\'<%= Constants.IMAGE_PATH %>/kakaotalk_icon.png\' width=\'18\' height=\'18\' id=\'kakao\'/>');
	else
		return '';
}

function printNumOfUsers( numOfUsers )
{
	if ( numOfUsers == '상관없음' )
		return '';
	else
		return new Handlebars.SafeString('<span>' + numOfUsers + '</span>');;
}

function openUserProfile( userID )
{
	var url = '<%= userInfoPage %>' + '?userID=' + userID;
	
	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?title=' + encodeURIComponent('사용자정보') + '&url=' + encodeURIComponent(url);
	else
		document.location.href = decodeURIComponent(url);
}

function goCafeHome( cafeID )
{
	var url = '<%= Constants.getServerURL() %>/cafe/cafeHome.do?cafeID=' + cafeID;

	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_CAFE_HOME %>&url=' + encodeURIComponent( url ) + '';
	else
		document.location.href= url;
}

function goBoardHome( boardName, boardNo )
{
	var url = "<%= Constants.getServerURL() %>/boardPost/boardHome.do?boardNo=" + boardNo;
	
	var titleUrlEncoded = encodeURIComponent( boardName );
	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_BOARD_HOME %>&title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

function goPostDetail(postNo )
{
	var url = "<%= Constants.getServerURL() %>/boardPost/detail.do?postNo=" + postNo;

	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_BOARD_POST_DETAIL %>&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

function goMeetingDetail( cafeID, meetingNo )
{
	var url = '<%= Constants.getServerURL() + "/cafe/meetingDetail.do" %>?cafeID=' +
			cafeID + '&meetingNo=' + meetingNo;

	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_PUBLIC_MEETING_DETAIL %>&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

function goSearchCafeBoard( cafeID, boardNo )
{
	var url = '<%= Constants.getServerURL() + "/boardPost/searchCafeBoard.do" %>?cafeID=' +
			cafeID + '&boardNo=' + boardNo;

	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_SEARCH_BOARD %>&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

function goMoreCafeMeetingList( cafeID )
{
	var url = '<%= Constants.getServerURL() + "/cafe/moreCafeMeetingList.do" %>?cafeID=' +
			cafeID;

	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_CAFE_MEETINGlIST %>&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

function goMoreCafeMemberList( cafeID )
{
	var url = '<%= Constants.getServerURL() + "/cafe/moreCafeMemberList.do" %>?cafeID=' +
			cafeID;

	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_CAFE_MEETINGlIST %>&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

function goFavoriteRegionPage()
{
	var titleUrlEncoded = encodeURIComponent('관심지역설정');
	var url = '<%= Constants.getServerURL() %>/region/favoriteRegion.do';
	
	if ( isApp == 'Y' )
		document.location.href='nearhere://openURL?title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
	else
		document.location.href= url;
}

</script>
