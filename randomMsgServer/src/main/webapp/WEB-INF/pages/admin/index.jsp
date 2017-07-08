<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">
	function sendEventPushToAdmin() {

		var title = $('input[name=title]').val();
		var eventSeq = $('input[name=eventSeq]').val();
		
		if ( confirm("Really?") )
			sendAjax( "sendEventPushToAdmin.do", {"title": title, "eventID" : eventSeq} );
		
	}

	function sendEventPushToAllUsers() {
		
		var title = $('input[name=title]').val();
		var eventSeq = $('input[name=eventSeq]').val();
		
		if ( confirm("Really?") )
			sendAjax( "sendEventPushToAllUsers.do",{ "title":title, "eventID" : eventSeq } );
		
	}
	
	function sendEventApplyPushToUser()
	{
		try
		{
			var title = $('input[name=title]').val();
			var userID = $('input[name=userID]').val();
			var eventSeq = $('input[name=eventSeq]').val();
			
			var userList = new Array(userID);
			
			var data = {"title":title, "userList":userList, "eventSeq": eventSeq };
			
			sendAjax('sendEventResult.do', data );
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function sendLocationUpdateToUser()
	{
		try
		{
			var userList = {"userID": $('input[name=locationUserID]').val()};
			
			if ( confirm("Really?") )
				sendAjax('sendLocationUpdateToUser.do', userList );
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function sendLocationUpdateToAllUsers()
	{
		try
		{
			var userList = {};
			
			if ( confirm("Really?") )
				sendAjax('sendLocationUpdateToAllUsers.do', userList );
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function sendAjax( url, data )
	{
		try {

			jQuery.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(data),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					try {
						alert(JSON.stringify(data));
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});

		} catch (ex) {
			alert(ex.message);
		}
	}
	
	
	function UpdateLocationCoordsForAllRegionAjax()
	{
		if ( !confirm('Really?') ) return;
		
		try {

			jQuery.ajax({
				type : "POST",
				url : 'UpdateLocationCoordsForAllRegionAjax.do',
				data : null,
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					try {
						console.log(JSON.stringify(data));
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});

		} catch (ex) {
			alert(ex.message);
		}
	}
	
	jQuery(document).ready(function(){
		
	});
	
</script>

</head>
<body>

	<a href="/nearhere/admin/allUsers.do">전체 사용자 보기(최근 100명)</a>
	<br/><br/>
	<a href="/nearhere/admin/allUsersOnMap.do">전체 사용자 보기(지도)</a>
	<br/><br/>
	
	<input type="button" value="관리자에게 이벤트 푸쉬 보내기"
		onclick="sendEventPushToAdmin();" />
	<br />
	<br/>
	<input type="button" value="전체 유저에게 이벤트 푸쉬 보내기"
		onclick="sendEventPushToAllUsers();" />
	
	<br/><br/><br/>
	
	<input type="text" size="100" name="title" value="여행정보, 뉴스, 관심지역 설정 기능이 업데이트 되었습니다."/><br/>
	<input type="text" size="20" name="userID" value="user27"/>
	<input type="text" size="10" name="eventSeq" value="7"/>
	<input type="button" value="이벤트접수푸쉬" onclick="sendEventApplyPushToUser();"/>

	<br/><br/><br/>
	
	<input type="text" size="20" name="locationUserID" value="user27"/>
	<input type="button" value="유저 위치 업데이트"
		onclick="sendLocationUpdateToUser();" />
		
	<input type="button" value="전체유저 위치 업데이트"
		onclick="sendLocationUpdateToAllUsers();" />
		
	<br/><br/><br/>
	
	<form name="fm" action="" method="post">
		<label>token</label>
		<input type="text" name="token" value="" />
		<input type="submit" value="token 전송"/>
	</form>
	
	<div>
	<br/> 집 : 
	<br/> user27 : aJRfZflWC7x9Rzs8cV0zvK0j/ZfYCzxjQ12GLkwBb3Q=
	<br/> 승균 user798 : n0/2wJfv25oiPAXH/4TFE52Dg3K3u5Qh+MTMk0WcoGs=
	<br/> 장원영 user5131 : fUWU7qxBr2OqiIgFwWIDdwCsgSkkFQzv7YfHNvsgZ/w=
	<br/> 정민경 user5080 : WEaXNqbUHVNCqQt7oY7XsJIFtSg4SdxyqzvJwucBZm0=
	<br/> 황군 user5031 : WVc+8vHc/Blip9zzgBQ8sq7/6oEwt6/dsw23H4nwrC0=
	<br/> 이애령 user4993 : siorSuZLaxqx7WwYOMANWHbl2BpJrsfGuzaJ/N8PDiM=
	<br/> 김미정 user4939 : RCLnwlihF5iXaC82+A/MrPyMBPvvzBWdvdakmya8SZo=
	</div>
	
	<div style="border:1px solid blue">
	<br/> 회사 : dwhwRpDSNdqUzxIoaOWIvqEEWv3q3h35uBk8CSBiJgY=
	<br/> user969 : qaNyx93+5QDkiku3G/JhNN36t1MBd+QY3tgiUXVHvNE=
	<br/> user1061 : W33uczJjO/WAfP1YVeuU2y7aQzkkTht1UDOv0FDODVE=
	</div>
	
	<br/><br/>
	<textarea rows="10" cols="150">select * from user u
	left outer join user_token ut on u.userID= ut.userID
where isDeleted is null and ut.hash is not null and ut.activeYN = 'Y'
and u.profileImageURL is not null and u.sex = 'F'
order by u.createdDate desc</textarea>

	<br/><br/>
	
	<input type="button" value="모든지역 좌표 초기화" onclick="UpdateLocationCoordsForAllRegionAjax();"/>
</body>
</html>