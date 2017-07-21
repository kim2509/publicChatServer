<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nearhere.domain.*"%>
<%@ page import="com.dy.common.*"%>
<%@ page import="java.util.*"%>

<%
	String lRegionNo = request.getParameter("lRegionNo");
	String longitude = request.getParameter("longitude");
	String address = request.getParameter("address");
	String isApp = request.getParameter("isApp");
	String version = request.getParameter("appVersion");
	
	double appVersion = 0;
	if ( !Util.isEmptyString(version) )
		appVersion = Double.parseDouble(version);
	
	if ( isApp == null || !"Y".equals( isApp ) ) isApp = "N";
//	Constants.bReal = false;

	HashMap regionInfo = (HashMap) request.getAttribute("regionInfo");
	String isHotspot = regionInfo.get("isHotSpot") == null ? "" : regionInfo.get("isHotSpot").toString();
	
	String userInfoPage = Constants.getServerSSLURL() + "/user/userInfo.do";
	
	List<HashMap> childRegionList = null;
	if ( request.getAttribute("childRegionList") != null )
	{
		childRegionList = (List<HashMap>) request.getAttribute("childRegionList");
	}
	
	String listRegionLink = Constants.getServerURL() + "/taxi/listRegion.do?isApp=" + isApp + "&appVersion=" + version;
	String mRegionNo = request.getParameter("mRegionNo");
	String sRegionNo = request.getParameter("sRegionNo");
	String tRegionNo = request.getParameter("tRegionNo");
	String userID = request.getParameter("userID");
%>
<html>

<head>
<title>이근처</title>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />


<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/searchDestination.css?v=2" />
	
<style type="text/css">
	body{
		background:#eeeeee;
	}
	
	#regionList{
		margin:10px;
		background:#white;
		border: 1px solid gray;
		padding:10px;
		border-radius: 10px;
		overflow:auto;
	}
	
	#regionItem{
		float:left;
		display: list-item;
		width:32%;
		text-align: -webkit-match-parent;
		padding:2px;
	}
	
	#postList{
		clear:both;
		display:block;
		margin:10px;
		background:#white;
		border-radius: 10px;
		border: 1px solid gray;
		overflow:auto;
	}
	
	#title{
	    color: #4d4da0;
    	text-align: center;
	}
	
	.region{
		font-size:14px;
	}
	
	.favoriteRegion{
		border-radius: 10px;
		background:#ffffff;
		padding:10px;
		margin:10px;
		border: 1px solid gray;
		display:none;
	}
	
	.btn1{
		padding:3px;
		border-radius: 5px;
	}
	
	#infoDiv{
		padding: 5px;
	    background: #3572b0;
	    color: #ffffff;
	    border-radius: 10px;
	    font-weight: bold;
	    font-size: 14px;
	}
	
	#loadingDiv{
		padding-top:30px;
		padding-bottom:30px;
		background:white;
		border: 1px solid gray;
		border-radius: 10px;
		text-align:center;
		margin-left:10px;
		margin-right:10px;
		display:none;
	}
	
</style>

<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/jquery.lazyload.min.js"></script>
<script type="text/javascript"
	src="<%=Constants.JS_PATH%>/handlebars-v3.0.3.js"></script>

<script language="javascript">

	var isApp ='<%= isApp %>';
	var userID = '';
	
	jQuery(document).ready(function() {

		getPosts();
		
		userID = getUserID();
		
		if ( userID != null && userID != '' )
		{
			getFavoriteRegionInfo();
		}
		
	});

	function getUserID()
	{
		if ( typeof Android != 'undefined')
		{
			return Android.getUserID();
		}
		
		return '';
	}
	
	var pageNo = 1;
	var bLoading = false;
	var bEmpty = false;
	
	function getPosts()
	{
		if ( bLoading ) return;
		bLoading = true;
		
		//if ( pageNo == 1 )
			//$('#loading').show();
		
		$('#empty').hide();
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/taxi/getPostsNearHereAjax.do",
			data : JSON.stringify({
				"lRegionNo" : <%= lRegionNo %>,
				"mRegionNo" : <%= mRegionNo %>,
				"sRegionNo" : <%= sRegionNo %>,
				"tRegionNo" : <%= tRegionNo %>,
				"pageNo" : pageNo,
				"isHotSpot" : '<%= isHotspot %>'
			}),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					//$('#loading').hide();
					
					displayPosts( data );
					
					$("img.lazy").lazyload({
					    effect : "fadeIn"
					});

					$(window).resize();

					$(window).bind('scroll', function()
		            {
						if ( bEmpty == false )
						{
							if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
								// you're at the bottom of the page
								pageNo++;
								getPosts();
							}
						
						}
					});
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				bLoading = false;
			},
			error : function(xhr, status, error) {
				alert("에러발생");
				//$('#loading').hide();
			}
		});
	}
	
	function displayPosts(data) {
		
		if ( data == null || data.data.postsNearHere == null || data.data.postsNearHere.length < 1 )
		{
			if ( pageNo == 1 )
			{
				$('#empty').show();
				bEmpty = true;
				$('#postList').hide();
			}
			
			return;
		}
		
		var source = $('#postT').html();
		var template = Handlebars.compile(source);
		var html = template(data.data);

		if ( pageNo == 1 )
			$('#postList').html(html);
		else if ( pageNo > 0 )
			$('#postList dl').append($(html).find('dd'));
	}
	
	function goVIP(postID)
	{
		document.location.href='nearhere://viewPost?postID=' + postID;
	}
	
	function snsLogin()
	{
		document.location.href='nearhere://snsLogin';
	}
	
	function showOKDialog( title, message, param )
	{
		document.location.href='nearhere://showOKDialog?title=' + title + '&message=' + message + '&param=' + param;
	}
	
	function goNewPost()
	{
		var nextUrl = encodeURIComponent('<%= request.getRequestURL() + request.getQueryString() %>');
<%
		if ("Y".equals( isHotspot ) )
		{
%>
			document.location.href='<%= Constants.getServerURL() %>/taxi/newHotspot.do?isApp=<%= isApp %>&regionNo=<%= lRegionNo %>&nextUrl=' + nextUrl;
<%
		}
		else
		{
%>
			document.location.href='<%= Constants.getServerURL() %>/taxi/newPost.do?isApp=<%= isApp %>&regionNo=<%= lRegionNo %>&nextUrl=' + nextUrl;
<%
		}
%>		
	}
	
	function getNewPostURL()
	{
		if ( Android && Android != null && typeof Android != 'undefined')
		{
<%
			if ("Y".equals( isHotspot ) )
			{
%>
				Android.setNewPostURL('<%= Constants.getServerURL() %>/taxi/newHotspot.do?isApp=<%= isApp %>&regionNo=<%= lRegionNo %>');
<%
			}
			else
			{
%>
				Android.setNewPostURL('<%= Constants.getServerURL() %>/taxi/newPost.do?isApp=<%= isApp %>&regionNo=<%= lRegionNo %>');
<%
			}
%>			
		}
	}
	
	var currentRegionNo = '';
	
	function getFavoriteRegionInfo()
	{
		$('#loadingDiv').show();
		
		jQuery.ajax({
			type : "POST",
			url : "/nearhere/region/getFavoriteRegionInfo.do",
			data : JSON.stringify({
				"lRegionNo" : <%= lRegionNo %>,
				"mRegionNo" : <%= mRegionNo %>,
				"sRegionNo" : <%= sRegionNo %>,
				"tRegionNo" : <%= tRegionNo %>,
				"isHotSpot" : '<%= isHotspot %>',
				"userID" : userID
			}),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				// TODO
				try {

					$('#loadingDiv').hide();
					
					if ( result != null && result.data != null )
					{
						if (result.data.registeredYN == 'Y' )
							$('#favoriteRegionDivY').show();
						else
							$('#favoriteRegionDivN').show();	
						
						$('.favoriteRegion').find('#regionName').html( result.data.regionName );
						currentRegionNo = result.data.regionNo;
					}

				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				$('#loadingDiv').hide();
			},
			error : function(xhr, status, error) {
				$('#loadingDiv').hide();
				//$('#loading').hide();
			}
		});
	}
	
	function insertRegion()
	{
		var param = {"userID": userID ,"regionNo": currentRegionNo };
		
		$('#loadingDiv').show();
		$('#favoriteRegionDivN').hide();
		
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

					getFavoriteRegionInfo();
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				
			},
			error : function(xhr, status, error) {
				alert("에러발생(insertRegion)" + error );
			}
		});
	}
	
	function deleteRegion()
	{
		var param = {"userID": userID ,"regionNo": currentRegionNo };
		
		$('#loadingDiv').show();
		$('#favoriteRegionDivY').hide();
		
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

					getFavoriteRegionInfo();
					
				} catch (ex) {
					alert(ex.message);
				}
			},
			complete : function(data) {
				// 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
				// TODO
				
			},
			error : function(xhr, status, error) {
				alert("에러발생(deleteRegion)" + error );
			}
		});
	}
	
</script>

	<jsp:include page="../common/common.jsp" flush="true"></jsp:include>
	
</head>
<body>

	<div id="wrapper">

		<!-- div>
			<div onclick="snsLogin();">SNS로그인</div>
		</div>
		
		<div>
			<div onclick="showOKDialog('확인','안녕하세요.','abc');">OKDialog</div>
		</div-->
		
<% if ( !"Y".equals( isHotspot ) ) { %>		
		<div id="regionList" style="padding:10px;background:white;">
		
			<div id="title">목적지 상세지역</div>
		
			<ul style="list-style:none;display:block;text-align:center;margin-top:10px;">
<%
		if ( childRegionList != null ) {
			for ( int i = 0; i < childRegionList.size(); i++ )
			{
				int childRegionCount = Integer.parseInt( childRegionList.get(i).get("childRegionCount").toString() );
				String linkURL = listRegionLink + "&lRegionNo=" + lRegionNo;
				String isSubParent = childRegionList.get(i).get("isSubParent").toString();
				int itemCount = Integer.parseInt( childRegionList.get(i).get("cnt").toString() );
				
				if ("1".equals( request.getAttribute("level") ) )
				{
					linkURL += "&mRegionNo=" + childRegionList.get(i).get("regionNo");
				}
				else if ("2".equals( request.getAttribute("level") ) )
				{
					linkURL += "&mRegionNo=" + mRegionNo + "&sRegionNo=" + childRegionList.get(i).get("regionNo") + "&childRegionCount=" + childRegionCount;
				}
				else if ("3".equals( request.getAttribute("level") ) || "4".equals( request.getAttribute("level") ) )
				{
					linkURL += "&mRegionNo=" + mRegionNo + "&sRegionNo=" + sRegionNo + "&tRegionNo=" + childRegionList.get(i).get("regionNo") ;
				}
				
				if ( !Util.isEmptyString( isSubParent ) ) {
					linkURL += "&isSubParent=" + isSubParent;
				}
				
				if ( itemCount > 0 )
				{
%>				
				<li id="regionItem">
				
				<a href="<%= linkURL %>" class="region">
					<%= childRegionList.get(i).get("regionName") %>
					(<%= childRegionList.get(i).get("cnt") %>)
				</a>
				
				</li>
<%				
				}
			}
		}
%>			
			</ul>
		</div>
		
		<div id="favoriteRegionDivN" class="favoriteRegion">
			<div><span id="regionName"></span>를 관심지역으로 추가하시겠습니까?</div>
			<div style="margin-top:10px;margin-bottom:10px;">
				<input type="button" value="예" class="btn1" onclick="insertRegion();"/>
				<input type="button" value="관심지역 전체보기" class="btn1" onclick="goFavoriteRegionPage();"/>
			</div>
			<div id="infoDiv">
			관심지역을 추가하시면 해당지역의 카풀/합승 글이 등록될때 알림을 받으실 수 있습니다.
			</div>
		</div>
		
		<div id="favoriteRegionDivY" class="favoriteRegion">
			<div><span id="regionName"></span>가 관심지역으로 설정되어 있습니다.<br/>해제하시겠습니까?</div>
			<div style="margin-top:10px;">
				<input type="button" value="예" class="btn1" onclick="deleteRegion();"/>
				<input type="button" value="관심지역 전체보기" class="btn1" onclick="goFavoriteRegionPage();"/>
			</div>
		</div>
		
		<div id="loadingDiv">
			<div><img src="<%= Constants.IMAGE_PATH %>/loading.gif" /></div>
		</div>
		
<%
		}

		if ( "N".equals( isApp ) )
		{
%>
			<div id="btnNewPost" onclick="goNewPost();">
				<img class="newButton" src="<%= Constants.IMAGE_PATH %>/plus_image.png" width=50 height=50 />
			</div>
<%			
		}
%>		
		
		<div id="postList" style="padding:10px;background:white;">
		</div>

		<div id="loading" style="display:none">
			로딩중입니다.
		</div>
		
		<div id="empty" style="display:none;background:white;border-radius: 10px;padding-top:80px;padding-bottom:100px;border: 1px solid gray;">
			등록된 내역이 없습니다.
		</div>
	</div>
	
</body>
</html>
