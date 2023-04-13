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
				<a href="my_speacialday.do?p_list=1"><img class="sp_list_image" src="resources/images/system/fetusname.png"></a>
				<br>태명
			</div>
			<div class="sp_list">
				<a href="my_speacialday.do?p_list=2"><img class="sp_list_image" src="resources/images/system/baby.png"></a>
				<br>탄생
			</div>
			<div class="sp_list">
				<a href="my_speacialday.do?sp_list=3"><img class="sp_list_image" src="resources/images/system/100day.png"></a>
				<br>100일
			</div>
			<div class="sp_list">
				<a href="my_speacialday.do?sp_list=4"><img class="sp_list_image" src="resources/images/system/frist birthday.jpg"></a>
				<br>돌기념
			</div>
		</div>
		
		<div class="sp_group">
			<div class="sp_list">
				<a href="my_speacialday.do?sp_list=5"><img class="sp_list_image" src="resources/images/system/cake.jpg"></a>
				<br>생일
			</div>
			<div class="sp_list">
				<a href="my_speacialday.do?sp_list=6"><img class="sp_list_image" src="resources/images/system/marry.png"></a>
				<br>결혼
			</div>
			<div class="sp_list">
				<a href="my_speacialday.do?sp_list=7"><img class="sp_list_image" src="resources/images/system/memorial.png"></a>
				<br>추모
			</div>
			<div class="sp_list">
				<a href="my_speacialday.do?sp_list=8"><img class="sp_list_image" src="resources/images/system/box.png"></a>
				<br>나만의기념일
			</div>
		</div>
	</form>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>