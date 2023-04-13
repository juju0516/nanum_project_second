<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람없음</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style type="text/css">
	html,body{
		height: 100%;
	}
	
	body {
		color: black;
		display: flex;
	  	flex-direction: column; 
	  	font-family: 'NanumSquareNeo';
	}
	
	footer{
		text-align: left;
		text-decoration: none;
	}
	
	#No_alarm{
		margin-top: 400px;
		margin-bottom: 400px;
		text-align: center;
		font-size: 30px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<jsp:include page="alram_top.jsp" />
	</header>
	
	<div id="No_alarm">등록된 알람이 없습니다.</div>

	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>