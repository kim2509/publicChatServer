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

		if ( confirm("Really?") )
			sendAjax( "sendEventPushToAdmin.do", {"eventID" : "1"} );
		
	}

	function sendEventPushToAllUsers() {
		
		if ( confirm("Really?") )
			sendAjax( "sendEventPushToAllUsers.do",{ "eventID" : "1" } );
		
	}
	
	function sendEventApplyPushToUser()
	{
		try
		{
			var userID = $('input[name=userID]').val();
			
			var userList = new Array(userID);
			
			sendAjax('sendEventResult.do', userList );
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
	
</script>

</head>
<body>

	<input type="button" value="관리자에게 이벤트 푸쉬 보내기"
		onclick="sendEventPushToAdmin();" />
	<br />
	<br/>
	<input type="button" value="전체 유저에게 이벤트 푸쉬 보내기"
		onclick="sendEventPushToAllUsers();" />
	
	<br/><br/><br/>
	
	<input type="text" size="20" name="userID" value="user27"/>
	<input type="button" value="이벤트접수푸쉬" onclick="sendEventApplyPushToUser();"/>

</body>
</html>