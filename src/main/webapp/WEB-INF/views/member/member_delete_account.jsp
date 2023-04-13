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
<link href="resources/css/delete_account.css" type="text/css"
	rel="stylesheet">
</head>
<body>
		<jsp:include page="../header.jsp" />

	<section>
	<div class="rec_delete">
		<h2 style="margin-top: 140px;">ㅁㅁㅁ 님 정말</h2>
		<h2 style="margin-bottom: 70px;">회원 탈퇴를 진행하시겠습니까?</h2>

		<div class="account_pw">
			<table>
				<tr>
					<td>비밀번호:</td>
					<td><input type="text" id="user" placeholder="사용중인 PW를 입력하세요"></td>
				</tr>
			</table>
		</div>

		<div class="delete_account">
			<a href="member_delete_account_ok.do"><button class="delete_ok_btn" onclick="">탈퇴</button></a>
		</div>
	</div>
	</section>

	<jsp:include page="../footer.jsp" />

</body>
</html>