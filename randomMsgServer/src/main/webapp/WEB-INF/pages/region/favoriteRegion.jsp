<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");

	ArrayList<HashMap> cities = (ArrayList<HashMap>) request.getAttribute("cities");
	String userID = request.getParameter("userID");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>

<!-- Include the jQuery library -->
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.SECURE_JS_PATH%>/handlebars-v3.0.3.js"></script>
	
<style type="text/css">
span {
	padding: 5px;
}

.section {
	border-radius: 10px;
	border: 1px solid gray;
	background: white;
	padding: 10px;
	margin-bottom: 10px;
}

#menu_category {
	background: #fff;
}

#menu_category .title {
	position: relative;
	height: 33px;
	padding: 0 12px 0 12px;
	background: #dee2e8;
	border-top: 1px solid #bcc4cd; /*border-bottom:2px solid #0c1420;*/
	display: box;
	box-orient: vertical;
	box-pack: center;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-box-pack: center;
	display: -moz-box;
	-moz-box-orient: vertical;
	-moz-box-pack: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box
}

#menu_category .title .s_tit {
	display: block;
	font-weight: normal;
	font-size: 0.81em;
	letter-spacing: -1px;
	color: #707b8b
}

ul{
	padding:0px;
}

li {
	padding: 3px;
	list-style:none;
}

a {
	text-decoration: none;
	color: #2e4986;
	line-height: 1.2em;
}
</style>

	<script language="javascript">
	
		jQuery(document).ready( function() {
			
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
				}
			});
			
			$('#selRegionLevel2').change(function(){
				if ( $(this).val() != '' )
				{
					$('#selRegionLevel3').empty();
					$('#selRegionLevel3').append( '<option value="">선택하세요</option>' );
					$('#selRegionLevel4').empty();
					$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
					
					getRegionList('selRegionLevel3', $(this).val());
				}
			});
			
			$('#selRegionLevel3').change(function(){
				if ( $(this).val() != '' )
				{
					$('#selRegionLevel4').empty();
					$('#selRegionLevel4').append( '<option value="">선택하세요</option>' );
					
					getRegionList('selRegionLevel4', $(this).val());
				}
			});
				
			getUserFavoriteRegionList();
		});
		
		function getRegionList( elementName, regionNo )
		{
			var param = {"regionNo":regionNo};
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/region/getRegionListByParent.do",
				data : JSON.stringify( param ),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( result == null || result.data == null || result.data.length == 0 )
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
		
		function getUserFavoriteRegionList()
		{
			var param = {"userID":"<%= userID %>"};
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/region/getUserFavoriteRegionList.do",
				data : JSON.stringify( param ),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( result == null || result.data == null || result.data.length == 0 )
						{
							$('#emptyDiv').show();
							return;
						}
						
						$('#emptyDiv').hide();
						displayUserFavoriteRegionList( result );
						
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
					
				},
				error : function(xhr, status, error) {
					alert("에러발생(getUserFavoriteRegionList)" + error );
				}
			});
		}
		
		function displayUserFavoriteRegionList( result )
		{
			var source = $('#regionInfoT').html();
			var template = Handlebars.compile(source);
			var html = template(result);
			$('#userFavoriteRegionDiv').html( html );
		}
		
		function deleteRegion( regionNo )
		{
			var param = {"userID":"<%= userID %>","regionNo": regionNo };
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/region/deleteUserFavoriteRegion.do",
				data : JSON.stringify( param ),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( result == null || result.data == null || result.data.length == 0 )
						{
							$('#emptyDiv').show();
							return;
						}
						
						$('#emptyDiv').hide();
						displayUserFavoriteRegionList( result );
						
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
					
				},
				error : function(xhr, status, error) {
					alert("에러발생(getUserFavoriteRegionList)" + error );
				}
			});
		}
		
		function getSelectedRegion()
		{
			if ( $('#selRegionLevel4').val().length > 0 )
				return $('#selRegionLevel4').val();
				
			if ( $('#selRegionLevel3').val().length > 0 )
				return $('#selRegionLevel3').val();
			if ( $('#selRegionLevel2').val().length > 0 )
				return $('#selRegionLevel2').val();
			if ( $('#selRegionLevel1').val().length > 0 )
				return $('#selRegionLevel1').val();
			
			return '';
		}
		
		function insertRegion()
		{
			var regionNo = getSelectedRegion();
			
			if ( regionNo == '' )
			{
				alert('관심지역을 선택해 주십시오.');
				return;
			}
			
			var param = {"userID":"<%= userID %>","regionNo": regionNo };
			
			jQuery.ajax({
				type : "POST",
				url : "/nearhere/region/insertUserFavoriteRegion.do",
				data : JSON.stringify( param ),
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
					// TODO
					try {

						if ( result == null || result.data == null || result.data.length == 0 )
						{
							$('#emptyDiv').show();
							return;
						}
						
						$('#emptyDiv').hide();
						displayUserFavoriteRegionList( result );
						
					} catch (ex) {
						alert(ex.message);
					}
				},
				complete : function(data) {
					// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					// TODO
					
				},
				error : function(xhr, status, error) {
					alert("에러발생(getUserFavoriteRegionList)" + error );
				}
			});
		}
		
	</script>
	
	<script id="regionInfoT" type="text/x-handlebars-template">
	<ul id="userFavoriteRegionList">
		{{#each data}}
			<li>
				<div style="float:right;"><input type="button" value="삭제" onclick="deleteRegion('{{regionNo}}');"/></div>
				<div>{{regionName}}</div>
			</li>
		{{/each}}
	</ul>
	</script>
</head>
<body>

	<div id="wrapper">

		<div class="section">
			
			<div id="menu_category">
				<div class="title">
					<span class="s_tit">관심지역 설정</span>
				</div>
			</div>
			
			<% for ( int i = 0; i < cities.size(); i++ ) { %>
				<% if ( i == 0 ) { %>
					<select name="selRegionLevel1" id="selRegionLevel1">
						<option value="">선택하세요.</option>
				<% } %>
				<option value="<%= cities.get(i).get("regionNo") %>"><%= cities.get(i).get("regionName") %></option>
				<% if ( i == cities.size() -1 ) { %>
					</select>
				<% } %>
			<% } %>
			
			<select name="selRegionLevel2" id="selRegionLevel2">
				<option value="">선택하세요.</option>
			</select>
			<select name="selRegionLevel3" id="selRegionLevel3">
				<option value="">선택하세요.</option>
			</select>
			<select name="selRegionLevel4" id="selRegionLevel4">
				<option value="">선택하세요.</option>
			</select>
					
			<input type="button" id="btnSave" value="추가" onclick="insertRegion();"/>
			
			
		</div>


		<div class="section">
			
			<div id="menu_category">
				<div class="title">
					<span class="s_tit">관심지역</span>
				</div>
			</div>
			
			<div id="userFavoriteRegionDiv">
			</div>
			
			<div id="emptyDiv" style="padding: 40px;text-align: center;font-weight:bold;display:none;">
			설정된 관심지역이 없습니다.
			</div>
			
			<div id="infoDiv" style="padding:10px;background: #b2dcf5;color: #195a73;border-radius: 10px;">
			관심지역을 추가하시면 해당지역의 카풀/합승 글이 등록될때 알림을 받으실 수 있습니다.
			</div>
		</div>

	</div>

</body>
</html>