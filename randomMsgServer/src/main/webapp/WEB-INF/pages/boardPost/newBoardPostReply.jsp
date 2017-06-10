<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	String isApp = request.getParameter("isApp");
	String cafeID = request.getParameter("cafeID");
	String boardNo = Util.getString(request.getParameter("boardNo"));	
	String postNo = Util.getString(request.getParameter("postNo"));
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>게시글 작성</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/newBoardPost.css?v=4" />

<script language="javascript">
	
	var isApp = '<%= isApp %>';
	var cafeID = '<%= cafeID %>';
	var boardNo = '<%= boardNo %>';
	var postNo = '<%= postNo %>';
	
	jQuery(document).ready(function(){
		
	});

	function saveClick()
	{
		var desc = $('#desc').val();
		
		if ( desc == '' )
		{
			alert('내용을 입력해 주십시오.');
			return;
		}
		
		if ( confirm('설정을 저장하시겠습니까?') )
		{
			var param = {"postNo": postNo, "cafeID":cafeID, "boardNo":boardNo, "content": desc };
			
			ajaxRequest('POST', '/nearhere/boardPost/saveCafeBoardPostReplyAjax.do', param , onSaveResult );
		}
	}
	
	function onSaveResult( result )
	{
		if ( result == null )
		{
			alert('처리결과가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
			return;
		}
		else if ( result != null && result.resCode != '0000')
		{
			alert( result.resMsg );
		}
		else
		{
			alert('저장되었습니다.');
		}
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">댓글 쓰기</div>
		</div>
		
		<div id="container">
		
			<textarea id="desc" class="marginLR10 marginB20 marginT20" value="" rows="5"
			placeholder="내용을 입력해 주십시오."></textarea>
			
			
			<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
			
				<div class="wideBtn btnBG" onclick="saveClick();">저장</div>
				
			</div>
		
		</div>
					
	</div>
	
</body>
</html>