<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Alarm </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<style type="text/css">
.grid-wrap {
	display: flex;
	justify-content: center;
}
.alarm-grid {
	display: grid;
	grid-template-columns: 400px 250px;
	grid-template-rows: 60px 60px 60px 60px 60px 60px;
	row-gap: 25px;
	column-gap: 0px;
	margin-top: 0px;
	font-size: 19px;
	font-family: 'NanumSquareNeoBold'; 
}
.alarm-type1 {
	grid-column: 1 / 2; 
	grid-row: 1 / 2;
	padding: 20px 0px 10px 100px;
	background-color: rgb(234, 234, 234);
	
}
.alarm-value1 {
	grid-column: 2 / 3; 
	grid-row: 1 / 2;
	padding: 20px 0px 10px 50px;
	background-color: rgb(234, 234, 234);
}
.alarm-type2 {
	grid-column: 1 / 2; 
	grid-row: 2 / 3;
	padding: 20px 0px 10px 100px;
	background-color: rgb(234, 234, 234);
	
}
.alarm-value2 {
	grid-column: 2 / 3; 
	grid-row: 2 / 3;
	padding: 20px 0px 10px 50px;
	background-color: rgb(234, 234, 234);
}
.alarm-type3 {
	grid-column: 1 / 2; 
	grid-row: 3 / 4;
	padding: 20px 0px 10px 100px;
	background-color: rgb(234, 234, 234);
	
}
.alarm-value3 {
	grid-column: 2 / 3; 
	grid-row: 3 / 4;
	padding: 20px 0px 10px 50px;
	background-color: rgb(234, 234, 234);
}
.alarm-type4 {
	grid-column: 1 / 2; 
	grid-row: 4 / 5;
	padding: 20px 0px 10px 100px;
	background-color: rgb(234, 234, 234);
	
}
.alarm-value4 {
	grid-column: 2 / 3; 
	grid-row: 4 / 5;
	padding: 20px 0px 10px 50px;
	background-color: rgb(234, 234, 234);
}
.alarm-type5 {
	grid-column: 1 / 2; 
	grid-row: 5 / 6;
	padding: 20px 0px 10px 100px;
	background-color: rgb(234, 234, 234);
	
}
.alarm-value5 {
	grid-column: 2 / 3; 
	grid-row: 5 / 6;
	padding: 20px 0px 10px 50px;
	background-color: rgb(234, 234, 234);
}
.alarm-type6 {
	grid-column: 1 / 2; 
	grid-row: 6 / 7;
	padding: 20px 0px 10px 100px;
	background-color: rgb(234, 234, 234);
	
}
.alarm-value6 {
	grid-column: 2 / 3; 
	grid-row: 6 / 7;
	padding: 20px 0px 10px 50px;
	background-color: rgb(234, 234, 234);
}
.alarm-type1 a, .alarm-type2 a, .alarm-type3 a, 
.alarm-type4 a, .alarm-type5 a, .alarm-type6 a {
	text-decoration: none;
	color: black;
}
.alarm-type1 a:hover, .alarm-type2 a:hover, .alarm-type3 a:hover, 
.alarm-type4 a:hover, .alarm-type5 a:hover, .alarm-type6 a:hover {
	border-bottom: 2px solid #00000080;
}

</style>
</head>
<body>
	<jsp:include page="mngr_header_menu.jsp" />
	<section>
		<div class="title"> 신규 알림 </div>
		<div class="grid-wrap">
		<div class="alarm-grid">
			<div class="alarm-type1"><a href="mngr_point_Req.do"> 포인트 전환 신청 </a></div>
			<div class="alarm-value1"> 00 건 </div>
			<div class="alarm-type2"><a href="mngr_prj_regi.do"> 신규 프로젝트 신청 </a></div>
			<div class="alarm-value2"> 00 건 </div>
			<div class="alarm-type3"><a href="mngr_goods_sale.do"> 굿즈 판매 </a></div>
			<div class="alarm-value3"> 00 건 </div>
			<div class="alarm-type4"><a href="mngr_goods_sale.do"> 굿즈 주문 취소 </a></div>
			<div class="alarm-value4"> 00 건 </div>
			<div class="alarm-type5"><a href="mngr_aids_list.do"> 보조 기구 신청 </a></div>
			<div class="alarm-value5"> 00 건 </div>
			<div class="alarm-type6"><a href="mngr_member_inquiry.do"> 신규 문의글 </a></div>
			<div class="alarm-value6"> 00 건 </div>
		</div>
		</div>
	</section>
</body>
</html>