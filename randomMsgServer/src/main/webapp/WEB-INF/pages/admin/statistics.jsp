<%@ page contentType="text/html; charset=UTF-8"%>

<style>
ul{list-style:none;clear}
div{clear:both;}
.btn{background:gray;color:white;padding:5px;width:100px;text-align:center;margin:10px;font-size:14px;font-weight:bold;border:1px solid black;}
</style>

<script language="javascript">

jQuery(document).ready(function(){

	var param = {};
	ajaxRequest('POST', '/nearhere/admin/installRates.do', param , onInstallRatesReceived );
	
	
});

function onInstallRatesReceived( result )
{
	var source = $('#installRateT').html();
	var template = Handlebars.compile(source);
	var html = template(result);
	$('#installRatesDiv').html( html);
}

</script>
<script id="installRateT" type="text/x-handlebars-template">
	{{#if data}}
	<table border="1" cellpadding="5">
		<tr>
		{{#each data}}
		<td>
			{{@index}}일째
		</td>
		{{/each}}
		</tr>
		<tr>
		{{#each data}}
		<td>
			install : {{installNumber}}
		</td>
		{{/each}}
		</tr>
		<tr>
		{{#each data}}
		<td>
			delete : {{deleteNumber}}
		</td>
		{{/each}}
		</tr>
		<tr>
		{{#each data}}
		<td>
			rate : {{installRate}}
		</td>
		{{/each}}
		</tr>

	</table>
	{{else}}
		<div class="empty">empty</div>
	{{/if}}			
</script>

<div class="btn" onclick="$('#statisticsDiv').show();">통계 보기</div>
<div id="statisticsDiv" style="margin-bottom:10px;display:none;">

	<a href="/nearhere/admin/allUsers.do">전체 사용자 보기(최근 100명)</a>
	<br/><br/>
	<a href="/nearhere/admin/allUsersOnMap.do">전체 사용자 보기(지도)</a>
	<br/><br/>
	
	최근 10일간 설치율
	<div id="installRatesDiv">
	</div>
</div>
