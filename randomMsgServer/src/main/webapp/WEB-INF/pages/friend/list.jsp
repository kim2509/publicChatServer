<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<%
	String isApp = request.getParameter("isApp");
	
	List<HashMap> friendRequestList = null;
	if ( request.getAttribute("friendRequestList") != null )
		friendRequestList = (List<HashMap>) request.getAttribute("friendRequestList");
	
	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
%>
<html>

<head>
<title>이근처 합승</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/common.css" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/category.css?v=3" />
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/friends.css?v=2" />

<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>	

<link rel="stylesheet" href="<%=Constants.CSS_PATH%>/jquery.mobile-1.4.5.min.css">
<!-- Include the jQuery library -->
<script src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<!-- Include the jQuery Mobile library -->
<script src="<%=Constants.JS_PATH%>/jquery.mobile-1.4.5.min.js"></script>
  
<script language="javascript">

	var isApp = '<%= isApp %>';
	var loginID = '';
	
	jQuery(document).ready(function() {

		$('#keyword').keyup( function(){
			searchUser();
		});
	
		$('#keyword').change( function(){
			var keyword = $('#keyword').val();
			
			if ( keyword == '' || keyword.length == 0 ) $('#searchResult').empty();
			
		});
		
		if ( isApp == 'Y' && Android && Android != null && typeof Android != 'undefined')
		{
			loginID = Android.getUserID();		
		}


		getFriendRequestList();
		getFriendsList();
		
	});
	
	function getFriendRequestList()
	{
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/friend/getFriendRequestList.do?userID=" + loginID,
			data : null,
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result == null || result.data == null || result.data.friendRequestList == null || result.data.friendRequestList.length < 1)
					{
						$('#friendRequestSection').hide();
						return;
					}
					
					$('#friendRequestSection').show();
					
					var source = $('#userRequestT').html();
					var template = Handlebars.compile(source);
					var html = template(result.data);
					$('#requestList').html(html);
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}

	function openUserProfile( userID )
	{
		var url = '<%= userInfoPage %>' + '?userID=' + userID;
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + encodeURIComponent('사용자정보') + '&url=' + encodeURIComponent(url);
		else
			document.location.href = decodeURIComponent(url);
	}
	
	function searchUser()
	{
		var keyword = $('#keyword').val();
		
		$('#searchResult').empty();
		
		if ( keyword.length < 1 ) return;
		
		keyword = encodeURIComponent( keyword );
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/friend/searchUsers.do?keyword=" + keyword,
			data : null,
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result == null || result.data == null || result.data.userList == null ) return;
					
					if ( result.data.userList.length < 1 ) return;
					
					var source = $('#userT').html();
					var template = Handlebars.compile(source);
					var html = template(result.data);
					$('#searchResult').html(html);
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	
	function requestFriend( element, userID2 )
	{
		var requestParam = {"userID": loginID, "userID2":userID2 };
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/friend/askFriendRequest.do",
			data : JSON.stringify( requestParam ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result.resCode != '0000' ) return;
					
					$(element).addClass('ui-disabled');
					$(element).html('요청중');
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	
	function acceptFriendRequest( element, userID2 )
	{
		var requestParam = {"userID": loginID, "userID2":userID2 };
		
		if ( isApp == 'Y' && Android && Android != null && typeof Android != 'undefined')
		{
			Android.refreshFriendTabCount();		
		}
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/friend/acceptFriendRequest.do",
			data : JSON.stringify( requestParam ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result.resCode != '0000' ) return;
					
					$(element).closest('dd').remove();
					
					getFriendsList();
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	
	function getFriendsList()
	{
		$('#friendsList').empty();
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/friend/getFriendsList.do?userID=" + loginID,
			data : null,
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result == null || result.data == null || result.data.friendsList == null || result.data.friendsList.length < 1 )
					{
						$('#empty').show();
						return;
					}
					
					$('#empty').hide();
					
					var source = $('#friendT').html();
					var template = Handlebars.compile(source);
					var html = template(result.data);
					$('#friendsList').html(html);
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	
</script>

<script id="userRequestT" type="text/x-handlebars-template">
	<dl class="user_list">
		{{#each friendRequestList}}
		<dd>
			<div class='userProfile' onclick="openUserProfile('{{userID}}');">
				<img src='<%= Constants.getThumbnailImageURL() %>/{{profileImageURL}}' 
					width="70" height="70" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
			</div>
			<div class='desc' >
				<div id='name'>{{userName}}</div>
				<div class="btns">
					<a href="javascript:void(0)" onclick="acceptFriendRequest( this, '{{userID}}');" 
						class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-shadow ui-mini" data-rel="dialog">요청수락</a></div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>

<script id="userT" type="text/x-handlebars-template">
	<dl class="user_list">
		{{#each userList}}
		<dd>
			<div class='userProfile' onclick="openUserProfile('{{userID}}');">
				<img src='<%= Constants.getThumbnailImageURL() %>/{{profileImageURL}}' 
					width="70" height="70" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
			</div>
			<div class='desc' >
				<div id='name'>{{userName}}</div>
				<div class="btns">
					<a href="javascript:void(0)" onclick="requestFriend( this, '{{userID}}');" 
						class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-shadow ui-mini" data-rel="dialog">친구요청</a></div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>

<script id="friendT" type="text/x-handlebars-template">
	<dl class="user_list">
		{{#each friendsList}}
		<dd>
			<div class='userProfile' onclick="openUserProfile('{{userID}}');">
				<img src='<%= Constants.getThumbnailImageURL() %>/{{profileImageURL}}' 
					width="70" height="70" onError="this.src='<%= Constants.IMAGE_PATH %>/no_image.png';"/>
			</div>
			<div class='desc' >
				<div id='name'>{{userName}}</div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>

</head>
<body>

	<div id="wrapper" style="margin:10px;">
	
		<div class="section" id="friendRequestSection" style="display:none;">
			<div id="menu_category">
				<div class="title"><span class="s_tit">친구요청</span></div>
			</div>
			
			<div id="requestList">			
			</div>
		</div>
		
		<div class="section">
			<div id="menu_category">
				<div class="title"><span class="s_tit">회원검색</span></div>
			</div>
			
			<form class="ui-filterable">
			  <input id="keyword" data-type="search" placeholder="아이디 혹은 이름을 입력하세요">
			</form>
			
			<div id="searchResult" data-filter="false" data-input="#keyword">
			</div>
		</div>
		
		<div class="section">
			<div id="menu_category">
				<div class="title"><span class="s_tit">친구</span></div>
			</div>
			
			<div id="empty" style="display:none">
				등록된 친구가 없습니다.
			</div>
			
			<div id="friendsList">			
			</div>
			
		</div>
	</div>
	
</body>
</html>
