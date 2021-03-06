<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String cafeID = request.getParameter("cafeID");
	String isApp = request.getParameter("isApp");
	
	String cafeBoardListJSON = "";
	if ( request.getAttribute("cafeBoardListJSON") != null )
		cafeBoardListJSON = request.getAttribute("cafeBoardListJSON").toString();
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

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=4"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_manage_board.css?v=2" />

<script language="javascript">

	var isApp = '<%= isApp %>';
	var tmp = '<%= cafeBoardListJSON %>';
	var cafeBoardList = null ;
	var cafeID = '<%= cafeID %>';
	var modifyBoardNo = '';
	
	if ( tmp != null && tmp != '' )
	{
		cafeBoardList = JSON.parse( tmp );	
	}
	
	jQuery(document).ready(function(){

		try
		{
			var source = $('#boardT').html();
			var template = Handlebars.compile(source);
			var html = template(cafeBoardList);
			$('#boardList').html(html);
		}
		catch( ex )
		{
			alert(ex.message);
		}
		
	});
	
	function createBoard()
	{
		if ( $('#boardName').val() == '' || $('#boardName').val().length < 1 )
		{
			alert('추가할 게시판의 이름을 입력해 주십시오.');
			return;
		}
				
		if ( confirm( $('#boardName').val() + '게시판을 신규로 생성하시겠습니까?') )
		{
			var seq = $('#boardList li').length + 1;
			var param = {"cafeID":'<%= cafeID %>', "boardName": $('#boardName').val(), 
					"boardType": $('#boardType').val(), "readPermission": $('#readPermission').val()
					, "writePermission": $('#writePermission').val(), "seq": seq };
			ajaxRequest('POST', '/nearhere/cafe/createBoardAjax.do', param , onCreateBoardResult );
			
			reset();
		}
	}
	
	function onCreateBoardResult( result)
	{
		try
		{
			var source = $('#boardT').html();
			var template = Handlebars.compile(source);
			var html = template(result.data.boardList);
			$('#boardList').html(html);
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}

	function deleteBoard( boardNo )
	{
		if ( confirm('게시판 내의 모든 글들이 삭제됩니다.\r\n정말 삭제하시겠습니까?') )
		{
			var param = {"cafeID":"<%= cafeID %>", "boardNo": boardNo };
			ajaxRequest('POST', '/nearhere/cafe/deleteBoardAjax.do', param , onDeleteBoardResult );	
		}
	}
	
	function onDeleteBoardResult(result)
	{
		try
		{
			var source = $('#boardT').html();
			var template = Handlebars.compile(source);
			var html = template(result.data.boardList);
			$('#boardList').html(html);
			reset();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function modifyBoard( boardNo, boardName, boardType, readPermission, writePermission )
	{
		modifyBoardNo = boardNo;
		$('#boardName').val( boardName );
		$('#boardType').prop('selectedIndex', boardType );
		if ( readPermission == null || readPermission == '' )
			readPermission = '0';
		if ( writePermission == null || writePermission == '' )
			writePermission = '0';
		
		$('#readPermission').val(readPermission);
		$('#writePermission').val(writePermission);
		
		$('#btnCreate').hide();
		$('#btnModify').show();
		$('#btnReset').show();
	}
	
	function isNumberOnly( str )
	{
		if ( str.match(/[^0-9]/) != null ) {
		  return false;
		}
		
		return true;
	}
	
	function modifyBoardSubmit()
	{
		var param = {"cafeID":"<%= cafeID %>", "boardNo": modifyBoardNo , "boardName": $('#boardName').val(),
				"boardType": $('#boardType').val(), "readPermission": $('#readPermission').val()
				, "writePermission": $('#writePermission').val() };
		ajaxRequest('POST', '/nearhere/cafe/modifyBoardAjax.do', param , onModifyBoardResult );	
	}
	
	function onModifyBoardResult(result)
	{
		try
		{
			var source = $('#boardT').html();
			var template = Handlebars.compile(source);
			var html = template(result.data.boardList);
			$('#boardList').html(html);
			reset();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function reset()
	{
		modifyBoardNo = 0;
		$('#boardName').val('');
		$('#boardType').prop('selectedIndex', 0 );
		$('#readPermission').prop('selectedIndex', 0 );
		$('#writePermission').prop('selectedIndex', 0 );
		
		$('#btnCreate').show();
		$('#btnModify').hide();
		$('#btnReset').hide();
		$('#btnSaveOrder').hide();
	}
	
	function moveUp( element )
	{
		$('#btnSaveOrder').show();
		var liElement = $(element).closest('li');
		var before = $(liElement).prev();
		$(liElement).insertBefore(before);
	}
	
	function moveDown( element )
	{
		$('#btnSaveOrder').show();
		var liElement = $(element).closest('li');
		var after = $(liElement).next();
		$(liElement).insertAfter(after);
	}
	
	function saveBoardOrder()
	{
		if ( confirm('이대로 저장하시겠습니까?') )
		{
			var boardList = [];
			var count = 0;
			$('#boardList li').each(function(){
				var boardNo = $(this).attr('boardNo');
				boardList[count++] = boardNo;
			});
			
			var param = {"cafeID": cafeID, "boardList": boardList };
			ajaxRequest('POST', '/nearhere/cafe/changeBoardOrderAjax.do', param , onModifyBoardResult );	
		}
	}
</script>
<script id="boardT" type="text/x-handlebars-template">
	{{#if this}}	
	<ul>
		{{#each this}}
		<li boardNo='{{boardNo}}'>
			<div style="clear:both;float:right">
				<input type="button" value="∧" 
					onclick="moveUp( this );"/>
				<input type="button" value="∨" 
					onclick="moveDown( this );"/>
				<input type="button" value="수정" 
					onclick="modifyBoard('{{boardNo}}','{{boardName}}','{{boardType}}','{{readPermission}}','{{writePermission}}');"/>
				<input type="button" value="삭제" 
					onclick="deleteBoard('{{boardNo}}');" />
			</div>
			<div>{{boardName}}</div>
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="emptyDiv">생성된 게시판이 존재하지 않습니다.</div>
	{{/if}}
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
			
				<table style="width:100%;" class="boardFields">
					<colgroup>
						<col width="120px;">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<td class="th1">게시판 이름</td>
						<td class="th2">
							<div class="inputContainer">
								<input type="text" class="inputTxt" id="boardName" placeholder="게시판 이름"/>
							</div>
						</td>
					</tr>
					<tr>
						<td class="th1">게시판 타입</td>
						<td class="th2">
							<select id="boardType">
								<option value="0">리스트</option>
								<!-- option value="1">이미지</option-->
							</select>
						</td>
					</tr>
					<tr>
						<td class="th1">글읽기 권한</td>
						<td class="th2">
							<select id="readPermission">
								<option value="0">모두</option>
								<option value="3">카페회원 이상</option>
								<option value="1">운영진 이상</option>
								<option value="2">카페주인만</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="th1">글쓰기 권한</td>
						<td class="th2">
							<select id="writePermission">
								<option value="0">모두</option>
								<option value="3">카페회원 이상</option>
								<option value="1">운영진 이상</option>
								<option value="2">카페주인만</option>
							</select>
						</td>
					</tr>
					</tbody>
				</table>
				
				<div class="wideBtn btnBG" id="btnCreate" onclick="createBoard();">추가하기</div>
				<div class="wideBtn btnBG" id="btnModify" onclick="modifyBoardSubmit();" style="display:none;">수정하기</div>
				<div class="wideBtn redBG" id="btnReset" onclick="reset();" style="display:none;">초기화</div>
				
			</div>
			
			<div class="header">게시판 리스트</div>
			
			<div id="boardList">
				
			</div>
		
			<div class="wideBtn btnBG" id="btnSaveOrder" onclick="saveBoardOrder();" style="display:none">게시판 순서 저장</div>
			
		</div>
					
	</div>
	
</body>
</html>