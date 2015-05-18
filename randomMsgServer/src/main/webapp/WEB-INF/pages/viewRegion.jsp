<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<%
	String regionName= request.getParameter("regionName");
	System.out.println( regionName );
%>
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

		getPostsInRegion('<%= regionName %>');
		
	});
	
	function getPostsInRegion( regionName )
	{
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getPostsInRegion.do",
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType:"application/json; charset=UTF-8",
			data : JSON.stringify({
				"regionName" : regionName
			}),
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {
					
					console.log( JSON.stringify( data ) );

					displayPosts( data );
					
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
	
	function displayPosts( data )
	{
		var source   = $('#postT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data);
		$('#postsInRegion').html(html);
	}
	
	
	</script>
</head>
<body>

<div id="wrapper">

	<div>
		
		<div id="postsInRegion" style="margin-top:10px;">
		</div>
		
		<script id="postT" type="text/x-handlebars-template">
		{{#each postsInRegion}}
			<div class='postItem'>
				<div style='float:left;width:20%;'><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></div>
				<div style='float:left;width:70%;'>{{message}}</div>
			</div>
		{{/each}}		
		</script>
	</div>
	
</div>

</body>
</html>
