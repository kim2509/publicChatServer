<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<script language="javascript">

	jQuery(document).ready(function(){
		
		
	});
	
	function onResult( result)
	{
		try
		{
			if ( result == null || result.data == null || result.data.length < 1 )
			{
				return;
			}
			
			var source = $('#boardT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#boardList').html(html);
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function goBoardHome( boardName, boardNo )
	{
		var url = '<%= Constants.getServerURL() + "/cafe/board/" %>' + boardNo;
		
		var titleUrlEncoded = encodeURIComponent( boardName );
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href= url;
	}
	
</script>

<div id="imageList">
	<div id="headerDiv">
		<div id="countInfo">전체 30개의 이미지</div>
		<select name="borderNo" id="borderNo">
			<option value="1">전체 게시판</option>
			<option value="2">공지사항</option>
			<option value="3">공지사항</option>
		</select>
	</div>
	<div id="bodyDiv">
		
		<ul>
			<li>
				<img src="http://img1.daumcdn.net/thumb/W100x100/?fname=http://i1.daumcdn.net/cfile244/image/2218E3495859F9D80B3E84" />
			</li>
			<li>
				<img src="http://img1.daumcdn.net/thumb/W100x100/?fname=http://i1.daumcdn.net/cfile244/image/2218E3495859F9D80B3E84" />
			</li>
			<li>
				<img src="http://img1.daumcdn.net/thumb/W100x100/?fname=http://i1.daumcdn.net/cfile244/image/2218E3495859F9D80B3E84" />
			</li>
			<li>
				<img src="http://img1.daumcdn.net/thumb/W100x100/?fname=http://i1.daumcdn.net/cfile244/image/2218E3495859F9D80B3E84" />
			</li>
		</ul>
		
	</div>
	<div id="footerDiv">
		footer
	</div>
</div>

