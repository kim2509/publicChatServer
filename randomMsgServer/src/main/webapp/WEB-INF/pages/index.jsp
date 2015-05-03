<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nearhere.domain.*" %>
<%@ page import="com.dy.common.*" %>

<html>

<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<link rel="stylesheet" type="text/css" href="<%= Constants.CSS_PATH %>/common.css" />
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%= Constants.JS_PATH %>/mustache.js"></script>
	
	<style type="text/css">
		.countItem{height:30px;}
		.region tr{height:40px;}
		.region td{padding-left:5px;padding-right:5px;text-align:center;font-size:14px;}
		#divCountPerResion {margin-top:10px}
	</style>
	
	<script language="javascript">
	
	var countPerRegion = {
		data : {},
		print : function () {
			return function(val, render) {
				if ( val == null || val == '' ) val = '0';
				return "" + render(val);
			}
		}
	};

	jQuery(document).ready(function() {

		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getMainInfo.do",
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {
					
					// 지역별 count 가 담긴 list array 를 hash map 으로 치환
					for (var i = 0; i < data.data.length; i++) {
						var region = data.data[i]["region"];
						var count = data.data[i]["count"];
						countPerRegion.data[region] = count; 
					}
					
					var template = $('#regionT').html();
					Mustache.parse(template);   // optional, speeds up future uses
					var rendered = Mustache.render(template, countPerRegion );
					$('#divCountPerResion').html(rendered);
					
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

	});
	</script>
</head>
<body>

<div id="wrapper">

	<div>
		<div class="countItem">현재 위치</div>
		<div class="countItem">현재 진행중인 합승내역</div>
		<div class="countItem">이근처 합승내역</div>
		<div class="countItem">내가 등록한 합승내역</div>
		<div class="countItem">최근 1주일내 합승내역</div>
	</div>
	
	<div style="margin-top:20px;">
		<div>목적지별 합승내역조회</div>
		
		<div id="divCountPerResion">
			
		</div>
		
		<script id="regionT" type="x-tmpl-mustache">
			<table class="region">
				<tr>
					<td>강남구({{data.강남구}})</td><td>강북구({{data.강북구}})</td><td>관악구({{data.관악구}})</td><td>광진구({{data.광진구}})</td>
				</tr>
				<tr>
					<td>구로구({{data.구로구}})</td><td>금천구({{data.금천구}})</td><td>동작구({{data.동작구}})</td><td>마포구({{data.마포구}})</td>
				</tr>
				<tr>
					<td>송파구({{data.송파구}})</td><td>서초구({{data.서초구}})</td>
					<td>{{#print}}성동구({{data.성동구}}){{/print}}</td><td>{{#print}}성북구({{data.성북구}}){{/print}}</td>
				</tr>
				<tr>
					<td>양천구({{data.양천구}})</td><td>영등포구({{data.영등포구}})</td><td>용산구({{data.용산구}})</td><td>종로구({{data.종로구}})</td>
				</tr>
				<tr>
					<td>중구({{data.중구}})</td><td> </td><td> </td><td> </td>
				</tr>
			</table>

			<table class="region">
				<tr>
					<td>경기도({{data.경기도}})</td><td>부산광역시({{data.부산광역시}})</td>
				</tr>
				<tr>
					<td>인천광역시({{data.인천광역시}})</td><td>대전광역시({{#print}}{{data.대전광역시}}{{/print}})</td>
				</tr>
				<tr>
					<td>대구광역시({{data.대구광역시}})</td><td>광주광역시({{data.광주광역시}})</td>
				</tr>
				<tr>
					<td>강원도({{data.강원도}})</td><td>충청북도({{data.충청북도}})</td>
				</tr>
				<tr>
					<td>충청남도({{data.충청남도}})</td><td>경상북도({{data.경상북도}})</td>
				</tr>
				<tr>
					<td>경상남도({{data.경상남도}})</td><td>전라북도({{data.전라북도}})</td>
				</tr>
				<tr>
					<td>전라남도({{data.전라남도}})</td><td>제주도({{data.제주도}})</td>
				</tr>
			</table>
		</script>

	</div>
	
</div>

</body>
</html>
