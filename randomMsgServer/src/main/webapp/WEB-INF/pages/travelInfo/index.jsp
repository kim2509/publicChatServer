<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	
	ArrayList<HashMap> provinces = (ArrayList<HashMap>) request.getAttribute("provinces");
	
	String selectedAreaCode = null;
	if ( request.getAttribute("selectedAreaCode") != null )
		selectedAreaCode = request.getAttribute("selectedAreaCode").toString();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<style type="text/css">

body{
	background: #eeeeee;
}


span{ padding:5px; }

.section{
	border-radius: 10px;
	border: 1px solid gray;
	background:white;
	padding:10px;
	margin-bottom:10px;
}

#menu_category {background:#fff;}
#menu_category .title {position:relative; height:33px; padding:0 12px 0 12px; background:#dee2e8; border-top:1px solid #bcc4cd; /*border-bottom:2px solid #0c1420;*/ display:box; box-orient:vertical;box-pack:center;display:-webkit-box;-webkit-box-orient:vertical;-webkit-box-pack:center;display:-moz-box;-moz-box-orient:vertical;-moz-box-pack:center; -webkit-box-sizing:border-box;-moz-box-sizing:border-box;-ms-box-sizing: border-box}
#menu_category .title .s_tit {display:block; font-weight:normal; font-size:0.81em; letter-spacing:-1px; color:#707b8b}


li{
	padding:3px;
	border-bottom: 1px solid #eeeeee;
}
a{
	text-decoration: none;color:black;
	line-height: 1.4em;
}

.hostURL{
    color: #ffffff;
    background: #5c5aa7;
    border: 1;
    border: 1px solid #7f9bea;
    border-radius: 10px;
    padding: 10px;
    margin: 10px;
}

dl, dd{
	margin:0px;
	padding:0px;
}

dl {
	border-bottom: 0px solid #ccc;
	background:#ffffff;
	border-radius: 10px;
}

.item{
	border-bottom: 1px solid #ccc;
	padding:10px;
	height:80px;
}

.tit{
	text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    display: block;
}

.thumbnail{
	float:left;
}

.thumbnail img{
	border-radius: 10px;
}

#pagingInfo a{
	border: 1px solid #ccc;
	margin: 2px;
	background:white;
}

.pageSelected{
	color:blue;
}

</style>

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		$('#provinceList').change(function(){
			if ( $(this).val() != '' )
				getCityList($(this).val());
		});
		
		<% if ( Util.isEmptyString(selectedAreaCode) ) { %>
		// 서울 선택
		$('#provinceList').val('1');
		
		<% } %>
		
		getCityList( $('#provinceList').val() );
		
		$('#cityList').change(function(){
			if ( $(this).val() != '' )
				searchTravelInfo();
		});
		
		$('input[name=contentTypeID]').click( function() {
			contentTypeID = $(this).val();
			searchTravelInfo();
		});
		
		Handlebars.registerHelper('getTypeName', getTypeName );
		Handlebars.registerHelper('numberWithCommas', numberWithCommas );
		Handlebars.registerHelper('displayThumnailYN', displayThumnailYN );
		Handlebars.registerHelper('putLeftYN', putLeftYN );
				
	});

	function getCityList( code )
	{
		var param = {"areaCode":code};
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/travelInfo/getCityList.do",
			data : JSON.stringify( param ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result == null || result.data == null )
					{
						return;
					}

					$('#cityList').empty();
					$('#cityList').append( '<option value="">선택하세요</option>' );
					
					for ( var i = 0; i < result.data.length ; i++ )
					{
						var optionElement = $('<option></option>');
						
						optionElement.val(result.data[i].code);
						optionElement.html(result.data[i].name);
						
						$('#cityList').append( optionElement );					
					}
					
					searchTravelInfo();
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생(getCityList)" + error );
			}
		});
	}
	
	var pageNo = 1;
	var pageSize = 20;
	var totalItemCount = 0;
	var contentTypeID = '';
	
	function searchTravelInfo()
	{
		var areaCode = $('#provinceList').val();
		var cityCode = $('#cityList').val();
		
		if ( areaCode == '' ) 
		{
			alert('지역을 선택하세요.');
			return;
		}
		
		var param = {"areaCode": areaCode, "cityCode" : cityCode , "pageNo": pageNo, "contentTypeID":contentTypeID };
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/travelInfo/getTravelInfo.do",
			data : JSON.stringify( param ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					if ( result == null || result.data == null )
					{
						return;
					}

					$('#travelInfoDiv').empty();

					var source = $('#itemT').html();
					var template = Handlebars.compile(source);
					var html = template(result.data);
					
					totalItemCount = result.data.totalCount;
					
					$('#travelInfoDiv').html( html );
					
					displayPagingInfo();
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생(getCityList)" + error );
			}
		});
	}
	
	function openDetailView( contentTypeID, contentID )
	{
		var url = '<%= Constants.getServerURL() + "/travelInfo/detail.do" %>' + '?contentTypeID=' + contentTypeID + '&contentID=' + contentID ;
		
		if ( isApp == 'Y' )
			document.location.href='nearhere://openURL?title=' + encodeURIComponent('상세정보') + '&url=' + encodeURIComponent(url);
		else
			document.location.href = decodeURIComponent(url);
	}
	
	var firstPage = 0;
	var lastPage = 0;
	var numOfPagesOnScreen = 5;
	
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
		
		$('#info').html('전체 ' + numberWithCommas(totalItemCount) + '건');
		
		if ( firstPage > numOfPagesOnScreen + 1)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(1);" style="padding:5px;">처음</a>');
		
		if ( firstPage != 1 )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage - 1) + ');" style="padding:5px;">이전</a>');
		
		for ( var i = 0; i < numOfPagesOnScreen; i++ )
		{
			if ( firstPage + i == pageNo)
			{
				$('#pagingInfo').append('<b><a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" style="padding:5px;" class="pageSelected">' + (firstPage + i) + '</a></b>');
			}
			else
			{
				$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + i) + ');" style="padding:5px;">' + (firstPage + i) + '</a>');
			}
		
			if ( (firstPage + i) == lastPage )
				break;
		}
		
		if ( lastPage > firstPage + numOfPagesOnScreen )
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + (firstPage + numOfPagesOnScreen) + ');" style="padding:5px;">다음</a>');
		
		if ( firstPage + numOfPagesOnScreen < lastPage - numOfPagesOnScreen)
			$('#pagingInfo').append('<a href="javascript:void(0)" onclick="goPage(' + lastPage + ');" style="padding:5px;">마지막</a>');
		
	}
	function goPage(num)
	{
		pageNo = num;
		searchTravelInfo();
	}
	
	function getTypeName( typeID )
	{
		switch( parseInt(typeID) )
		{
			case 12 : return "관광지";
			break;
			case 14 : return "문화시설";
			break;
			case 15 : return "축제/행사";
			break;
			case 25 : return "여행코스";
			break;
			case 28 : return "레포츠";
			break;
			case 32 : return "숙박";
			break;
			case 38 : return "쇼핑";
			break;
			case 39 : return "음식";
			break;
			default : return "";
		}
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function displayThumnailYN( thumbnail ){
		if ( typeof thumbnail != 'undefined' && thumbnail != null && thumbnail.length > 0 )
			return '';
		else
			return 'style=display:none;';
	}
	
	function putLeftYN( thumbnail ){
		if ( typeof thumbnail != 'undefined' && thumbnail != null && thumbnail.length > 0 )
			return 'style=margin-left:100px;';
		else
			return '';
	}
	
	</script>
</head>
<body>

	<script id="itemT" type="text/x-handlebars-template">
	<dl class="slide_lst">
		{{#each items}}
		<dd onclick="openDetailView('{{contenttypeid}}','{{contentid}}');" class="item">
			<div class="thumbnail" {{displayThumnailYN firstimage2}}>
				<img src='{{firstimage2}}' width="80" height="80"/>
			</div>
			<div class='desc' {{putLeftYN firstimage2}}>
				<strong class="tit">{{title}}</strong>
				<div style="font-size:14px;margin-top:10px;">분류 : {{getTypeName contenttypeid}}</div>
				<div style="font-size:14px;margin-top:5px;font-weight:bold;">조회수 : {{numberWithCommas readcount}}</div>
			</div>
		</dd>
		{{/each}}
	</dl>
</script>

	<div id="wrapper" style="padding-bottom:10px;">
	
		<br/>
		지역
		<select name="provinceList" id="provinceList">
	
			<option value=''>선택하세요</option>
		<%	for ( int i = 0; i < provinces.size(); i++ ) {
				HashMap province = provinces.get(i);
				
				String selected = "";
				
				if ( !Util.isEmptyString(selectedAreaCode) && selectedAreaCode.equals(province.get("code")))
				{
					selected = "selected";	
				}
				
		%>
			<option value="<%= province.get("code") %>" <%= selected %>><%= province.get("name") %></option>
		<%	
			}
		%>
		</select>
		
		시군구
		<select id="cityList">
			<option>선택하세요</option>
		</select>
		<br/>
		
		<div style="margin-top:10px;margin-bottom:10px;">
		<div style="float:left;">분류</div> 
		
		<div style="margin-left:40px;">
			
			<input type="radio" name="contentTypeID" id="contentTypeAll" value="" checked="checked">
			<label for="contentTypeAll">전체</label>
			
			<input type="radio" name="contentTypeID" id="contentType12" value="12">
			<label for="contentType12">관광지</label>
			
			<input type="radio" name="contentTypeID" id="contentType14" value="14">
			<label for="contentType14">문화시설</label><br/>
			
			<input type="radio" name="contentTypeID" id="contentType15" value="15">
			<label for="contentType15">축제/행사</label>
			
			<input type="radio" name="contentTypeID" id="contentType25" value="25">
			<label for="contentType25">여행코스</label>
			
			<input type="radio" name="contentTypeID" id="contentType28" value="28">
			<label for="contentType28">레포츠</label><br/>
			
			<input type="radio" name="contentTypeID" id="contentType32" value="32">
			<label for="contentType32">숙박</label>
			
			<input type="radio" name="contentTypeID" id="contentType38" value="38">
			<label for="contentType38">쇼핑</label>
			
			<input type="radio" name="contentTypeID" id="contentType39" value="39">
			<label for="contentType39">음식</label>
		</div>
		
		</div>
	
		<div id="info" style="margin:10px;float:right;"></div>
	
		<div id="travelInfoDiv" style="margin-top:10px;clear:both;">
			
		</div>
	
		<div id="pagingInfo" style="text-align:center;margin-top:10px;font-weight:bold;">
			
			
		</div>
		
		<div id="footer" style="margin-top:40px;text-align:right;">
		출처 : 공공데이터 포털
		</div>
	</div>

	
	
</body>
</html>