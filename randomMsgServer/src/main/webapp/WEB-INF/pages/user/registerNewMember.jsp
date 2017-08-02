<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>게시글 작성</title>


<!-- Include the jQuery library -->
<script type="text/javascript" src="<%=Constants.JS_PATH%>/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/common.js?v=2"></script>

<script type="text/javascript" src="<%=Constants.JS_PATH%>/modal_dialog.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a694766f82dd0fb809ccf02189747061&libraries=services"></script>

<link rel="stylesheet" type="text/css" href="<%=Constants.CSS_PATH%>/registerNewMember.css?v=2" />

<script language="javascript">


	
	var selectLocationModal = null;
	
	jQuery(document).ready(function(){


		
		// 모달창 인스턴트 생성
		selectLocationModal = new Example.Modal({
		    id: "modal" // 모달창 아이디 지정
		});
		
		Handlebars.registerHelper('if_eq', function(a, b, opts) {
		    if(a == b) // Or === depending on your needs
		        return opts.fn(this);
		    else
		        return opts.inverse(this);
		});
		
		if ( postNo != null && parseInt(postNo) > 0 )
		{
			getBoardPost();
		}
	});
	
	function goSelectLocation()
	{
		selectLocationModal.show();
		showLocationSelectDiv( locationResult );
	}

	var locationResult = null;
	function locationSelected( result )
	{
		if ( selectLocationModal != null )
			selectLocationModal.hide();
		
		if ( locationResult == null )
			locationResult = result;
		else
		{
			result.locationNo = locationResult.locationNo;
			locationResult = result;
		}
		
		setAddress();
	}


	function registerMember()
	{
		var title = $('#title').val();
		var desc = $('#desc').val();
		var maxNo = $('#maxNo').val();
		
		if ( title == '' )
		{
			notice('제목을 입력해 주십시오.');
			return;
		}
		
		if ( confirm('설정을 저장하시겠습니까?') )
		{


			ajaxRequest('POST', '/nearhere/boardPost/saveCafeBoardPostAjax.do', param , onSaveResult );
		}
	}
	
	function onSaveResult( result )
	{
		if ( result == null )
		{
			notice('처리결과가 올바르지 않습니다.\r\n다시 시도해 주시기 바랍니다.');
			return;
		}
		else if ( result != null && result.resCode != '0000')
		{
			notice( result.resMsg );
		}
		else
		{
			alert('저장되었습니다.');
			
			if ( isApp == 'Y' )
			{
				finish();	
			}
		}
	}
	
	function finish()
	{
		var broadcastList = [];
		broadcastList[0] = {"broadcastName":"BROADCAST_REFRESH_PAGE", "broadcastParam":"<%= Constants.PAGE_ID_BOARD_HOME %>"};
		broadcastList[1] = {"broadcastName":"BROADCAST_REFRESH_PAGE", "broadcastParam":"<%= Constants.PAGE_ID_CAFE_HOME %>"};
		broadcastList[2] = {"broadcastName":"BROADCAST_REFRESH_PAGE", "broadcastParam":"<%= Constants.PAGE_ID_BOARD_POST_DETAIL %>"};
		
		var param = {"broadcastList": broadcastList };
		
		if ( Android && Android != null && typeof Android != 'undefined')
		{
			return Android.finishActivity2( JSON.stringify( param ) );
		}
		
		return '';
	}
	
	function uploadImage()
	{
		if ( isApp == 'Y' )
		{
			var param = {"imageName":"카페 게시판 이미지", "cafeID":boardNo };
			selectPhotoUpload( param );	
		}	
	}
	
	function onImageUploaded( result )
	{
		try
		{
			if ( result == null || result.data == null )
			{
				notice('처리도중 오류가 발생했습니다.');
				return;
			}
			
			if ( result.resCode != '0000' )
			{
				notice( result.resMsg );
				return;
			}
			else
			{
				$('#imageListDiv #emptyDiv').hide();
				
				/*
				var imageUL = $('#imageListDiv ul');
				imageUL.append('<li><img class="thumbnail" imageNo="' + result.data.imageNo + '" src="' + result.data.url1 + '"></li>');
				*/
				
				
				var source = $('#boardImageT').html();
				var template = Handlebars.compile(source);
				var html = template(result.data);
				if ( $('#imageListDiv ul').length < 1 )
					$('#imageListDiv').append('<ul></ul>');
				
				$('#imageListDiv ul').append(html);
			}
		}
		catch( ex )
		{
			alert( ex.message );
		}
	}
	
	function deleteImage( elem, imageNo )
	{
		if ( confirm('정말 삭제하시겠습니까?') )
		{
			$(elem).closest('li').remove();
			if ( $('#imageListDiv ul li').length < 1 )
			{
				var source = $('#boardImageTList').html();
				var template = Handlebars.compile(source);
				var html = template({});
				$('#imageListDiv').html(html);
			}
		}
	}

</script>

	
</head>
<body>

	<div id="wrapper">

		<div class="titleDiv">
			<div class="title">회원가입</div>
			<div id="refresh" onclick="document.location.reload()">
				<img src="<%=Constants.IMAGE_PATH%>/refresh.png" width="24" height="24">
			</div>
		</div>
		
		<div id="container">
		
			<p class="subTitle paddingLR10 paddingTop10">아이디</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="userID" class="inputTxt" placeholder="아이디" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">비밀번호</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="password" id="password" class="inputTxt" placeholder="비밀번호" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">사용자 이름</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="userName" class="inputTxt" placeholder="사용자 이름(예, 홍길동)" value="" />
			</div>
			
			<div id="iconDiv">
				<img src = "" id="imgCafeIcon"/>
				<div id="emptyDiv" style="display:none;">사진이 없습니다.</div>
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">이메일(선택)</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="email" class="inputTxt" placeholder="이메일" value="" />
			</div>
			
			<p class="subTitle paddingLR10 paddingTop10 upperLine">휴대폰 번호(선택)</p>
			
			<div class="inputContainer marginLR10 marginB20">
				<input type="text" id="mobile" class="inputTxt" placeholder="휴대폰 번호" value="" />
			</div>
			
			<div class="marginLR10 paddingTop10" style="margin-bottom:50px;">
			
				<div class="wideBtn btnBG" onclick="registerMember();">회원가입하기</div>
				
			</div>
		    
		</div>
					
	</div>
	
</body>
</html>