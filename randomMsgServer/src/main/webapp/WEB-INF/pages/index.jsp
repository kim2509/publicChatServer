<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/handlebars-v3.0.3.js"></script>
	
	<style type="text/css">
		table, td{margin:0px;}
		#wrapper{margin-top:15px;padding:0px;padding-bottom:20px;}
		.region tr{height:40px;}
		.region td{padding-left:5px;padding-right:5px;text-align:center;font-size:14px;}
		.countItem { clear:both;margin-top:10px; }
		#divCountPerResion {margin-top:10px}
		#progressingPostItems {margin-top:10px;margin-bottom:10px;}
		.postItem{ clear:both;height:60px;margin-top:5px;margin-bottom:5px; }
	</style>
	
	<script language="javascript">
	
	jQuery(document).ready(function() {

		Handlebars.registerHelper('printCount', function(text) {
			if ( text == '' || text == null ) return 0;
			return text;
		});
		
		getCountInfo('user27');
	});
	
	function getCountInfo( userID )
	{
		userID='user27';
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getMainInfo.do",
			data : JSON.stringify( {"userID":userID} ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType:"application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {
					
					console.log( JSON.stringify( data ) );

					displayPosts( data );
					
					displayCountInfo( data );
					
					displayNewUsers( data );
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	
	function displayPosts( data )
	{
		var source   = $('#postT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data2);
		$('#progressingPostItems').html(html);

		source   = $('#myPostT').html();
		template = Handlebars.compile(source);
		html = template(data.data2);
		$('#myPostItems').html(html);
		
		source   = $('#within1WeekPostT').html();
		template = Handlebars.compile(source);
		html = template(data.data2);
		$('#postsWithin1Week').html(html);
	}
	
	function displayCountInfo( data )
	{
		var countPerRegion = {};
		// 지역별 count 가 담긴 list array 를 hash map 으로 치환
		for (var i = 0; i < data.data.length; i++) {
			var countInfo = data.data[i]["countInfo"];
			var count = data.data[i]["count"];
			countPerRegion[countInfo] = count; 
		}
		
		var source   = $('#regionT').html();
		var template = Handlebars.compile(source);
		var html = template(countPerRegion);
		$('#divCountPerResion').html(html);
		
		$('#curItems').html( countPerRegion['현재진행중'] + '건' );
		$('#myItems').html( countPerRegion['내합승내역'] + '건' );
		$('#recentItems').html( countPerRegion['1주일'] + '건' );
	}
	
	function displayNewUsers( data )
	{
		var source   = $('#userT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data2);
		$('#newUsers').html(html);
		
		$('#newUserCount').html('(' + data.data2.newUserCount + ')');
	}
	
	function updateCurrentLocation( location )
	{
		$('#curLocation').html( location );
	}
	
	</script>
</head>
<body>

<div id="wrapper">

	<div>
		<div class="countItem">
			<span>현재 위치</span>
			<span id="curLocation"></span>
			<span style="float:right;font-size:12px;">
				<a href="javascript:void(0)" onclick="refreshLocation();" style="text-decoration: none">새로고침</a>
			</span>
		</div>
		<div class="countItem">
			<span>현재 진행중인 합승내역</span>
			<span style="float:right" id='curItems'></span>
			<div id="progressingPostItems">
			</div>
		</div>
		
		<script id="postT" type="text/x-handlebars-template">
		{{#each progressingPosts}}
			<div class='postItem'>
				<div style='float:left;width:20%;'><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></div>
				<div style='float:left;width:70%;'>{{message}}</div>
			</div>
		{{/each}}		
		</script>
		
		<div class="countItem">이근처 합승내역</div>
		<div class="countItem">
			<span>내가 등록한 합승내역</span>
			<span style="float:right" id='myItems'></span>
			<div id="myPostItems">
			</div>
		</div>
		<script id="myPostT" type="text/x-handlebars-template">
		{{#each myPosts}}
			<div class='postItem'>
				<div style='float:left;width:20%;'><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></div>
				<div style='float:left;width:70%;'>{{message}}</div>
			</div>
		{{/each}}		
		</script>
		
		<div class="countItem">
			<span>최근 1주일내 합승내역</span>
			<span style="float:right" id='recentItems'></span>
			<div id="postsWithin1Week">
			</div>
		</div>
		<script id="within1WeekPostT" type="text/x-handlebars-template">
		{{#each postsWithin1Week}}
			<div class='postItem'>
				<div style='float:left;width:20%;'><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></div>
				<div style='float:left;width:70%;'>{{message}}</div>
			</div>
		{{/each}}		
		</script>
	</div>
	
	<div style="margin-top:20px;">
		<div>목적지별 합승내역조회</div>
		
		<div id="divCountPerResion">
			
		</div>
		
		<script id="regionT" type="text/x-handlebars-template">
			<table class="region">
				<tr>
					<td>강남구({{printCount 강남구}})</td><td>강북구({{printCount 강북구}})</td>
					<td>관악구({{printCount 관악구}})</td><td>광진구({{printCount 광진구}})</td>
				</tr>
				<tr>
					<td>구로구({{printCount 구로구}})</td><td>금천구({{printCount 금천구}})</td>
					<td>동작구({{printCount 동작구}})</td><td>마포구({{printCount 마포구}})</td>
				</tr>
				<tr>
					<td>송파구({{printCount 송파구}})</td><td>서초구({{printCount 서초구}})</td>
					<td>성동구({{printCount 성동구}})</td><td>성북구({{printCount 성북구}})</td>
				</tr>
				<tr>
					<td>양천구({{printCount 양천구}})</td><td>영등포구({{printCount 영등포구}})</td>
					<td>용산구({{printCount 용산구}})</td><td>종로구({{printCount 종로구}})</td>
				</tr>
				<tr>
					<td>중구({{printCount 중구}})</td><td> </td><td> </td><td> </td>
				</tr>
			</table>

			<table class="region">
				<tr>
					<td>경기도({{printCount 경기도}})</td><td>부산광역시({{부산광역시}})</td>
					<td>인천광역시({{printCount 인천광역시}})</td>
				</tr>
				<tr>
					<td>대전광역시({{printCount 대전광역시}})</td><td>대구광역시({{printCount 대구광역시}})</td>
					<td>광주광역시({{printCount 광주광역시}})</td>
				</tr>
				<tr>
					<td>강원도({{printCount 강원도}})</td><td>충청북도({{printCount 충청북도}})</td>
					<td>충청남도({{printCount 충청남도}})</td>
				</tr>
				<tr>
					<td>경상북도({{printCount 경상북도}})</td><td>경상남도({{printCount 경상남도}})</td>
					<td>전라북도({{printCount 전라북도}})</td>
				</tr>
				<tr>
					<td>전라남도({{printCount 전라남도}})</td><td>제주도({{printCount 제주도}})</td>
				</tr>
			</table>
		</script>

		<div style="margin-top:10px;">
			<div style="float:right">더보기<span id="newUserCount"></span></div>
			<span>최근에 가입한 회원</span>
			<div id="newUsers" style="margin-top:10px;">
			
			</div>
		</div>
		
		<script id="userT" type="text/x-handlebars-template">
		<table style="width:100%">
		<col width="80">
  		<col width="80">
		<col width="80">
		<col width="80">
		{{#each userList}}
			<tr>
				<td><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></td>
				<td>{{userName}}</td>
				<td>{{address}}</td>
				<td>{{createdDate}}</td>
			</tr>
		{{/each}}		

		</table>
		</script>
	</div>
	
</div>

</body>
</html>
