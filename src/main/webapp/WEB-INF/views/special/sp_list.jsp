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
		#sp_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold';
			margin-top: 50px;
		}
	
		.sp_group{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold';
			margin-bottom: 200px;
			white-space: nowrap;
		}
		
		.sp_list{
			display: inline-block;
		}
		
		 .sp_list_image{
			width: 300px;
			height: 300px;
		}
		
		.sp_name{
			margin-left: -20px;
		}
	</style>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<div id="sp_title">
			<h1>기념일 후원</h1>
		</div>
	</header>
	
	<form action="get">
		<div class="sp_group">
			<div class="sp_list">
				<a href="my_speacialday1.do"><img class="sp_list_image" src="resources/images/system/fetusname.png"></a>
				<br>
				<div class="sp_name">태명</div>
			</div>
			<div class="sp_list">
				<a href="my_speacialday2.do"><img class="sp_list_image" src="resources/images/system/baby.png"></a>
				<br>
				<div class="sp_name">탄생</div>
			</div>
			<div class="sp_list">
				<a href="my_speacialday3.do"><img class="sp_list_image" src="resources/images/system/100day.png"></a>
				<br>
				<div class="sp_name">100일</div>
			</div>
			<div class="sp_list">
				<a href="my_speacialday4.do"><img class="sp_list_image" src="resources/images/system/frist birthday.jpg"></a>
				<br>
				<div class="sp_name">돌기념</div>
			</div>
		</div>
		
		<div class="sp_group">
			<div class="sp_list">
				<a href="my_speacialday5.do"><img class="sp_list_image" src="resources/images/system/cake.jpg"></a>
				<br>
				<div class="sp_name">생일</div>
			</div>
			<div class="sp_list">
				<a href="my_speacialday6.do"><img class="sp_list_image" src="resources/images/system/marry.png"></a>
				<br>
				<div class="sp_name">결혼</div>
			</div>
			<div class="sp_list">
				<a href="my_speacialday7.do"><img class="sp_list_image" src="resources/images/system/memorial.png"></a>
				<br>
				<div class="sp_name">추모</div>
			</div>
			<div class="sp_list">
				<a href="my_speacialday8.do"><img class="sp_list_image" src="resources/images/system/box.png"></a>
				<br>
				<div class="sp_name">나만의기념일</div>
			</div>
		</div>
	</form>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>