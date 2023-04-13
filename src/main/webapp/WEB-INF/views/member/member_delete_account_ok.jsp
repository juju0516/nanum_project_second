<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete member</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/delete_account_ok.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>
	<div class="rec_delete">
		<h2 style="margin-bottom: 70px;">회원 탈퇴가 완료되었습니다</h2>


		<div class="delete_account">
			<a href="main_page.do"><button class="delete_ok_btn" onclick="">완료</button></a>
		</div>
	</div>
	</section>

	<jsp:include page="../footer.jsp" />

</body>
</html>