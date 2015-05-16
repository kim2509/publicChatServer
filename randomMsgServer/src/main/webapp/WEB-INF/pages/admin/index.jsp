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
		try {

			jQuery.ajax({
				type : "POST",
				url : "sendEventPushToAdmin.do",
				data : JSON.stringify({
					"eventID" : "1"
				}),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
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

	function sendEventPushToAllUsers() {
		try {

			jQuery.ajax({
				type : "POST",
				url : "sendEventPushToAllUsers.do",
				data : JSON.stringify({
					"eventID" : "1"
				}),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
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
	<input type="button" value="전체 유저에게 이벤트 푸쉬 보내기"
		onclick="sendEventPushToAllUsers();" />

</body>
</html>