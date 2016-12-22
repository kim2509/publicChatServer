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
				<img src="https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/115647760_Untitled-7.jpg?type=f270_166" />
				<div id="postInfo">
					<p>초아초아초아 너무 좋아용~ 초~아 초아초아 어서오세용~</p>
					<span>오소리용 | 1분전</span>
				</div>
			</li>
			<li>
				<img src="https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/114239430_Untitled-6.jpg?type=f270_166" />
				<div id="postInfo">
					<p>이시영 하사관!!</p>
					<span>오소리용 | 1분전</span>
				</div>
			</li>
			<li>
				<img src="https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/103230622_249.jpg?type=f270_166" />
				<div id="postInfo">
					<p>초아초아초아 너무 좋아용~ 초~아 초아초아 어서오세용~</p>
					<span>오소리용 | 1분전</span>
				</div>
			</li>
			<li>
				<img src="https://s.pstatic.net/mimgnews/image/upload/item/2016/12/21/113801236_%25C0%25CC%25B5%25BF%25BF%25ED3.jpg?type=nf288_220" />
				<div id="postInfo">
					<p>초아초아초아 너무 좋아용~ 초~아 초아초아 어서오세용~</p>
					<span>오소리용 | 1분전</span>
				</div>
			</li>
		</ul>
		
	</div>
	<div id="footerDiv">
		<div id="pagingInfo" style="text-align:center;margin-top:10px;font-weight:bold;">
			<b><a href="javascript:void(0)" onclick="goPage(1);" style="padding:5px;" class="pageSelected">1</a></b>
			<a href="javascript:void(0)" onclick="goPage(2);" style="padding:5px;">2</a>
			<a href="javascript:void(0)" onclick="goPage(3);" style="padding:5px;">3</a>
			<a href="javascript:void(0)" onclick="goPage(4);" style="padding:5px;">4</a>
			<a href="javascript:void(0)" onclick="goPage(5);" style="padding:5px;">5</a>
			<a href="javascript:void(0)" onclick="goPage(6);" style="padding:5px;">&gt;</a>
			<a href="javascript:void(0)" onclick="goPage(171);" style="padding:5px;">&gt;&gt;</a>
		</div>
	</div>
</div>

