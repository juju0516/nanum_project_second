<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">

<style type="text/css">
/* header */
.page-header {
	display: flex;
	flex-direction: row;
	
	background-color: #EAEAEA80;
	width: 100%;
	height: 120px;
}
.page-header > .header-logo {
	margin: 30px 0px 0px 30px;
	color: #005792;
	font-size: 50px;
	font-family: 'NanumSquareNeoHeavy'; 
}
.page-header > .header-logo a {
	color: #005792;
	text-decoration: none;
}
.page-header > .header-grid {
	margin-left: auto;
	margin-right: 30px;
	margin-top: 15px;

	display: grid;
	grid-template-columns: 110px;
	grid-template-rows: 30px 30px;
	row-gap: 10px;
	column-gap: 10px;
}
.header-sub1 {
	grid-column: 1 / 2;
	grid-row: 1 / 2;
	
	font-size: 18px;
	font-family: 'NanumGothicExraBold';
	font-weight: bold;
}
.header-sub2 {
	grid-column: 1 / 2; 
	grid-row: 2 / 3;
	
	font-size: 13px;
	font-family: 'NanumSquareNeoBold'; 
	font-family: 'NanumGothicExraBold';
}

/* body */
.wrap {
	display: flex;
	justify-content: center;
	position: relative;
}
.grid-container {
	margin: 230px auto;
	margin: 45% auto;
	
	display: grid;
	grid-template-columns: 200px 300px;
	grid-template-rows : 50px 50px 50px;
	row-gap: 20px;
	column-gap: 10px;
}
.label-id {
	grid-column: 1 / 2;
	grid-row: 1 / 2;
	
	font-size: 25px;
	font-family: 'NanumGothicExraBold';
	font-weight: bold;
}
.input-id {
	grid-column: 2 / 3;
	grid-row: 1 / 2;
}
.label-pw {
	grid-column: 1 / 2;
	grid-row: 2 / 3;
	
	font-size: 25px;
	font-family: 'NanumGothicExraBold';
	font-weight: bold;
}
.input-pw {
	grid-column: 2 / 3;
	grid-row: 2 / 3;
}

input {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	
	width: 300px;
	height: 33px;
	font-size: 16px;
	font-family: 'NanumGothicExraBold';
	color: #444;
	
	border: 1px solid #aaa;
	/* border-radius: 0.5em; */
	border-radius: 5px;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04); 	
	
	text-indent: 10px;
}
input:hover {
	border-color: #888;
}
input:focus {
	border-color: #aaa;
	/* box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7); 
	box-shadow: 0 0 0 3px -moz-mac-focusring; */
	color: #222;
	outline: none;
}

.btn-login {
	grid-column: 1 / 3;
	grid-row: 3 / 4;
	
	margin: 50px auto;
}
.btn-detail {
	margin: 5px auto;
	
	width: 200px; 
	height: 40px; 
	border-radius: 5px; /*버튼 모서리 둥글게*/
	color: #fff; 
	border-color:rgb(0, 87, 146); 
	background-color: rgb(0, 87, 146); 
	font-size: 19px; 
	font-family: 'NanumGothicExtraBold'; 
	font-weight: bold;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if("${msg}" == "mismatch_id") {		
			alert(" 존재하지 않는 ID 입니다.");	
			$("#id").focus();
		} 
		else if("${msg}" == "mismatch_pw") {
			alert("패스워드가 일치하지 않습니다.");
			$("#id").focus();
		} 
	});
	
	function manager_login(f) {
		f.action = "mngr_login_exec.do";
		f.submit();
	}
</script>
</head>
<body> 
<div class="page-header"> 
	<div class="header-logo"><a href="main_page.do"> NANUM </a></div>
	<div class="header-grid">
		<div class="header-sub1"> for Manager </div>
		<div class="header-sub2"> 로그인 하세요. </div>
	</div>
</div>

<div class="wrap">
<form method="post">
	<div class="grid-container">
		<div class="label-id"> Manager ID </div>
		<div class="input-id"><input type="text" id="id" name="id"></div>
		<div class="label-pw"> Password </div>
		<div class="input-pw"><input type="password" id="pwd" name="pwd"></div>
		<div class="btn-login"><button class="btn-detail" onclick="manager_login(this.form)"> Login </button></div>
	</div>
</form>
</div>
</body>
</html>