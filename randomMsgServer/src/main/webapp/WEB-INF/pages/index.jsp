<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>

<html>

<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<style type="text/css">

dl {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

dd {
    display: block;
    position: relative;
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid #ccc;
    text-align: left;
}

a:link, a:hover, a:active {
    text-decoration: none;
}

.slide_lst {
}

.slide_lst .inp_box {
    padding-left:10px;
    padding-right:10px;
}

.slide_lst .inp_box .tit {
    color: #666;
}

.inp_box .arr {
    position: absolute;
    top: 50%;
    right: 10px;
    width: 7px;
    height: 11px;
    margin-top: -6px;
    background-position: -22px -31px;
    background-image: url(//pics.gmkt.kr/mobile/lpsrp/sp_mw_rtn.png);
    background-size: 200px auto;
}

table, td {
	margin: 0px;
}

#wrapper {
	margin-top: 15px;
	padding: 0px;
	padding-bottom: 20px;
}

.region tr {
	height: 40px;
}

.region td {
	padding-left: 5px;
	padding-right: 5px;
	text-align: center;
	font-size: 14px;
}

.countItem {
	clear: both;
	margin-top: 10px;
}

#divCountPerResion {
	margin-top: 10px
}

#progressingPostItems {
	margin-top: 10px;
	margin-bottom: 10px;
}

.postItem {
	clear: both;
	height: 60px;
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>

<script language="javascript">
	jQuery(document).ready(function() {

		Handlebars.registerHelper('printRegion', printRegion);

		getMainInfo('user27');
		Android.sendEvent('ready');
		Android.sendEvent('refreshLocation');
	});

	function getMainInfo(userID) {
		userID = 'user27';

		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getMainInfo.do",
			data : JSON.stringify({
				"userID" : userID
			}),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					console.log(JSON.stringify(data));

					displayPosts(data);

					displayCountInfo(data);

					displayNewUsers(data);

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

	function displayPosts(data) {
		var source = $('#postT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data2);
		$('#progressingPostItems').html(html);

		source = $('#myPostT').html();
		template = Handlebars.compile(source);
		html = template(data.data2);
		$('#myPostItems').html(html);

		source = $('#within1WeekPostT').html();
		template = Handlebars.compile(source);
		html = template(data.data2);
		$('#postsWithin1Week').html(html);
	}

	function displayCountInfo(data) {
		var countPerRegion = {};
		// 지역별 count 가 담긴 list array 를 hash map 으로 치환
		for (var i = 0; i < data.data.length; i++) {
			var countInfo = data.data[i]["countInfo"];
			var count = data.data[i]["count"];
			countPerRegion[countInfo] = count;
		}

		var source = $('#regionT').html();
		var template = Handlebars.compile(source);
		var html = template(countPerRegion);
		$('#divCountPerResion').html(html);

		$('#curItems').html(countPerRegion['현재진행중'] + '건');
		$('#myItems').html(countPerRegion['내합승내역'] + '건');
		$('#recentItems').html(countPerRegion['1주일'] + '건');
	}

	function displayNewUsers(data) {
		var source = $('#userT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data2);
		$('#newUsers').html(html);

		$('#newUserCount').html('(' + data.data2.newUserCount + ')');
	}

	function updateCurrentLocation(latitude, longitude, location) {
		$('#curLocation').html(location);

		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getPostsNearHereAjax.do",
			data : JSON.stringify({
				"fromLatitude" : latitude,
				"fromLongitude" : longitude,
				"distance" : "5"
			}),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					console.log(JSON.stringify(data));

					displayPostsNearHere(data);

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

	function displayPostsNearHere(data) {
		var source = $('#postNearHereT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data);
		$('#postsNearHere').html(html);
	}

	function refreshLocation() {
		Android.sendEvent('refreshLocation');
	}

	function viewMoreUsers() {
		Android.goURL('viewMoreUsers.do', 'slideInFromRight');
	}

	function printRegion(text, regionName) {
		if (text == '' || text == null)
			text = 0;

		if (regionName != null && regionName != '') {
			return new Handlebars.SafeString(
					"<a href='javascript:viewRegion(\"" + regionName + "\");'>"
							+ regionName + "</a>(" + text + ")");
		} else
			return text;
	}

	function viewRegion(regionName) {
		Android.goURL('viewRegion.do?regionName='
				+ encodeURIComponent(regionName), 'slideInFromRight');
	}
</script>
</head>
<body>

	<div id="wrapper">

		<div>

			<dl class="slide_lst">
				<dd>
					<a href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200002582"
						class="inp_box"> <strong class="tit">서울</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200002582"
						class="inp_box"> <strong class="tit">경기도</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200001676"
						class="inp_box"> <strong class="tit">부산광역시</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200000667"
						class="inp_box"> <strong class="tit">인천광역시</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200001628"
						class="inp_box"> <strong class="tit">대전광역시</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200000492"
						class="inp_box"> <strong class="tit">대구광역시</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200002239"
						class="inp_box"> <strong class="tit">광주광역시</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200000649"
						class="inp_box"> <strong class="tit">강원도</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200002583"
						class="inp_box"> <strong class="tit">충청도</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200000491"
						class="inp_box"> <strong class="tit">경상도</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200001627"
						class="inp_box"> <strong class="tit">전라도</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
				<dd>
					<a
						href="http://mobile.gmarket.co.kr/Category/List?lcId=100000046&amp;mcId=200000350"
						class="inp_box"> <strong class="tit">제주도</strong> <span
						class="sp_mw arr"></span>
					</a>
				</dd>
			</dl>


		</div>

		<div style="margin-top: 20px;">
			<div>목적지별 합승내역조회</div>

			<div id="divCountPerResion"></div>

			<script id="regionT" type="text/x-handlebars-template">
			<table class="region">
				<tr>
					<td>{{printRegion 강남구 "강남구"}}</td><td>{{printRegion 강북구 "강북구"}}</td>
					<td>{{printRegion 관악구 "관악구"}}</td><td>{{printRegion 광진구 "광진구"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 구로구 "구로구"}}</td><td>{{printRegion 금천구 "금천구"}}</td>
					<td>{{printRegion 동작구 "동작구"}}</td><td>{{printRegion 마포구 "마포구"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 송파구 "송파구"}}</td><td>{{printRegion 서초구 "서초구"}}</td>
					<td>{{printRegion 성동구 "성동구"}}</td><td>{{printRegion 성북구 "성북구"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 양천구 "양천구"}}</td><td>{{printRegion 영등포구 "영등포구"}}</td>
					<td>{{printRegion 용산구 "용산구"}}</td><td>{{printRegion 종로구 "종로구"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 중구 "중구"}}</td><td> </td><td> </td><td> </td>
				</tr>
			</table>

			<table class="region">
				<tr>
					<td>{{printRegion 경기도 "경기도"}}</td><td>{{printRegion 부산광역시 "부산광역시"}}</td>
					<td>{{printRegion 인천광역시 "인천광역시"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 대전광역시 "대전광역시"}}</td><td>{{printRegion 대구광역시 "대구광역시"}}</td>
					<td>{{printRegion 광주광역시 "광주광역시"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 강원도 "강원도"}}</td><td>{{printRegion 충청북도 "충청북도"}}</td>
					<td>{{printRegion 충청남도 "충청남도"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 경상북도 "경상북도"}}</td><td>{{printRegion 경상남도 "경상남도"}}</td>
					<td>{{printRegion 전라북도 "전라북도"}}</td>
				</tr>
				<tr>
					<td>{{printRegion 전라남도 "전라남도"}}</td><td>{{printRegion 제주도 "제주도"}}</td>
				</tr>
			</table>
		</script>

			<div style="margin-top: 10px;">
				<div style="float: right">
					<a href="javascript:viewMoreUsers();">더보기<span
						id="newUserCount"></span></a>
				</div>
				<span>최근에 가입한 회원</span>
				<div id="newUsers" style="margin-top: 10px;"></div>
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

		<div>
			<div class="countItem">
				<span>현재 위치</span> <span id="curLocation"></span> <span
					style="float: right; font-size: 12px;"> <a
					href="javascript:void(0)" onclick="refreshLocation();"
					style="text-decoration: none">새로고침</a>
				</span>
			</div>
			<div class="countItem">
				<span>현재 진행중인 합승내역</span> <span style="float: right" id='curItems'></span>
				<div id="progressingPostItems"></div>
			</div>

			<script id="postT" type="text/x-handlebars-template">
		{{#each progressingPosts}}
			<div class='postItem'>
				<div style='float:left;width:20%;'><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></div>
				<div style='float:left;width:70%;'>{{message}}</div>
			</div>
		{{/each}}		
		</script>

			<div class="countItem">
				<span>이근처 합승내역</span>
				<div id="postsNearHere"></div>
			</div>
			<script id="postNearHereT" type="text/x-handlebars-template">
		{{#each postsNearHere}}
			<div class='postItem'>
				<div style='float:left;width:20%;'><img width="60" height="60" src='http://tessoft.synology.me:8090/thumbnail/no_image.png'/></div>
				<div style='float:left;width:70%;'>{{message}}</div>
			</div>
		{{/each}}		
		</script>

			<div class="countItem">
				<span>내가 등록한 합승내역</span> <span style="float: right" id='myItems'></span>
				<div id="myPostItems"></div>
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
				<span>최근 1주일내 합승내역</span> <span style="float: right"
					id='recentItems'></span>
				<div id="postsWithin1Week"></div>
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
	</div>

</body>
</html>
