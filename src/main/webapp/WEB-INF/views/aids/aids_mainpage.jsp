<%@ page language="java"   contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>special_List</title>
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
			margin-top: 50px;
		}
		
		#aids_regi{
			border-radius: 5px;
			width: 120px; 
			height: 50px; 
			color: white; 
			border-color: rgb(0, 87, 146); 
			background-color: rgb(0, 87, 146); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
			margin-top: -10px;
		}
		
		#aids_donator{
			border-radius: 5px;
			width: 120px; 
			height: 50px; 
			color: white; 
			border-color: rgb(253, 95, 0); 
			background-color: rgb(253, 95, 0); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
		}
		
		#btn{
			text-align: center;
			margin-bottom: 50px;
		}
		
		.aids_explanation{
			font-size: 18px; 
			font-family: 'NanumSquareNeoBold';
			display: inline-block
		}
	</style>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<div id="aids_title">
			<h1>지원요청</h1>
		</div>
		<div style="text-align: center; margin-bottom: 50px;">
			<h3>지원 요청은 선천적, 후천적 장애인들을 위한 상시 프로젝트로 신청을 받아 후원 금액을 통해 보조기구를 후원하는 방식입니다.</h3>
		</div>
	</header>
	
	<div style="text-align: center; margin-bottom: 50px;">
		<div class="aids_explanation"><img src="resources/images/system/chair.png" style="width:300px; margin-right: 190px;">
			<p style="margin: 0px; margin-left: -190px;">지체 장애인을 위한 지원 프로젝트</p>
			<p style="margin: 0px; margin-left: -190px;">2023. 04. 01 ~ 2023. 07. 31</p>
			<p style="margin: 0px; margin-left: -190px;">지원인원 5명</p>
		</div>
		<div class="aids_explanation">
			<p>첨단보조기구를 통해 가족과의 의사소통이 가능해지고, 장애로 인해 접었던</p>
			<p>꿈을 다시 찾는 등 사례는 장애인의 일상생활뿐만 아니라 학업, 사회활동 등</p>
			<p>다양한 영역에서 장애로 인한 신체적 제약을 뛰어넘게 합니다.</p>
			<p>성장가능성이 높은 장애인을 선발하여 장애의 벽을 뛰어넘어 자신의 역량을</p>
			<p>펼치고 꿈을 향해 달려갈 수 있도록 나눔을 실천하면</p>
			<p>우리 사회에 큰 변화와 선한 영향력을 만들 수 있습니다.</p>
			<p>　</p>
			<p>　</p>
		</div>
	</div>
	
	<jsp:include page="aids_guide2.jsp" />
	
	<div id="btn">
		<a href="aids_regi.do"><button id="aids_regi">지원하기</button></a>
		<a href="aids_detail_list.do"><button id="aids_donator">상세보기</button></a>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>