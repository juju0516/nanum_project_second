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
		
		#aids_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold'; 
		}
		
		#aids_sub_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold'; 
		}
		
		#aids_sub_title_menu1{
			width: 100px;
			height: 40px;
			display: inline-block;
			margin-top: 30px;
			margin-right: 100px;
			margin-left: 100px;
			background-color: lightgray;
			padding-top: 15px;
		}
		
		#aids_sub_title_menu2{
			width: 100px;
			height: 40px;
			display: inline-block;
			margin-top: 30px;
			margin-right: 100px;
			margin-left: 100px;
			background-color: white;
			padding-top: 15px;
		}
		
		#aids_regi_go{
			border-radius: 5px;
			width: 120px; 
			height: 50px; 
			color: white; 
			border-color:rgb(253, 95, 0); 
			background-color: rgb(253, 95, 0); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold'; 
		}
		
		#guide{
			margin-top: -100px;
			margin-bottom: 50px;
		}
		
		#btn{
			text-align: center;
			margin-bottom: 50px;
		}
		
		.dropbar{
			height: 40px;
			width: 150px;
			text-align: center;
		}
	</style>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<div id="aids_title">
			<h1>지원요청 후원</h1>
		</div>
		<div id="aids_sub_title">
			<div id="aids_sub_title_menu1">정기후원</div>
			<a href="aids_dnt_donator_go.do"><div id="aids_sub_title_menu2">일시후원</div></a>
		</div>
	</header>
	
	<form method="get">
		<table border="1">
			<tbody>
				<tr>
					<td>프로젝트 이름</td>
					<td>나누미 모집</td>
				</tr>
				<tr>
					<td>결재금액</td>
					<td>
						<select class="dropbar">
							<option value="1000">1000nanumi</option>
							<option value="2000">2000nanumi</option>
							<option value="3000">3000nanumi</option>
							<option value="4000">4000nanumi</option>
							<option value="5000">5000nanumi</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>결재일</td>
					<td>
						<select class="dropbar">
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
							<option value="6">6일</option>
							<option value="7">7일</option>
							<option value="8">8일</option>
							<option value="9">9일</option>
							<option value="10">10일</option>
							<option value="11">11일</option>
							<option value="12">12일</option>
							<option value="13">13일</option>
							<option value="14">14일</option>
							<option value="15">15일</option>
							<option value="16">16일</option>
							<option value="17">17일</option>
							<option value="18">18일</option>
							<option value="19">19일</option>
							<option value="20">20일</option>
							<option value="21">21일</option>
							<option value="22">22일</option>
							<option value="23">23일</option>
							<option value="24">24일</option>
							<option value="25">25일</option>
							<option value="26">26일</option>
							<option value="27">27일</option>
							<option value="28">28일</option>
							<option value="29">29일</option>
							<option value="30">30일</option>
						</select>
					</td>
				</tr>
		</table>
		
		<div id="guide">
			<jsp:include page="aids_guide.jsp" />
		</div>
		
		<div id="btn">
			<input id="aids_regi_go" type="button" value="신청하기" onclick="aids_regi_ok(this.form)">
		</div>
	</form>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>