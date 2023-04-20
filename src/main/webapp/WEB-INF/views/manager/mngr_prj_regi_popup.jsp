<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project Registration State Change PopUp  </title>
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
	width: 60px;
	text-align: left;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-right: 0px;
}
.gap {
	margin-top: 0px;
	margin-bottom: 0px;
}

.btm-gap {
	margin-bottom: 0px;
	margin-top: 80px;
}
.btn-create {
	margin: 0px 10px 0px 10px;
}
</style>
<script type="text/javascript">
	function prj_regi_state_change(f) {
		/* var login_pw = "${mvo.manager_pw}";
		if(f.pwd.value != login_pw) {
			alert("패스워드가 일치하지 않습니다.");
			return;	
		} */
		
		f.action = "${dest}";
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
		<div class="md-title" style="margin-top:20px; margin-botton:30px">${title }</div>
		<div class="md-row-wrap">
			<div class="md-label l-gap">제 목 : </div>
			<div class="mod-input-loc gap">
				<span class="input-detail"> ${vo.prj_title}</span></div>
		</div>
		<div class="md-row-wrap">
			<div class="md-label" style="width:400px; margin-left:30px; margin-top:10px; text-align:center">${msg}</div>
		</div>
		<div class="btn-wrap-btm btm-gap">
			<input type="hidden" name="r_cPage" value="${r_cPage}">
			<input type="hidden" name="prj_regi_idx" value="${prj_regi_idx}">
			<input type="hidden" name="type" value="${type}">
			<div class="btn-create"><button class="btn-detail" onclick="prj_regi_state_change(this.form)">진 행</button></div>
			<div class="btn-create"><button class="btn-detail" onclick="close_popup()">취 소</button></div>
		</div>
	</div>
</form>	
</body>
</html>