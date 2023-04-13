<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Goods Sale State Change PopUp  </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.gap {
	margin-top: 30px;
}
.s-len {
	width: 200px;
	margin-left: 30px;
}
.btm-gap {
	margin-bottom: 0px;
	margin-top: 120px;
}
.btn-create {
	margin: 0px 10px 0px 10px;
}
</style>
<script type="text/javascript">
	function goods_state_change(f) {
		/* var login_pw = "${mvo.manager_pw}";
		if(f.pwd.value != login_pw) {
			alert("패스워드가 일치하지 않습니다.");
			return;	
		} */
		
		var next_state = document.getElementById("next_state");
		var value = next_state.options[next_state.selectedIndex].value;
		
		if(value == '0') {
			alert('선택한 내용이 없습니다.');
			return;
		}
		
		f.action = "mngr_goods_sale_popup_ok.do?next_state=" + value +
				   "&goods_sale_idx=${goods_sale_idx}&s_cPage=${s_cPage}";
		f.submit();
	}

	function close_popup() {
		window.opener.location.reload(); //부모창 reload
		window.close();
	}
</script>
</head>
<body style="margin: 0; padding: 0">
<form method="post">
	<div class="md-wrap">
		<div class="md-title gap">해당 주문의 상태를 선택하세요.</div>
		<div class="md-row-wrap">
			<select class="select s-len" id="next_state">
				<option value="0">-- 상 태 --</option>
				<option value="제품준비">제품 준비</option>
				<option value="배송시작">배송 시작</option>
				<option value="배송완료">배송 완료</option>
			</select>
		</div>
		<div class="btn-wrap-btm btm-gap">
			<div class="btn-create"><button class="btn-detail" onclick="goods_state_change(this.form)">확 인</button></div>
			<div class="btn-create"><button class="btn-detail" onclick="close_popup()">취 소</button></div>
		</div>
	</div>
</form>	
</body>
</html>