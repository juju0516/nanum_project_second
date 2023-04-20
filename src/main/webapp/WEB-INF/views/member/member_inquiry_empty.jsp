<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry_list</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/inquiry_empty.css" type="text/css" rel="stylesheet">
</head>
<body>
		<jsp:include page="../header.jsp" />

	<section>
		<h1>문의 이력</h1>
		<div class="inquiry">
			<a href="#"><button class="inq_btn" onclick="">문의하기</button></a>
		</div>
	</section>
	<section>
		<h3>남기신 문의 이력이 존재하지 않습니다</h3>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>