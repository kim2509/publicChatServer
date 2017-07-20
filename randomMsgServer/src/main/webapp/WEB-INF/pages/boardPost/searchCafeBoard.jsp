<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	String cafeID = request.getParameter("cafeID");
	String boardNo = request.getParameter("boardNo");
	List<HashMap> cities = (List<HashMap>) request.getAttribute("cities");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>카페 검색</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/searchCafe.css?v=6" />

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<script language="javascript">

	var level = 0;
	var regionNo = '';
	var cafeID = '<%= cafeID %>';
	var boardNo = '<%= boardNo %>';

	jQuery(document).ready(function(){
		Handlebars.registerHelper('displayDateFormat', displayDateFormat );
		
		
		var param = {"cafeID":cafeID};
		ajaxRequest('POST', '/nearhere/cafe/getCafeBoardListAjax.do', param , onBoardListResult );
		
		
		$('#selRegionLevel1').change(function(){
			if ( $(this).val() != '' )
			{
				$('#selRegionLevel2').empty();
				$('#selRegionLevel2').append( '<option value="">선택하세요</option>' );
				$('#selRegionLevel3').empty();
				$('#selRegionLevel3').append( '<option value="">선택하세요</option>' );
				$('#selRegionLevel4').empty();
				$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
				
				getRegionList('selRegionLevel2', $(this).val());
				
				$('#searchRegionDiv .sigugun').show();
				
				level = 1;
				regionNo = $(this).val();
			}
			else
			{
				$('#searchRegionDiv .sigugun select').find('option:first').attr('selected', 'selected');
				$('#searchRegionDiv .dong select').find('option:first').attr('selected', 'selected');
				$('#searchRegionDiv .ri select').find('option:first').attr('selected', 'selected');
				$('#searchRegionDiv .sigugun').hide();
				$('#searchRegionDiv .dong').hide();
				$('#searchRegionDiv .ri').hide();
				
				level = 0;
			}
			
			searchKeyword();
		});
		
		$('#selRegionLevel2').change(function(){
			if ( $(this).val() != '' )
			{
				$('#selRegionLevel3').empty();
				$('#selRegionLevel3').append( '<option value="">선택하세요</option>' );
				$('#selRegionLevel4').empty();
				$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
				
				getRegionList('selRegionLevel3', $(this).val());
				
				$('#searchRegionDiv .dong').show();
				
				level = 2;
				regionNo = $(this).val();
			}
			else
			{
				$('#searchRegionDiv .dong select').find('option:first').attr('selected', 'selected');
				$('#searchRegionDiv .ri select').find('option:first').attr('selected', 'selected');
				$('#searchRegionDiv .dong').hide();
				$('#searchRegionDiv .ri').hide();
				
				level = 1;
			}
			
			searchKeyword();
		});
		
		$('#selRegionLevel3').change(function(){
			if ( $(this).val() != '' )
			{
				$('#selRegionLevel4').empty();
				$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
				
				getRegionList('selRegionLevel4', $(this).val());
				
				$('#searchRegionDiv .ri').show();
				
				level = 3;
				regionNo = $(this).val();
			}
			else
			{
				$('#searchRegionDiv .ri select').find('option:first').attr('selected', 'selected');
				$('#searchRegionDiv .ri').hide();
				
				level = 2;
			}
			
			searchKeyword();
		});
		
		$('#selRegionLevel4').change(function(){
			if ( $(this).val() != '' )
			{
				level = 4;
				regionNo = $(this).val();
			}
			else
			{
				level = 3;
			}
			
			searchKeyword();
		});
		
		$('#txtKeyword').focus();
	});
	
	function onBoardListResult( result)
	{
		try
		{
			var source = $('#boardT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#boardListDiv .th2').html(html);
			
			$('#selBoardList').change(function(){
				searchKeyword();
			});
			
			if ( boardNo != null && boardNo > 0 )
			{
				$('#selBoardList').val( boardNo );
			}
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function getRegionList( elementName, regionNo )
	{
		var param = {"regionNo":regionNo};
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/region/getRegionListByParentAjax.do",
			data : JSON.stringify( param ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result == null || result.data == null  )
					{
						return;
					}
					
					for ( var i = 0; i < result.data.length ; i++ )
					{
						var optionElement = $('<option></option>');
						
						optionElement.val(result.data[i].regionNo);
						optionElement.html(result.data[i].regionName);
						
						$('#' + elementName ).append( optionElement );					
					}
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				
			},
			error : function(xhr, status, error) {
				alert("에러발생(getRegionList)" + error );
			}
		});
	}
	
	var isApp = '<%= isApp %>';
	var startIndex = 0;
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	var pageNo = 1;
	var pageSize = 20;
	var totalItemCount = 0;
	
	var keyword = '';
	
	var searchMode = 1;
	
	function searchKeyword()
	{
		keyword = $('#txtKeyword').val();
		var boardNo = $('#selBoardList').val();
		
		var param = {"keyword": keyword, "level":level, "regionNo": regionNo, 
				"startIndex":startIndex, "showCount" : pageSize, "cafeID":cafeID, "boardNo":boardNo };
		
		ajaxRequest('POST', '/nearhere/cafe/searchCafePostsAjax.do', param , onResult );
	}
	
	function searchByCafeName()
	{
		searchMode = 1;
		searchKeyword();
		$('#searchResultTab #cafePostTab').removeClass('selected');
		$('#searchResultTab #cafeTab').addClass('selected');
	}
	
	function searchByCafePost()
	{
		searchMode = 2;
		searchKeyword();
		$('#searchResultTab #cafeTab').removeClass('selected');
		$('#searchResultTab #cafePostTab').addClass('selected');
	}
	
	function onResult( result )
	{
		$('#searchResultInfo #cntResult').html( result.data2 );
		
		var source = $('#cafePostT').html();
		
		var template = Handlebars.compile(source);
		var html = template(result);
		$('#searchResultDataDiv').html(html);
		
		totalItemCount = result.data2;
		
		if ( result.data != null && result.data.length > 0 )
		{
			$('#pagingInfo').show();
			$('#emptyDiv').hide();
		}
		else
		{
			$('#pagingInfo').hide();
			$('#emptyDiv').show();
		}
		
		displayPagingInfo();
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
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" class="pageSelected">' + (firstPage + i) + '</a>');
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
		
		if ( firstPage + numOfPagesOnScreen <= lastPage )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + lastPage + ');" >&gt;&gt;</a>');
		
	}
	
</script>
<script id="boardT" type="text/x-handlebars-template">
	{{#if data}}
	<select id='selBoardList'>
		<option value=''>선택하세요</option>
		{{#each data}}
		<option value='{{boardNo}}'>{{boardName}}</option>
		{{/each}}
	</select>
	{{else}}
		<select><option value=''>선택하세요</option></select>
	{{/if}}
</script>
<script id="cafePostT" type="text/x-handlebars-template">
	<ul>
		{{#each data}}
		<li onclick="goPostDetail('{{postNo}}');">
			<div>
				<div class="postImage">
					<img src='{{imageURL}}'
					width="60" height="60"/>
				</div>
				<div class="postInfo">
					<div class="postTitle">{{title}}</div>
					<div class="createdDate">{{displayDateFormat createdDate 'MM-dd HH:mm'}}</div>
					<div class="postDesc">{{content}}</div>
				</div>
			</div>
		</li>
		{{/each}}
	</ul>
</script>

<jsp:include page="../common/common.jsp" flush="true"></jsp:include>

</head>
<body>


	<div id="wrapper" style="">
		
		<div id="searchLayerDiv">
			<div id="searchBoxDiv">
				<div id="backDiv"><img src="<%=Constants.IMAGE_PATH%>/back.png" width="24" height="24"/></div>
				<div id="searchDiv" onclick="searchKeyword();"><img src="<%=Constants.IMAGE_PATH%>/search.png" width="24" height="24"/></div>
				<input type="text" class="searchInput" id="txtKeyword" placeholder="카페글 검색"/>
			</div>
			
			<div id="boardListDiv">
			
				<table style="width:100%;">
				<colgroup>
					<col width="120px;"></col>
					<col width="*"></col>
				</colgroup>
				<tr>
					<td class="th1">게시판</td>
					<td class="th2"></td>
				</tr>
				</table>
				
			</div>
			
			<div id="searchRegionDiv">
				<table style="width:100%;">
				<colgroup>
					<col width="120px;"></col>
					<col width="*"></col>
				</colgroup>
				<tr>
					<td class="th1">시/도</td>
					<td class="th2">
						<% for ( int i = 0; i < cities.size(); i++ ) { %>
							<% if ( i == 0 ) { %>
								<select name="selRegionLevel1" id="selRegionLevel1" style="width:100%;">
									<option value="">선택하세요.</option>
							<% } %>
							<option value="<%= cities.get(i).get("regionNo") %>"><%= cities.get(i).get("regionName") %></option>
							<% if ( i == cities.size() -1 ) { %>
								</select>
							<% } %>
						<% } %>
					</td>
				</tr>
				<tr class="sigugun">
					<td class="th1">시/구/군</td>
					<td class="th2">
						<select name="selRegionLevel2" id="selRegionLevel2" style="width:100%;">
							<option value="">선택하세요.</option>
						</select>
					</td>
				</tr>
				<tr class="dong">
					<td class="th1">동/읍/면</td>
					<td class="th2">
						<select name="selRegionLevel3" id="selRegionLevel3" style="width:100%;">
							<option value="">선택하세요.</option>
						</select>
					</td>
				</tr>
				<tr class="ri">
					<td class="th1">리</td>
					<td class="th2">
						<select name="selRegionLevel4" id="selRegionLevel4" style="width:100%;">
							<option value="">선택하세요.</option>
						</select>
					</td>
				</tr>
			</table>
			</div>
		</div>
		
		<div id="searchResultDiv">
			<div id="searchResultInfo">
				<span class="keyword">검색결과</span>
				<span id="cntResult"></span> 
			</div>
			<div id="searchResultDataDiv">
				
			</div>
			
			<div id="emptyDiv">검색결과가 존재하지 않습니다.</div>
		</div>
		
		<div id="pagingInfo" style="text-align:center;margin-top:10px;font-weight:bold;">
		</div>
		
	</div>

</body>
</html>