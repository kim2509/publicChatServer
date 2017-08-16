Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

/* 안드로이드 함수들 start */
function notice( message )
{
	if ( isApp == 'Y' )
		Android.showOKDialog('알림', message, '');
	else
		alert( message );
}

function finishActivity()
{
	if ( Android && Android != null && typeof Android != 'undefined')
	{
		return Android.finishActivity('');
	}
	
	return '';
}

function goBack()
{
	if ( isApp == 'Y' )
		finishActivity();
	else
		history.back(-1);
}

function sendBroadcasts( jsonObj )
{
	if ( Android && Android != null && typeof Android != 'undefined')
	{
		if ( Android.sendBroadcasts && Android.sendBroadcasts != null && typeof Android.sendBroadcasts != 'undefined')
		{
			return Android.sendBroadcasts( JSON.stringify( jsonObj ) );
		}
	}
	
	return '';
}

function selectPhotoUpload( jsonObj )
{
	if ( Android && Android != null && typeof Android != 'undefined')
	{
		return Android.selectPhotoUpload( JSON.stringify( jsonObj ) );
	}
	
	return '';
}

function setLoginUser( jsonObj )
{
	if ( Android && Android != null && typeof Android != 'undefined')
	{
		if ( Android.setLoginUser && Android.setLoginUser != null && typeof Android.setLoginUser != 'undefined')
		{
			return Android.setLoginUser( JSON.stringify( jsonObj ) );
		}
	}
	
	return '';
}

/* 안드로이드 함수들 end */

function isAlphaNumberKorOnly( str )
{
	if ( str.match(/[^0-9a-zA-Z가-힝ㄱ-ㅎ]/) != null ) {
	  return false;
	}
		
	return true;
}

function isAlphaNumberOnly( str )
{
	if ( str.match(/[^a-zA-Z0-9]/) != null ) {
	  return false;
	}
	
	return true;
}

function displayDateFormat( jsonDate, format )
{
	var date = new Date(jsonDate);
	return date.format( format );
}

function ajaxRequest( method, url, param , onSuccess, onComplete, onError )
{
	try
	{
		jQuery.ajax({
			type : method,
			url : url,
			xhrFields: {
			      withCredentials: true
			   },
			data : JSON.stringify( param ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				onSuccess( result );
			},
			complete : function(result) {
				if ( onComplete != undefined && onComplete != null )
					onComplete( result );
			},
			error : function(xhr, status, error) {
				if ( onError != undefined && onError != null )
					onError( xhr, status, error );
			}
		});	
	}
	catch( ex )
	{
		alert( ex.message );
	}
}

function ajaxRequest2( method, url, param , param2, onSuccess, onComplete, onError )
{
	try
	{
		jQuery.ajax({
			type : method,
			url : url,
			xhrFields: {
			      withCredentials: true
			   },
			data : JSON.stringify( param ),
			dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			contentType : "application/json; charset=UTF-8",
			success : function(result) {
				onSuccess( result, param2 );
			},
			complete : function(result) {
				if ( onComplete != undefined && onComplete != null )
					onComplete( result, param2 );
			},
			error : function(xhr, status, error) {
				if ( onError != undefined && onError != null )
					onError( param2, xhr, status, error );
			}
		});	
	}
	catch( ex )
	{
		alert( ex.message );
	}
}

function numberWithCommas(x) {
	if ( typeof x == 'undefined' )
		return '';
	
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}