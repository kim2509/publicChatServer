<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript">

	jQuery(document).ready(function(){
		
		ajaxRequest('POST', '/nearhere/boardPost/getRecentCafeBoardPostListAjax.do', null , recentCafePostsResult );
		
	});
	
	function recentCafePostsResult( result )
	{
		if ( result != null && result.data != null && result.data.boardPostList != null && result.data.boardPostList.length > 0 )
		{
			$('#recentPostListDiv').show();
			var source = null;
			source = $('#cafePostT').html();	
			var template = Handlebars.compile(source);
			var html = template(result.data);
			$('#recentPostListDiv .content').html(html);	
		}
	}
	
</script>
<script id="cafePostT" type="text/x-handlebars-template">
	<ul class="cafeBoardPostUL">
		{{#each boardPostList}}
		<li onclick="goPostDetail('{{postNo}}');">
			<div>
				<div class="postImage">
					<img src='{{imageURL}}'
					width="60" height="60"
					onerror="this.onerror=null;this.src='<%= Constants.IMAGE_PATH + "/" + Constants.POST_DEFAULT_ICON %>';">
				</div>
				<div class="postInfo">
					<div class="postTitle">{{title}}</div>
					<div class="createdDate">{{displayDateFormat createdDate 'MM-dd HH:mm'}}</div>
					<div class="cafeName">{{cafeName}}</div>
				</div>
			</div>
		</li>
		{{/each}}
	</ul>
</script>

<div id="recentPostListDiv" style="display:none;background:white;border-radius:10px;border:1px solid gray;padding:10px;margin-bottom:10px;">
	<div class="subTitle">
	최근 카페 글
	</div>
	
	<div class="content">
	</div>
</div>