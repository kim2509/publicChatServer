<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String cafeID = request.getParameter("cafeID");
	String isApp = request.getParameter("isApp");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>카페 관리하기</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage_member.css?v=" />

<script language="javascript">

	var isApp = '<%= isApp %>';
	var cafeMemberList = null ;
	
	var startIndex = 0;
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	var pageNo = 1;
	var pageSize = 10;
	var totalItemCount = 0;

	jQuery(document).ready(function(){
		
		try
		{
			Handlebars.registerHelper('displayUserProfileImage', displayUserProfileImage );
			Handlebars.registerHelper('displayManageButtons', displayManageButtons );

			getCafeMemberList();
		}
		catch( ex )
		{
			alert(ex.message);
		}
		
	});
	
	function getCafeMemberList()
	{
		var param = {"cafeID":"<%= cafeID %>", "startIndex" : startIndex, "PageSize" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeMembersForManageAjax.do', param , onMemberListResult );	
	}
	
	function onMemberListResult( result )
	{
		try
		{
			var source = $('#memberT').html();
			var template = Handlebars.compile(source);
			var html = template(result.data.memberList);
			$('#memberList').html(html);
			
			totalItemCount = result.data.TotalMembersCount;
			
			$('#headerInfo').html('회원 전체 ' + totalItemCount + '명');
			displayPagingInfo();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function displayUserProfileImage(profileImageURL)
	{
		if ( profileImageURL != null && profileImageURL.length > 0 )
			return new Handlebars.SafeString('<img src="<%= Constants.getThumbnailImageSSLURL() %>/' + 
					profileImageURL + '" width=80 height=80/>');
		else return new Handlebars.SafeString('<img src="" width=80 height=80/>');
	}
	
	function displayManageButtons( memberType, userID, userName )
	{
		var buttonString = '';
		
		if ( memberType == '운영자' )
			buttonString += '<input type="button" class="manageButtons" value="운영자해제" ' +
			'onclick="releaseOperator(\'' + userID + '\',\'' + userName + '\')"/>';
		else if ( memberType == '회원' )
			buttonString += '<input type="button" class="manageButtons" value="운영자임명" ' +
			'onclick="grantOperator(\'' + userID + '\',\'' + userName + '\')"/>';
			
		if ( memberType == '운영자' || memberType == '회원' )
		{
			buttonString += '<input type="button" class="manageButtons" value="탈퇴" ' +
			'onclick="deleteMember(\'' + userID + '\',\'' + userName + '\')"/>';	
		}
		
		return new Handlebars.SafeString(buttonString);
	}
	
	function grantOperator( userID, userName )
	{
		if ( confirm( userName +'님을 운영자로 임명하시겠습니까?') )
		{
			var param = {"cafeID":"<%= cafeID %>", "userID": userID, "memberType": "1" };
			ajaxRequest('POST', '/nearhere/cafe/updateCafeMemberTypeAjax.do', param , onResult );	
		}
	}

	function releaseOperator( userID, userName )
	{
		if ( confirm( userName +'님을 운영자에서 해제하시겠습니까?') )
		{
			var param = {"cafeID":"<%= cafeID %>", "userID": userID, "memberType": "0" };
			ajaxRequest('POST', '/nearhere/cafe/updateCafeMemberTypeAjax.do', param , onResult );	
		}
	}
	
	function deleteMember( userID, userName )
	{
		if ( confirm( userName +'님을 카페에서 탈퇴하시겠습니까?') )
		{
			var param = {"cafeID":"<%= cafeID %>", "userID": userID };
			ajaxRequest('POST', '/nearhere/cafe/deleteCafeMemberAjax.do', param , onResult );
		}
	}
	
	function onResult(result)
	{
		try
		{
			getCafeMemberList();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function displayPagingInfo()
	{
		$('#pagingInfo').empty();
		
		if ( pageNo <= numOfPagesOnScreen )
			firstPage = 1;
		else
		{
			firstPage = parseInt(pageNo / numOfPagesOnScreen) * numOfPagesOnScreen;
			if ( pageNo % numOfPagesOnScreen == 0 )
				firstPage = firstPage - numOfPagesOnScreen + 1;
			else
				firstPage++;
		}
		
		lastPage = parseInt( totalItemCount / pageSize );
		if ( (parseInt(totalItemCount) % parseInt(pageSize)) > 0)
			lastPage++;
		
		if ( firstPage > numOfPagesOnScreen + 1)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(1);">&lt;&lt;</a>');
		
		if ( firstPage != 1 )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage - 1) + ');">&lt;</a>');
		
		for ( var i = 0; i < numOfPagesOnScreen; i++ )
		{
			if ( firstPage + i == pageNo)
			{
				$('#pagingInfo').append('<b><a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" class="pageSelected">' + (firstPage + i) + '</a></b>');
			}
			else
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" >' + (firstPage + i) + '</a>');
			}
		
			if ( (firstPage + i) == lastPage )
				break;
		}
		
		if ( lastPage >= firstPage + numOfPagesOnScreen )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + numOfPagesOnScreen) + ');" >&gt;</a>');
		
		if ( firstPage + numOfPagesOnScreen <= lastPage )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + lastPage + ');" >&gt;&gt;</a>');
		
	}
	
	function goPage(num)
	{
		pageNo = num;
		startIndex = (pageNo - 1) * pageSize;
		getCafeMemberList();
	}
	
</script>
<script id="memberT" type="text/x-handlebars-template">
	{{#if this}}	
	<ul>
		{{#each this}}
		<li>
			<div id="imgProfile">
				{{displayUserProfileImage profileImageURL}}
			</div>
			<div id="memberType">{{memberType}}</div>
			<div id="memberInfo">
				<div>{{userName}}</div>
			</div>
			<div id="manageBtns">
				<div>
					{{displayManageButtons memberType userID userName}}
				</div>
			</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="emptyDiv">카페 회원이 존재하지 않습니다.</div>
	{{/if}}
</script>
</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">회원 관리</div>
		</div>
		
		<div id="headerInfo">
			회원 전체 50명
		</div>
		
		<div id="container">
		
			<div id="memberList">
			
			</div>
			
			<div id="pagingInfo" style="text-align:center;font-weight:bold;">
				
			</div>
		</div>
					
	</div>
	
</body>
</html>