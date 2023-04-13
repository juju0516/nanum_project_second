<%@ page language="java"   contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project_List</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<style type="text/css">
		table {
			width: 1000px;
			margin: 100px auto 150px auto;
			border-spacing: 0;
			font-family: 'NanumSquareNeo';
			text-align: center;
		}
		
		tbody>tr>td {
			height: 50px;
		}
		
		#prj_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold';
			margin-top: 50px; 
		}
		
		#prj_sub_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold'; 
		}
		
		#prj_sub_title_menu1{
			width: 100px;
			height: 40px;
			display: inline-block;
			margin-top: 30px;
			margin-right: 100px;
			margin-left: 80px;
			background-color: white;
			padding-top: 15px;
		}
		
		#prj_sub_title_menu2{
			width: 100px;
			height: 40px;
			display: inline-block;
			margin-top: 30px;
			margin-right: 100px;
			margin-left: 100px;
			background-color: lightgray;
			padding-top: 15px;
		}
		
		#prj_regi_go{
			border-radius: 5px;
			width: 120px; 
			height: 50px; 
			color: white; 
			border-color:rgb(253, 95, 0); 
			background-color: rgb(253, 95, 0); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold';
			cursor: pointer;
		}
		
		#guide{
			margin-top: -100px;
			margin-bottom: 50px;
		}
		
		#btn{
			text-align: center;
			margin-bottom: 50px;
		}
		
		.prj_dropbar{
			height: 40px;
			width: 150px;
			text-align: center;
		}
	</style>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<div id="prj_title">
			<h1>프로젝트 후원</h1>
		</div>
		<div id="prj_sub_title">
			<a href="prj_donator_go.do"><div id="prj_sub_title_menu1">후원</div></a>
			<div id="prj_sub_title_menu2">재능나눔</div>
		</div>
	</header>
	
	<form method="get">
		<table border="1">
			<tbody>
				<tr>
					<td width="30%">프로젝트 이름</td>
					<td>나누미 모집</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>김나누미</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>010-0000-0000</td>
				</tr>
				<tr>
					<td>내 정보 공개</td>
					<td>
						<input type="radio" name="open" value="0" checked>공개
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="open" value="1">비공개
					</td>
				</tr>
				<tr>
					<td>응원메세지</td>
					<td>
						<p>응원</p>
						<p>메세지</p>
					</td>
				</tr>
		</table>
		
		<div id="guide">
			<jsp:include page="prj_guide.jsp" />
		</div>
		
		<div id="btn">
			<input id="prj_regi_go" type="button" value="참여하기" onclick="prj_regi_ok(this.form)">
		</div>
	</form>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>