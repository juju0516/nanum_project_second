<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project Delete PopUp  </title>
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
	margin-top: 20px;
	margin-bottom: 10px;
	margin-right: 0px;
	margin-left:145px;
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
	function project_delete(f) {
		/* var login_pw = "${mvo.manager_pw}";
		if(f.pwd.value != login_pw) {
			alert("패스워드가 일치하지 않습니다.");
			return;	
		} */
		
		f.action = "mngr_prj_delete_exec.do";
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
		<div class="md-title">Project 삭제</div>
		<div class="md-row-wrap">
			<div class="md-label l-gap">제 목</div>
			<div class="mod-input-loc gap">
				<span class="input-detail">${vo.prj_title}</span></div>
		</div>
		<div class="md-row-wrap">
			<div class="md-label" style="width:250px; margin-left:50px">프로젝트를 내림처리 하시겠습니까?</div>
		</div>
		<div class="btn-wrap-btm btm-gap">
			<input type="hidden" name="cPage" value="${cPage}">
			<input type="hidden" name="project_idx" value="${vo.project_idx}">
			<div class="btn-create"><button class="btn-detail" onclick="project_delete(this.form)">삭 제 (내림)</button></div>
			<div class="btn-create"><button class="btn-detail" onclick="close_popup()">취 소</button></div>
		</div>
	</div>
</form>	
</body>
</html>