<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/searchCafe.css?v=6" />

</head>
<body>


	<div id="wrapper" style="">
		
		<div id="searchLayerDiv">
			<div id="searchBoxDiv">
				<div id="backDiv"><img src="<%=Constants.IMAGE_PATH%>/back.png" width="24" height="24"/></div>
				<div id="searchDiv"><img src="<%=Constants.IMAGE_PATH%>/search.png" width="24" height="24"/></div>
				<input type="text" class="searchInput" placeholder="카페 검색"/>
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
						<select name="selRegionLevel1" id="selRegionLevel1" style="width:100%;">
							<option value="">선택하세요.</option>
						</select>
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
			<div id="searchResultTab">
				<div class="tab">
					<div class="selected">카페명</div>
				</div>
				<div class="tab">
					<div>카페글</div>
				</div>
			</div>
			<div id="searchResultInfo">
				<span class="keyword">'테니스'</span>
				<span>153</span> 
			</div>
			<div>
				<ul>
					<li>
						<div>
							<div class="cafeImage">
								<img src='http://mcafethumb2.phinf.naver.net/MjAxNzAxMTBfMjI4/MDAxNDg0MDM1MzAzNDIz.3Q3XlLPI27dw18F_OePn9dGU1Uhby2sFjnA4xarWWpIg.SKOVVtg4GpXRVaUVKOAT4udb-6Xgfxd4hUUY0Jf2Vaog.PNG.ccyoo/%C5%D7%B4%CF%BD%BA-%C8%A6%B8%AF-%B7%CE%B0%ED-3.png?type=f100_100'
								width="60" height="60"/>
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라</div>
								<div class="cafeDesc">포항에서 중고물품을 개인간에 교환/매매하기 위한 카페 모두모두모두 초아초아용~포항에서 중고물품을 개인간에 교환/매매하기 위한 카페 모두모두모두 초아초아용~</div>
								<div class="regionInfo">경북 포항시 남구 연일읍 택전리</div>
								<div class="memberInfo">멤버수 : 100명</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="cafeImage">
								<img src='http://mcafethumb2.phinf.naver.net/MjAxNzAxMTBfMjI4/MDAxNDg0MDM1MzAzNDIz.3Q3XlLPI27dw18F_OePn9dGU1Uhby2sFjnA4xarWWpIg.SKOVVtg4GpXRVaUVKOAT4udb-6Xgfxd4hUUY0Jf2Vaog.PNG.ccyoo/%C5%D7%B4%CF%BD%BA-%C8%A6%B8%AF-%B7%CE%B0%ED-3.png?type=f100_100'
								width="60" height="60"/>
							</div>
							<div class="cafeInfo">
								<div class="cafeTitle">중고나라</div>
								<div class="cafeDesc">포항에서 중고물품을 개인간에 교환/매매하기 위한 카페 모두모두모두 초아초아용~포항에서 중고물품을 개인간에 교환/매매하기 위한 카페 모두모두모두 초아초아용~</div>
								<div class="regionInfo">경북 포항시 남구 연일읍 택전리</div>
								<div class="memberInfo">멤버수 : 100명</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="postImage">
								<img src='http://mcafethumb2.phinf.naver.net/MjAxNzAxMTBfMjI4/MDAxNDg0MDM1MzAzNDIz.3Q3XlLPI27dw18F_OePn9dGU1Uhby2sFjnA4xarWWpIg.SKOVVtg4GpXRVaUVKOAT4udb-6Xgfxd4hUUY0Jf2Vaog.PNG.ccyoo/%C5%D7%B4%CF%BD%BA-%C8%A6%B8%AF-%B7%CE%B0%ED-3.png?type=f100_100'
								width="60" height="60"/>
							</div>
							<div class="postInfo">
								<div class="postTitle">테니스 라켓 팝니다.</div>
								<div class="createdDate">2017.01.14 13:59</div>
								<div class="postDesc">포항에서 중고물품을 개인간에 교환/매매하기 위한 카페 모두모두모두 초아초아용~포항에서 중고물품을 개인간에 교환/매매하기 위한 카페 모두모두모두 초아초아용~</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<div id="pagingInfo" style="text-align:center;margin-top:10px;font-weight:bold;">
		</div>
		
	</div>

</body>
</html>