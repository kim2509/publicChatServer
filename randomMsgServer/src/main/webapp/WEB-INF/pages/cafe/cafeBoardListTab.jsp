<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dy.common.*"%>

<div class="cafe_bnr" style="background-color:#ffffc3;clear:both;">
	<div style="display:inline-block;float:right;line-height:45px;height:45px;margin-top:12px;margin-right:10px;"><img src="<%= Constants.IMAGE_PATH %>/closeX.png" width="20" height="20" /></div>
	<a href="" class="link_bnr"><span class="ico_cafe ico_bnr">알림</span>게시판 새글 소식을 빨리 받고 싶다면!</a>
</div>
	
<div id="boardList">
	
	<p>전체 게시판</p>

	<ul>
		<li>
			<a href="javascript:void(0)" 
			onclick="goBoardHome('','공지사항','<%= Constants.getServerURL() + "/cafe/board/3?isApp=" %>');">공지사항</a> 
		</li>
		<li>
			<a href="javascript:void(0)" onclick="goBoardHome();">휴대폰/악세사리</a> 
		</li>
		<li>
			<a href="javascript:void(0)" onclick="goBoardHome();">문의 게시판</a> 
		</li>
	</ul>
</div>

