<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Goods 주문 상태 변경 완료 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.title-gap {
	margin: 80px 0 150px 0;
}

.btm-gap {
	margin-bottom: 0px;
	margin-top: 40px;
}
</style>
<script type="text/javascript">
	function ok_popup() {
		window.opener.location.reload(); //부모창 reload
		window.opener.location.href = "mngr_goods_sale.do?s_cPage=${s_cPage}";
		window.close();
	}
</script>
</head>
<body style="margin: 0; padding: 0">
<form method="post">
	<div class="md-wrap">
		<div class="md-title title-gap">
			주문 상태 변경이 완료되었습니다.
		</div>
		<div class="btn-wrap-btm btm-gap">
			<div><button class="btn-detail" onclick="ok_popup()">확 인</button></div>
		</div>
	</div>
</form>	
</body>
</html>