<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Manager Create PopUp  </title>
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
}
.notice {
	display: flex;
	justify-content: center;
	margin: 0px 0px 0px 70px; 
	
	width: 350px;
	font-size: 12px; 
	font-family: 'NanumSquareNeo'; 
}
.notice-gap {
	margin: 20px 0px 0px 0px;
}
.btm-gap {
	margin-bottom: 0px;
	margin-top: 50px;
}
.btn-create {
	margin: 0px 10px 0px 10px;
}
</style>
<script type="text/javascript">
	function create_manager_info(f) {
		if(f.id.value == "") {
			alert("Manager Id를 입력해주세요.");	
			return;
		}
		if(f.pwd.value == "") {
			alert("패스워드를 입력해주세요.");
			return;	
		}
		
		f.action = "mngr_manager_create_exec.do";
		f.submit();
	}

	function close_popup() {
		swindow.opener.location.reload(); //부모창 reload
		window.close();
	}
</script>
</head>
<body style="margin: 0; padding: 0">
<form method="post">
	<div class="md-wrap">
		<div class="md-title">새 관리자 정보</div>
		<div class="md-row-wrap">
			<div class="md-label">ID</div><div class="mod-input-loc">
			<input class="input-text input-detail" type="text" name="id"></div>
		</div>
		<div class="md-row-wrap">
			<div class="md-label">패스워드</div><div class="mod-input-loc">
			<input class="input-text input-detail" type="password" name="pwd"></div>
		</div>
		<div class="md-row-wrap">
			<div class="md-label">이름</div><div class="mod-input-loc">
			<input class="input-text input-detail" type="text" name="name"></div>
		</div>
		<div class="md-row-wrap notice-gap">
		<div class="notice">※ 전화번호는 숫자만 입력해주세요.</div>
		</div>
		<div class="md-row-wrap">
			<div class="md-label">전화번호</div><div class="mod-input-loc">
			<input class="input-text input-detail" type="text" name="phone"></div>
		</div>
		<div class="btn-wrap-btm btm-gap">
			<div class="btn-create"><button class="btn-detail" onclick="create_manager_info(this.form)">생 성</button></div>
			<div class="btn-create"><button class="btn-detail" onclick="close_popup()">취 소</button></div>
		</div>
	</div>
</form>	
</body>
</html>