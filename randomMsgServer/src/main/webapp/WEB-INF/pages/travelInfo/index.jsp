<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String isApp = request.getParameter("isApp");
	String userID = request.getParameter("userID");
	
	ArrayList<HashMap> provinces = (ArrayList<HashMap>) request.getAttribute("provinces");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.SECURE_JS_PATH%>/jquery-1.11.3.min.js"></script>

<style type="text/css">

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

</style>

	<script language="javascript">
	
	var isApp = '<%= isApp %>';
	
	jQuery(document).ready(function(){
		
		$('#provinceList').change(function(){
			getCityList($(this).val());
		});
		
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
					
					for ( var i = 0; i < result.data.length ; i++ )
					{
						var optionElement = $('<option></option>');
						
						optionElement.val(result.data[i].code);
						optionElement.html(result.data[i].name);
						
						$('#cityList').append( optionElement );					
					}
					
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
	
	function searchTravelInfo()
	{
		var areaCode = $('#provinceList').val();
		var cityCode = $('#cityList').val();
		
		alert( cityCode );
		var param = {"areaCode": areaCode, "cityCode" : cityCode };
		
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
					
					for ( var i = 0; i < result.data.length ; i++ )
					{
						var liElement = $('<li></li>');

						liElement.html('<img src=\"' + result.data[i].firstimage + '\" width="200" height="200"/>');
						
						$('#travelInfoDiv').append( liElement );					
					}
					
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
	
	</script>
</head>
<body>

	<div id="wrapper">
	
	<br/>
	지역
	<select name="provinceList" id="provinceList">

	<%	for ( int i = 0; i < provinces.size(); i++ ) {
			HashMap province = provinces.get(i);
	%>
		<option value="<%= province.get("code") %>"><%= province.get("name") %></option>
	<%	
		}
	%>
	</select>
	
	시군구
	<select id="cityList">
		<option>선택하세요</option>
	</select>
	
	<input type="button" value="조회" onclick="searchTravelInfo();" />
	
	<div>
	
		<ul id="travelInfoDiv">
		</ul>
	
	</div>
	
	</div>

	
	
</body>
</html>