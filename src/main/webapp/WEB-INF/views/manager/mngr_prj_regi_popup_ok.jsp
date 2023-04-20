<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project Regi PopUp OK </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.title-gap {
	margin: 70px 0 120px 0;
}

.btm-gap {
	margin-bottom: 0px;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	function ok_popup() {
		window.opener.location.reload(); //부모창 reload
		window.opener.location.href = "${dest}?prj_regi_idx=${prj_regi_idx}&r_cPage=${r_cPage}";
		window.close();
	}
</script>
</head>
<body style="margin: 0; padding: 0">
<form method="post">
	<div class="md-wrap">
		<div class="md-title title-gap">
			${msg}
		</div>
		<div class="btn-wrap-btm btm-gap">
			<div><button class="btn-detail" onclick="ok_popup()">확 인</button></div>
		</div>
	</div>
</form>	
</body>
</html>