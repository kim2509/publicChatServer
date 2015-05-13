<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/handlebars-v3.0.3.js"></script>
	
	<style type="text/css">
		table, td{margin:0px;}
		#wrapper{margin-top:15px;padding:0px;padding-bottom:20px;}
		.region tr{height:40px;}
		.region td{padding-left:5px;padding-right:5px;text-align:center;font-size:14px;}
		.countItem { clear:both;margin-top:10px; }
		#divCountPerResion {margin-top:10px}
		#progressingPostItems {margin-top:10px;margin-bottom:10px;}
		.postItem{ clear:both;height:60px;margin-top:5px;margin-bottom:5px; }
	</style>
	
	<script language="javascript">
	
	jQuery(document).ready(function() {

		getMoreUsers();
		
	});
	
	function getMoreUsers()
	{
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getMoreUsers.do",
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType:"application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {
					
					console.log( JSON.stringify( data ) );

					displayNewUsers( data );
					
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
	}
	
	function displayNewUsers( data )
	{
		var source   = $('#userT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data);
		$('#newUsers').html(html);
	}
	
	
	</script>
</head>
<body>

<div id="wrapper">

	<div>
		
		<div id="newUsers" style="margin-top:10px;">
		</div>
		
		<script id="userT" type="text/x-handlebars-template">
		<table style="width:100%">
		<col width="80">
  		<col width="80">
		<col width="80">
		<col width="80">
		{{#each userList}}
			<tr>
				<td><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></td>
				<td>{{userName}}</td>
				<td>{{address}}</td>
				<td>{{createdDate}}</td>
			</tr>
		{{/each}}		

		</table>
		</script>
	</div>
	
</div>

</body>
</html>
