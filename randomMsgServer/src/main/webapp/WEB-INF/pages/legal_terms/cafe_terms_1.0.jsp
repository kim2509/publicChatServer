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

<link rel="stylesheet" type="text/css"
	href="<%=Constants.CSS_PATH%>/cafe_terms.css" />

<script language="javascript">
		
</script>

</head>
<body>

	<div id="wrapper">
		
		<div class="title">이근처 카페 약관</div>
		
		<div class="cafe_rule">
	        <strong class="tit_rule">제 1 조 (목적)</strong>
	        <p class="desc_rule">본 약관은 회원(Daum서비스 약관에 동의하는 자를 말합니다. 이하 “회원”이라고 합니다)이 주식회사 카카오(이하 “회사”라고 합니다)가 제공하는 Daum 카페 서비스(이하 “서비스”라고 합니다)를 이용함에 있어 회원과 회원의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p>
	        <strong class="tit_rule">제 2 조 (약관의 명시, 효력 및 개정)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">회사는 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 15일 전부터 적용일 이후 상당한 기간 동안 서비스 초기화면에 공지하고, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 초기화면에 공지하고 회사가 부여한 이메일 주소로 약관 개정 사실을 발송하여 고지합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">④</span><span class="txt_rule">회사가 전항에 따라 회원에게 통지하면서 공지 또는 공지·고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 불구하고 거부의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 Daum 서비스약관 제 17조 제 1항의 규정에 따라 이용계약을 해지할 수 있습니다.</span></p>
	        <strong class="tit_rule">제 3 조 (서비스의 제공)</strong>
	        <p class="desc_rule">회사가 제공하는 서비스의 종류는 아래 각 호로 합니다.</p>
	        <ul class="list_rule">
	            <li><span class="txt_num">1.</span><span class="txt_rule">Daum 카페 서비스</span></li>
	            <li><span class="txt_num">2.</span><span class="txt_rule">기타 회사가 자체 개발하는 등의 방법으로 추가적으로 회원에게 제공하는 일체의 서비스</span></li>
	        </ul>
	        <strong class="tit_rule">제 4 조 (서비스 이용)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">서비스 이용은 회사의 서비스 사용승낙 직후부터 가능합니다. 다만, 유료 서비스의 경우 회사가 요금납입을 확인한 직후부터 가능하게 할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">민법상 미성년자인 회원이 유료 서비스를 이용할 경우 미성년자인 회원은 결제 전 법정대리인의 동의를 얻어야 합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">서비스 이용시간은 회사의 업무상 또는 기술상 불가능한 경우를 제외하고는 연중무휴 1일 24시간<span class="num_rule">(00:00-24:00)</span>으로 함을 원칙으로 합니다. 다만, 서비스설비의 정기점검 등의 사유로 회사가 서비스를 특정범위로 분할하여 별도로 서비스 이용의 날짜와 시간을 정할 수 있습니다.</span></p>
	        <strong class="tit_rule">제 5 조 (정의)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">“카페”라 함은 회원들이 공통된 주제로 의견을 나누고 정보를 공유하거나 친목을 나눌 목적 등으로 모인 온라인상의 공간을 말합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">“카페지기”라 함은 아래 각 호의 자를 말합니다.</span></p>
	        <ul class="list_rule">
	            <li><span class="txt_num">1.</span><span class="txt_rule">카페를 개설한 자</span></li>
	            <li><span class="txt_num">2.</span><span class="txt_rule">회사가 정하는 정상적인 절차에 따라 하자 없이 이전 카페지기로부터 카페를 양도받거나 카페 지기의 부재 등의 사유로 카페지기로 임명된 자</span></li>
	        </ul>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">“운영자” 라 함은 카페지기가 선정하여 운영자로 지정한 해당 카페의 회원을 말합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">④</span><span class="txt_rule">“운영 권한”이라 함은 카페의 폐쇄, 회원의 정보 열람, 등급 변경, 접근 금지 및 강제 탈퇴, 게시물의 이동 및 삭제 등 카페를 정상적으로 운영하기 위해 필요한 권한을 말하며 카페지기는 서비스에 지정된 모든 운영 권한을 가집니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑤</span><span class="txt_rule">“카페회원”이라 함은 이미 개설되어 있는 카페에 가입하여 해당 카페의 일원으로 활동하는 자를 말합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑥</span><span class="txt_rule">본 약관에서 사용하는 용어 중 본 조에서 정하지 아니한 것은 Daum 서비스약관, Daum 카페 운영원칙 및 관계 법령에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.</span></p>
	        <strong class="tit_rule">제 6 조 (카페 개설 및 양도, 자진폐쇄)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">회원은 누구든지 카페를 개설하거나 운영자 또는 카페회원으로 활동할 수 있습니다. 단, 다음 각 호에 해당하는 경우 회사는 카페 개설 및 이용을 제한합니다.</span></p>
	        <ul class="list_rule">
	            <li><span class="txt_num">1.</span><span class="txt_rule">회원가입신청 또는 변경 시 허위내용을 등록한 경우</span></li>
	            <li><span class="txt_num">2.</span><span class="txt_rule">불법 정보 또는 잘못된 정보 게재를 목적으로 한 경우</span></li>
	            <li><span class="txt_num">3.</span><span class="txt_rule">음란물이나 불온한 내용 게재를 목적으로 한 경우</span></li>
	            <li><span class="txt_num">4.</span><span class="txt_rule">타인의 명예를 훼손하거나 피해를 주는 내용을 게재할 목적인 경우</span></li>
	            <li><span class="txt_num">5.</span><span class="txt_rule">미풍양속을 해치는 내용을 게재할 목적인 경우</span></li>
	            <li><span class="txt_num">6.</span><span class="txt_rule">타인의 지적재산권 또는 초상권을 침해하는 내용을 게재할 목적인 경우</span></li>
	            <li><span class="txt_num">7.</span><span class="txt_rule">타인 또는 업체를 사칭하거나 사기의 목적인 경우</span></li>
	            <li><span class="txt_num">8.</span><span class="txt_rule">현행법률에 저촉되는 정보 게재를 목적으로 할 경우</span></li>
	            <li><span class="txt_num">9.</span><span class="txt_rule">인터넷을 통한 판매, 전시, 홍보 등이 금지된 물품을 판매, 전시, 홍보하는 등 불법적인 목적의 카페를 개설, 운영하는 경우</span></li>
	            <li><span class="txt_num">10.</span><span class="txt_rule">회사 또는 제3자에게 피해를 미칠 수 있어 Daum 서비스약관, Daum 카페 운영원칙 등에 따라 회사가 게재를 금지한 내용을 게재할 목적인 경우</span></li>
	            <li><span class="txt_num">11.</span><span class="txt_rule">카페 내 활동과 관계없는 타 서비스의 회원 모집, 또는 회원 모집에 필요한 개인정보 획득만을 목적으로 카페를 개설, 운영하는 경우</span></li>
	            <li><span class="txt_num">12.</span><span class="txt_rule">카페 이름, 카페 검색어, 소개글 또는 카페 주소 URL에 제2호 내지 제11호에 해당하는 내용을 표현하거나 포함할 경우</span></li>
	            <li><span class="txt_num">13.</span><span class="txt_rule">기타 카페 이용약관 및 운영원칙 내용을 위배한다고 판단될 경우</span></li>
	        </ul>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">카페 개설 후 카페 주소 URL의 변경, 정정은 허용되지 않습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">카페지기는 카페지기의 권한을 운영자 또는 카페회원에게 양도할 수 있으며, 카페지기의 권한을 양도하는 경우 카페지기의 권한은 상실됩니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">④</span><span class="txt_rule">카페지기는 카페지기 외 다른 회원이 없는 경우 관리자 화면에서 ‘폐쇄’를 클릭함으로써 카페를 자진폐쇄 할 수 있습니다. 카페지기 외 다른 회원이 있는 경우 카페지기는 카페의 폐쇄를 사전에 고지하고 회원이 모두 탈퇴한 후 카페를 폐쇄할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑤</span><span class="txt_rule">카페지기가 자진폐쇄한 카페는 복구할 수 없습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑥</span><span class="txt_rule">카페지기는 그 계정정보 및 관리에 대한 철저한 보안의무가 있고, 카페지기나 운영자 본인의 관리소홀로 인해 패스워드가 타인에게 유출되어 카페 운영에 문제가 발생한 경우 그로 인한 책임은 카페지기나 운영자에게 있으며 삭제된 카페 자료는 복구할 수 없습니다.</span></p>
	        <strong class="tit_rule">제 7 조 (회원 탈퇴 및 자격 상실)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">카페 회원은 언제든지 임의로 카페를 탈퇴할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">카페 회원이 본 약관 및/또는 Daum 카페 운영원칙에 위배되는 행위를 한 경우 모든 관리책임은 1차적으로 카페지기가 부담하며, 회사의 시정요구에도 불구하고 별도의 조치나 시정이 안될 경우 회사는 카페지기 및/또는 회원의 자격을 박탈하거나 서비스의 이용을 중지 또는 제한할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">카페지기의 자격이 박탈되거나 카페지기가 Daum 서비스에서 탈퇴한 경우, 카페지기가 카페지기로서의 권한을 정상적으로 유지하지 못할 경우 회사는 운영원칙에 따라 카페를 기존 운영자 중 신청자에게 양도할 수 있으며, 카페지기 자격이 박탈되거나 카페가 양도된 경우 기존 카페지기의 모든 운영 권한은 상실됩니다.</span></p>
	        <strong class="tit_rule">제 8 조 (카페, 카페메뉴, 강제폐쇄 및 게시물 삭제, 공지)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">카페 개설 후 회원수에 상관 없이 연속 3개월간 게시판 등에 신규 게시물이 게시되지 않거나 회원이 가입이 없는 경우, 회사는 해당 카페를 강제 폐쇄할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">사유를 불문하고 3개월 이상 카페지기가 부재(해당 카페에 접속하지 않은 경우 등)한 경우 회사는 해당 카페를 강제 폐쇄하거나, 기존 운영자 중 신청자에게 카페를 양도할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">회원이 본 약관 제6조 제 1항의 각 호에서 규정한 목적으로 카페를 이용하거나 그에 해당하는 정보를 게재한 경우 회사는 해당 카페 또는 카페메뉴(게시판 및 기타)를 강제 폐쇄하거나 해당 게시물을 삭제할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">④</span><span class="txt_rule">회사는 강제 폐쇄한 카페 목록 및 강제 폐쇄 사유를 수시로 공지할 수 있습니다.</span></p>
	        <strong class="tit_rule">제 9 조 (카페 내 게시물 및 콘텐츠의 관리)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">카페 내 모든 게시물 및 콘텐츠의 관리 및 운영 권한은 카페 운영진 또는 해당 게시물 및 콘텐츠를 게시한 회원에게 있습니다. 단, 카페지기 및/또는 운영자의 요청이 있거나 기타 회사가 카페의 원활한 운영을 위하여 필요하다고 판단할 경우, 회사는 게시물의 관리 등과 관련한 사항을 개선, 지원하는 등의 활동을 할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">카페 내 게시물 작성 회원은 다른 회원에게의 복사, 스크랩 등을 허용할 수 있고 공개 범위를 설정할 수도 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">제6조 제3항 및 제8조 제1항, 제 2항, 제3항에 따라 폐쇄된 카페, 카페 메뉴, 게시글은 즉시 삭제되고, 삭제된 내용은 복구할 수 없습니다.</span></p>
	        <strong class="tit_rule">제 10 조 (카페 내 전자상거래)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">카페회원은 서비스를 이용하여 통신판매 또는 통신판매중개를 업으로 하는 경우 전자상거래 등에서의 소비자보호에 관한 법률(이하 전자상거래법이라 합니다.)에 따른 의무를 준수하여야 합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">카페회원과 제1항의 통신판매 또는 통신판매중개를 업으로 하는 카페회원 사이에 전자상거래 관련 분쟁이 발생하는 경우 카페회원은 고객센터를 통하여 소비자피해 구제 대행 신청을 할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">회사는 제1항의 카페회원에게 전자상거래법에 따라 신원정보를 입력하는 기능 등을 제공하여 신원정보를 확인하고, 카페회원과 제1항의 통신판매 또는 통신판매중개를 업으로 하는 카페 회원 사이에 분쟁이 발생하여 전자상거래법에 따라 소비자피해 분쟁조정기구, 공정거래위원회, 시도지사 또는 시장 군수 구청장이 신원정보 제공을 요구하는 경우 이에 협조합니다.</span></p>
	        <strong class="tit_rule">제 11 조 (회원의 의무)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">카페 내의 모든 게시물과 자료의 보관, 관리의 책임은 카페 운영진 또는 해당 게시물과 자료를 작성한 회원에게 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">카페 회원은 본 약관이나 Daum서비스약관, Daum 카페 운영원칙에서 금지하는 내용의 게시물을 카페 내에 등록할 수 없으며, 이를 위반하여 발생하는 책임은 게시물 작성자에게 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">상품등록게시판을 포함하여 카페 내에서 회원간 이루어지는 상거래 및 계약과 관련하여 발생하는 모든 의무와 책임은 거래 당사자에게 있으며, 회사는 그 내용에 대하여 책임을 지지 않습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">④</span><span class="txt_rule">카페 회원은 본 조의 의무 외, Daum서비스 약관 제 13조에서 정한 회원의 의무를 부담합니다.</span></p>
	        <strong class="tit_rule">제 12 조 (카페지기의 권한 및 의무)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">카페지기(운영자를 포함합니다. 이하 본 조에서 동일합니다)는 관련 법령과 본 약관을 준수하는 범위 내에서 본인이 개설하거나 운영하는 카페의 가입 조건을 설정할 수 있으며, 해당 카페의 가입 방식 및 조건에 따라 가입 신청한 회원의 가입 신청 승낙 여부를 결정할 수 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">카페지기는 관련 법령과 본 약관의 내용을 준수하여 해당 카페에 가입하고자 하는 회원으로부터 일정한 정보를 제공 받을 수 있으며, 카페 운영원칙에 따라 해당 정보들은 카페지기의 책임 하에 관리, 운영됩니다. 카페지기는 어떠한 경우에도 카페 회원의 사전 서면 허락 없이 개인의 신상정보를 타인에게 제공하거나 공개할 수 없으며, 이를 위반하여 발생하는 모든 책임은 카페지기에게 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">③</span><span class="txt_rule">카페지기는 법령과 약관을 준수하는 범위 내에서 카페 회원의 활동 범위 및 등급을 지정할 수 있는 권한과 그에 따른 책임이 있습니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">④</span><span class="txt_rule">카페지기는 카페에 대한 운영 권한이 있으며 이로 인한 일체의 책임을 부담하고, 카페 회원과 카페지기 사이에 발생한 모든 법적인 분쟁에 대한 책임을 부담합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑤</span><span class="txt_rule">카페지기는 카페지기 외 제3자의 홍보메일 등을 일부 또는 전부의 카페 회원을 상대로 발송하는 경우 대상 회원에게 사전에 해당 사실을 알려야 합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑥</span><span class="txt_rule">본인이 운영하던 카페를 타인에게 양도하는 카페지기는 카페 양도 전 최소 15일 간, 그 양도의 사실을 공지사항으로 게시하고 이메일을 통해 카페 회원에게 고지하여야 합니다. 타인이 운영하던 카페를 양도받은 카페지기는 카페를 양도받은 후 최소 15일 간, 그 양도의 사실을 공지사항으로 게시하고 이메일을 통해 카페 회원에게 고지하여야 합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">⑦</span><span class="txt_rule">카페지기는 카페를 영리목적으로 운영하는 경우 본 약관 및 카페 운영원칙에서 정한 사항 외에도 "정보통신망 이용촉진 및 정보보호등에 관한 법률", "전자상거래 등에서의 소비자보호에 관한 법률" 등 관련 법령상 책임을 부담합니다.</span></p>
	        <strong class="tit_rule">제 13 조 (약관 외 준칙)</strong>
	        <p class="desc_rule"><span class="txt_num">①</span><span class="txt_rule">회사는 본 약관 외에 Daum 카페 운영원칙을 규정하며, 회원은 Daum 카페 운영원칙을 준수하여야 합니다.</span></p>
	        <p class="desc_rule"><span class="txt_num">②</span><span class="txt_rule">본 약관에 명시하지 않은 사항은 Daum 카페 운영원칙과 Daum 서비스약관에 따르며, 본 약관과 Daum 카페 운영원칙 및 Daum 서비스약관의 내용이 충돌하는 경우 본 약관의 내용이 우선합니다.</span></p>
	        <strong class="tit_rule">제 14 조 (분쟁의 해결)</strong>
	        <p class="desc_rule">본 약관은 대한민국법령에 의하여 규정되고 이행되며, 서비스 이용과 관련하여 회사와 회원간에 발생한 분쟁에 관한 소는 민사소송법상의 관할법원에 제기하기로 합니다.</p>
	        <strong class="tit_rule">부 칙 <span class="num_rule">(2016.09.30)</span></strong>
	        <p class="desc_rule">본 약관은 2016. 09. 30.부터 적용됩니다. 단, 본 약관의 공지 이후 시행일 이전에 본 약관에 동의한 경우에는 동의 시부터 본 약관이 적용됩니다.</p>

	    </div>
		
			
	</div>

	
	
</body>
</html>