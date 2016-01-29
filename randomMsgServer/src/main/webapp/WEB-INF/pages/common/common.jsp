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
		
});

</script>

<script id="postT" type="text/x-handlebars-template">
	<dl class="slide_lst">
		{{#each postsNearHere}}
		<dd>
			<div class="imgStatus">
				<img src='{{printPostStatus status}}' width="60" height="60"/>
			</div>
			<div class='userProfile' onclick="openUserProfile('{{user.userID}}');">
				<img class="lazy" data-original='<%= Constants.getThumbnailImageURL() %>/{{user.profileImageURL}}' 
					src="<%= Constants.IMAGE_PATH %>/no_image.png" width="80" height="80"/>
			</div>
			<div class='postDesc' onclick="goVIP('{{postID}}')">
				<strong class="tit">{{message}}</strong>
				<div id="departureDateTime">{{departureDateTime}}</div>
				<div id="readCount">조회수 : {{readCount}}</div>
				<div id="personInfo"><div id="userSex">{{printSexInfo user.sex}}</div><div id="userName">{{user.userName}}</div></div>
				<div id="tags"><span>{{vehicle}}</span><span>{{fareOption}}</span><span>{{numOfUsers}}</span></div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>