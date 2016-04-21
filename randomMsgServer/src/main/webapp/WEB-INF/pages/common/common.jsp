<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

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

</script>

<script id="postT" type="text/x-handlebars-template">
	<dl class="slide_lst">
		{{#each postsNearHere}}
		<dd>
			<div class="imgStatus" onclick="openUserProfile('{{user.userID}}');">
				<img src='{{printPostStatus status}}' width="50" height="50"/>
			</div>
			<div class='userProfile' onclick="openUserProfile('{{user.userID}}');">
				<img class="lazy" data-original='<%= Constants.getThumbnailImageURL() %>/{{user.profileImageURL}}' 
					src="<%= Constants.IMAGE_PATH %>/no_image.png" width="70" height="70"/>
				{{printKakaoIcon user.kakaoID}}
			</div>
			<div class='postDesc' onclick="goVIP('{{postID}}')">
				{{printReplyCount replyCount}}
				<strong class="tit">{{message}}</strong>
				<div id="departureDateTime">{{departureDateTime}}</div>
				<div id="readCount">조회수: {{readCount}}</div>
				<div id="personInfo"><div id="userSex">{{printSexInfo user.sex}}</div><div id="userName">{{user.userName}}</div></div>
				<div id="tags"><span>{{vehicle}}</span><span>{{fareOption}}</span>{{printNumOfUsers numOfUsers}}{{printRepeat repetitiveYN}}</div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>