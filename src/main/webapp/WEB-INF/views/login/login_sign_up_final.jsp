<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign up final</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/sign_up_final.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>
		<h2 style="text-align: center; margin-top: 60px; margin-left: 40px">
			회원 가입</h2>

		<div class="progressbar-wrapper">
			<ul class="progressbar">
				<li class="active">회원 정보 입력</li>
				<li class="active">추가 정보 입력</li>
				<li class="active">회원 가입 완료</li>
			</ul>
		</div>
		<div class="text">
			<h3 style="margin-left: 40px">회원가입이 완료되었습니다</h3>
			<h3 style="margin-left: 40px">나누미와 함께해 주셔서 감사합니다!</h3>
		</div>
		<c:choose>
		<c:when test="${login=='ok'}">
		<div class="main">
			<a href="main_page.do"><button class="go_main" onclick="">메인으로</button></a>
		</div>
		</c:when>
		</c:choose>

	</section>

	<jsp:include page="../footer.jsp" />
</body>
</html>