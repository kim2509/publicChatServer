<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<script language="javascript">

	var boardNo = null;
	var startIndex = 0;
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	var pageNo = 1;
	var pageSize = 20;
	var totalItemCount = 0;
	
	function displayDateFormat( jsonDate )
	{
		var date = new Date(jsonDate);
		return date.format('MM-dd HH:mm');
	}
	
	jQuery(document).ready(function(){
		
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );
		
		$('#imageList #boardElement').change(function(){
			boardNo = $(this).val();
			pageNo = 1;
			startIndex = 0;
			
			getImagePostList();
		});
		
		getImagePostList();
		
	});
	
	function getImagePostList()
	{
		var param = {"cafeID":cafeID, "userID": userID, "boardNo":boardNo, "startIndex" : startIndex, "showCount" : pageSize };
		ajaxRequest('POST', '/nearhere/cafe/getCafeBoardImagePostListAjax.do', param , onPostImageListResult );
	}
	
	function onPostImageListResult( result)
	{
		try
		{
			if ( result == null || result.data == null || result.data.length < 1 )
			{
				return;
			}
			
			var boardList = result.data.boardList;
			
			if ( boardNo == null )
			{
				for ( var i = 0; i < boardList.length; i++ )
				{
					if ( i == 0 )
					{
						$('#imageList #boardElement').empty();
						$('#imageList #boardElement').append('<option value="">전체 게시판</option>');
					}
					
					$('#imageList #boardElement').append($('<option>', {
					    value: boardList[i].boardNo,
					    text: boardList[i].boardName
					}));
				}
			}
			
			$('#imagePostCount').html( result.data.totalCount );
			totalItemCount = result.data.totalCount;
			
			var source = $('#imagePostT').html();
			var template = Handlebars.compile(source);
			var html = template(result.data);

			$('#imageList #bodyDiv').html(html);
			
			displayPagingInfo();
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function displayPagingInfo()
	{
		$('#pagingInfo').empty();
		
		if ( pageNo <= numOfPagesOnScreen )
			firstPage = 1;
		else
		{
			firstPage = parseInt(pageNo / numOfPagesOnScreen) * numOfPagesOnScreen;
			if ( pageNo % numOfPagesOnScreen == 0 )
				firstPage = firstPage - numOfPagesOnScreen + 1;
			else
				firstPage++;
		}
		
		lastPage = parseInt( totalItemCount / pageSize );
		if ( (parseInt(totalItemCount) % parseInt(pageSize)) > 0)
			lastPage++;
		
		if ( firstPage > numOfPagesOnScreen + 1)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(1);">&lt;&lt;</a>');
		
		if ( firstPage != 1 )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage - 1) + ');">&lt;</a>');
		
		for ( var i = 0; i < numOfPagesOnScreen; i++ )
		{
			if ( firstPage + i == pageNo)
			{
				$('#pagingInfo').append('<b><a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" class="pageSelected">' + (firstPage + i) + '</a></b>');
			}
			else
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" >' + (firstPage + i) + '</a>');
			}
		
			if ( (firstPage + i) == lastPage )
				break;
		}
		
		if ( lastPage > firstPage + numOfPagesOnScreen )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + numOfPagesOnScreen) + ');" >&gt;</a>');
		
		if ( firstPage + numOfPagesOnScreen < lastPage - numOfPagesOnScreen)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + lastPage + ');" >&gt;&gt;</a>');
		
	}
	
	function goPage(num)
	{
		pageNo = num;
		startIndex = (pageNo - 1) * pageSize;
		getImagePostList();
	}
	
	function goPostDetail( boardName, postNo )
	{
		//document.location.href="/nearhere/cafe/boardPost/detail/" + postNo + "?boardName=" + encodeURIComponent(boardName);
		
		var url = '<%= Constants.getServerURL() + "/cafe/boardPost/detail/" %>' + 
			postNo + "?boardName=" + encodeURIComponent(boardName);
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
</script>
<script id="imagePostT" type="text/x-handlebars-template">
	<ul>
		{{#each postList}}
		<li onclick="goPostDetail('{{boardName}}','{{postNo}}')">
			<img src="{{imageURL}}" />
			<div id="postInfo">
				<p>{{title}}</p>
				<span>{{userName}} | {{displayDateFormat createdDate}}</span>
			</div>
		</li>
		{{/each}}
	</ul>
</script>

<div id="imageList">
	<div id="headerDiv">
		<div id="countInfo">전체 <span id="imagePostCount">30</span>개의 이미지</div>
		<select name="boardElement" id="boardElement">
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
			<b><a href="javascript:void(0)" onclick="goPage(1);" class="pageSelected">1</a></b>
			<a href="javascript:void(0)" onclick="goPage(2);">2</a>
			<a href="javascript:void(0)" onclick="goPage(3);">3</a>
			<a href="javascript:void(0)" onclick="goPage(4);">4</a>
			<a href="javascript:void(0)" onclick="goPage(5);">5</a>
			<a href="javascript:void(0)" onclick="goPage(6);">&gt;</a>
			<a href="javascript:void(0)" onclick="goPage(171);">&gt;&gt;</a>
		</div>
	</div>
</div>

