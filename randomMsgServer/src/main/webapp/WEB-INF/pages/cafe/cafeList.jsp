<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
			
			ajaxRequest('POST', '/nearhere/cafe/getPopularCafeListAjax.do', null , onPopularCafeListReceived );
		}
			
		$('#cafeTab li').removeClass('selected');
		$('#cafeTab li').eq(tabIndex).addClass('selected');
	}
	
	function goMoreCafeList()
	{
		var titleUrlEncoded = encodeURIComponent('카페 리스트');
		var url = '<%= Constants.getServerURL() %>/cafe/moreCafeList.do';
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?titleBarHidden=Y&title=' + titleUrlEncoded + '&url=' + encodeURIComponent(url) + '';
		else
			document.location.href= url;
	}
	
	function onPopularCafeListReceived( result )
	{
		console.log(JSON.stringify(result));
		
		if ( result != null && result.data != null && result.data.length > 0 )
		{
			var source = $('#cafeT').html();
			var template = Handlebars.compile(source);
			var html = template(result);

			$('#popularCafeList').html(html);
		}
	}
	
</script>
<script id="cafeT" type="text/x-handlebars-template">
	{{#if data}}
	<ul class="cafeListUL">
		{{#each data}}
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
		{{/each}}
	</ul>
	{{else}}
		<div class="empty">카페가 존재하지 않습니다.</div>
	{{/if}}
</script>

<div id="section">

	<ul id="cafeTab" class="tab3">
		<li onclick="cafeTabSelected(0);" class="selected">내 카페</li>
		<li onclick="cafeTabSelected(1);">관심지역 카페</li>
		<li onclick="cafeTabSelected(2);">인기 카페</li>
	</ul>

	<div id="cafeList">
	
		<div id="myCafeList" style="display:none;">
			<ul class="cafeListUL" style="display:none">
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
			<div class="loading">목록을 읽어오는 중입니다.</div>
			<div class="empty">가입한 카페가 없습니다.</div>
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
			
			<div class="loading">목록을 읽어오는 중입니다.</div>
			<div class="empty">해당 지역에 카페가 존재하지 않습니다.</div>
			
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
			
			<div class="loading">목록을 읽어오는 중입니다.</div>
			
		</div>

		
		<div class="more" onclick="goMoreCafeList();" >더 보기 &gt;</div>
		
	</div>

</div>
