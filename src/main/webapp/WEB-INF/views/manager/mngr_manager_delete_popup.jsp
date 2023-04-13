<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Manager Delete PopUp  </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.input-detail {
	width: 250px;
	height: 29px;
	margin: 0px;
	text-align: left;
	text-indent: 10px;
	font-size: 13.5px;
	color: rgb(64, 64, 64);
	font-family: 'NanumSquareNeo';
}
.l-gap {
	padding-right: 41px;
	margin-top: 20px;
	margin-bottom: 10px;
	margin-right: 0px;
}
.gap {
	padding-right: 148px;
	margin-top: 20px;
	margin-bottom: 10px;
}
.btm-gap {
	margin-bottom: 0px;
	margin-top: 100px;
}
.btn-create {
	margin: 0px 10px 0px 10px;
}
</style>
<script type="text/javascript">
	function delete_manager_info(f) {
		var login_pw = "${mvo.manager_pw}";
		if(f.pwd.value != login_pw) {
			alert("패스워드가 일치하지 않습니다.");
			return;	
		}
		
		f.action = "mngr_manager_delete_exec.do";
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
		<div class="md-title">관리자 ID 사용 중지</div>
		<div class="md-row-wrap">
			<div class="md-label l-gap">관리자 ID</div><div class="mod-input-loc gap">
			<span class="input-detail">${mvo.manager_id}</span></div>
		</div>
		<div class="md-row-wrap">
			<div class="md-label">패스워드</div><div class="md-input-loc">
			<input class="input-text input-detail" type="password" name="pwd"></div>
		</div>
		<div class="btn-wrap-btm btm-gap">
			<input type="hidden" name="manager_idx" value="${mvo.manager_idx }"> 
			<div class="btn-create"><button class="btn-detail" onclick="delete_manager_info(this.form)">사용 중지</button></div>
			<div class="btn-create"><button class="btn-detail" onclick="close_popup()">취 소</button></div>
		</div>
	</div>
</form>	
</body>
</html>