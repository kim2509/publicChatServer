<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>카페 리스트</title>

<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061"></script>
		
<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/cafe_common.css?v=1" />

<script language="javascript">

	function cafeTabSelected( tabIndex )
	{
		$('#myCafeList').hide();
		$('#favRegionCafeList').hide();
		$('#popularCafeList').hide();
		
		if ( tabIndex == 0 )
		{
			$('#myCafeList').show();
		}
		else if ( tabIndex == 1 )
		{
			$('#favRegionCafeList').show();
		}
		else if ( tabIndex == 2 )
		{
			$('#popularCafeList').show();
		}
			
	}

</script>

</head>
<body>
	
	<div id="wrapper">
	
		<div class="titleDiv">
			<div class="title">카페 리스트</div>
		</div>
		
		<ul id="cafeTab" class="tab3 margin10">
			<li onclick="cafeTabSelected(0);">내 카페</li>
			<li onclick="cafeTabSelected(1);">관심지역 카페</li>
			<li onclick="cafeTabSelected(2);">인기 카페</li>
		</ul>
		
		<div id="cafeList">
	
			<div id="myCafeList" style="display:none;">
				<ul class="cafeListUL">
					<li onclick="goCafeHome('junggonara');">
						<div>
							<div class="cafeImage">
								<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라2</div>
								<div class="cafeDesc">이근처의 사람들과 물품을 거래할 수 있는 카페입니다.
			옷, 가방, 휴대폰 등을 모두 거래할 수 있는 곳입니다.</div>
								<div class="regionInfo">인천광역시 남동구 남촌동 </div>
								<div class="memberInfo">멤버수 : 3명</div>
							</div>
						</div>
					</li>
					<li onclick="goCafeHome('junggonara');">
						<div>
							<div class="cafeImage">
								<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라2</div>
								<div class="cafeDesc">이근처의 사람들과 물품을 거래할 수 있는 카페입니다.
			옷, 가방, 휴대폰 등을 모두 거래할 수 있는 곳입니다.</div>
								<div class="regionInfo">인천광역시 남동구 남촌동 </div>
								<div class="memberInfo">멤버수 : 3명</div>
							</div>
						</div>
					</li>
					<li onclick="goCafeHome('junggonara');">
						<div>
							<div class="cafeImage">
								<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라2</div>
								<div class="cafeDesc">이근처의 사람들과 물품을 거래할 수 있는 카페입니다.
			옷, 가방, 휴대폰 등을 모두 거래할 수 있는 곳입니다.</div>
								<div class="regionInfo">인천광역시 남동구 남촌동 </div>
								<div class="memberInfo">멤버수 : 3명</div>
							</div>
						</div>
					</li>
				</ul>
				
				<div id="pagingInfo" style="text-align: center; margin-top: 10px; font-weight: bold; display: block;">
					<a href="javascript:void(0)" onclick="goPage(1);" class="pageSelected">1</a>
				</div>
				
			</div>
			
			<div id="favRegionCafeList" style="display:none;">
				<ul class="cafeListUL">
					<li onclick="goCafeHome('junggonara');">
						<div>
							<div class="cafeImage">
								<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라2</div>
								<div class="cafeDesc">이근처의 사람들과 물품을 거래할 수 있는 카페입니다.
			옷, 가방, 휴대폰 등을 모두 거래할 수 있는 곳입니다.</div>
								<div class="regionInfo">인천광역시 남동구 남촌동 </div>
								<div class="memberInfo">멤버수 : 3명</div>
							</div>
						</div>
					</li>
					<li onclick="goCafeHome('junggonara');">
						<div>
							<div class="cafeImage">
								<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라2</div>
								<div class="cafeDesc">이근처의 사람들과 물품을 거래할 수 있는 카페입니다.
			옷, 가방, 휴대폰 등을 모두 거래할 수 있는 곳입니다.</div>
								<div class="regionInfo">인천광역시 남동구 남촌동 </div>
								<div class="memberInfo">멤버수 : 3명</div>
							</div>
						</div>
					</li>
				</ul>
				
				<div id="pagingInfo" style="text-align: center; margin-top: 10px; font-weight: bold; display: block;">
					<a href="javascript:void(0)" onclick="goPage(1);" class="pageSelected">1</a>
				</div>
				
			</div>
			
			<div id="popularCafeList" style="display:none;">
				<ul class="cafeListUL">
					<li onclick="goCafeHome('junggonara');">
						<div>
							<div class="cafeImage">
								<img src="http://static.naver.net/m/cafe/mobile/img_thumb_20150618.png" width="60" height="60">
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라2</div>
								<div class="cafeDesc">이근처의 사람들과 물품을 거래할 수 있는 카페입니다.
			옷, 가방, 휴대폰 등을 모두 거래할 수 있는 곳입니다.</div>
								<div class="regionInfo">인천광역시 남동구 남촌동 </div>
								<div class="memberInfo">멤버수 : 3명</div>
							</div>
						</div>
					</li>
				</ul>
				
				<div id="pagingInfo" style="text-align: center; margin-top: 10px; font-weight: bold; display: block;">
					<a href="javascript:void(0)" onclick="goPage(1);" class="pageSelected">1</a>
				</div>
			</div>
			
		</div>
		
	</div>
	
</body>
</html>