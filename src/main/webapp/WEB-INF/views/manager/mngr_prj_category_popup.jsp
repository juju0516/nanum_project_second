<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project Category Change PopUp  </title>
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
	function project_category_change(f) {
		/* var login_pw = "${mvo.manager_pw}";
		if(f.pwd.value != login_pw) {
			alert("패스워드가 일치하지 않습니다.");
			return;	
		} */
		
		var category = document.getElementById("category");
		var value = category.options[category.selectedIndex].value;
		
		if(value == '') {
			alert('선택한 내용이 없습니다.');
			return;
		}
		
		f.action = "mngr_prj_category_popup_exec.do?category=" + value +
				   "&project_idx=${project_idx}&cPage=${cPage}";
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
		<div class="md-title gap">프로젝트 카테고리를 선택하세요.</div>
		<div class="md-row-wrap">
			<select class="select s-len" id="category">
				<option value=""> -- 프로젝트 구분 -- </option>
				<option value="진행중"> 진행중 </option>
				<option value="새로 시작된"> 새로 시작된 </option>
				<option value="오픈 예정"> 오픈 예정 </option>
				<option value="완료"> 완료 </option>
			</select>
		</div>
		<div class="btn-wrap-btm btm-gap">
			<div class="btn-create"><button class="btn-detail" onclick="project_category_change(this.form)">확 인</button></div>
			<div class="btn-create"><button class="btn-detail" onclick="close_popup()">취 소</button></div>
		</div>
	</div>
</form>	
</body>
</html>