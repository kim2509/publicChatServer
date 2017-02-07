<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String cafeID = "";
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

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage_board.css?v=1" />

<script language="javascript">

var isApp = '<%= isApp %>';

</script>

</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">게시판 관리</div>
		</div>
		
		<div id="container">
		
			<div id="newBoardDiv">
				
				<div class="header">게시판 등록/수정</div>
			
				<table style="width:100%;">
					<colgroup>
						<col width="120px;">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<td class="th1">게시판 이름</td>
						<td class="th2">
							<div class="inputContainer">
								<input type="text" class="inputTxt" placeholder="게시판 이름"/>
							</div>
						</td>
					</tr>
					<tr>
						<td class="th1">게시판 타입</td>
						<td class="th2">
							<select>
								<option>리스트</option>
								<option>이미지</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="th1">글쓰기 권한</td>
						<td class="th2">
							<select>
								<option>모두</option>
								<option>운영진 이상</option>
								<option>카페주인만</option>
							</select>
						</td>
					</tr>
					</tbody>
				</table>
				
				<div class="wideBtn btnBG">추가하기</div>
				
			</div>
			
			<div class="header">게시판 리스트</div>
			
			<div id="boardList">
				<ul>
					<li>
						<div style="clear:both;float:right">
							<input type="button" value="수정" />
							<input type="button" value="삭제" />
						</div>
						<div>공지사항</div>
					</li>
					<li>
						<div style="clear:both;float:right">
							<input type="button" value="수정" />
							<input type="button" value="삭제" />
						</div>
						<div>자유게시판</div>
					</li>
					<li>
						<div style="clear:both;float:right">
							<input type="button" value="수정" />
							<input type="button" value="삭제" />
						</div>
						<div>문의사항</div>
					</li>
				</ul>
			</div>
		
		</div>
					
	</div>
	
</body>
</html>