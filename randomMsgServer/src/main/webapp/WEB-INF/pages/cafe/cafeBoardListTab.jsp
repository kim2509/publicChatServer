<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<!-- div class="cafe_bnr" style="background-color:#ffffc3;clear:both;">
	<div style="display:inline-block;float:right;line-height:45px;height:45px;margin-top:12px;margin-right:10px;"><img src="<%= Constants.IMAGE_PATH %>/closeX.png" width="20" height="20" /></div>
	<a href="" class="link_bnr"><span class="ico_cafe ico_bnr">알림</span>게시판 새글 소식을 빨리 받고 싶다면!</a>
</div-->
	
<script language="javascript">

	jQuery(document).ready(function(){
		
		var param = {"cafeID":cafeID, "userID": userID };
		
		ajaxRequest('POST', '/nearhere/cafe/getCafeBoardListAjax.do', param , onResult );
		
	});
	
	function onResult( result)
	{
		try
		{
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
		var url = '<%= Constants.getServerURL() + "/boardPost/" %>' + boardNo + '?cafeID=' + cafeID;
		
		var titleUrlEncoded = encodeURIComponent( boardName );
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&pageID=<%= Constants.PAGE_ID_BOARD_HOME %>&title=' + titleUrlEncoded + '&url=' + url + '';
		else
			document.location.href= url;
	}
	
</script>
<script id="boardT" type="text/x-handlebars-template">
	{{#if data}}
	<ul>
		{{#each data}}
		<li>
			<a href="javascript:void(0)" onclick="goBoardHome('{{boardName}}', '{{boardNo}}');">{{boardName}}</a> 
		</li>
		{{/each}}
	</ul>
	{{else}}
		<div class="emptyDiv">생성된 게시판이 존재하지 않습니다.</div>
	{{/if}}
</script>
<div id="boardList">
</div>

