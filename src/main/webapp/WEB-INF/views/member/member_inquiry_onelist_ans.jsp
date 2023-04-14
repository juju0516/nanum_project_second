<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry_onelist_ans</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/inquiry_onelist_ans.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<h1>문의하기</h1>

	</section>
	<section>
		<table class="contents">
			<tr>
				<td>ID:</td>
				<td><c:choose>
						<c:when test="${empty mvo.nickname}">
							${mvo.name}
						</c:when>
						<c:otherwise>
							${mvo.nickname}
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td>${iqvo.inq_content}</td>
			</tr>
			<tr>

			</tr>
		</table>
		<table class="ans">
			<tr>
				<td>답변:</td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><textarea rows="20" cols="40">
					</textarea></td>
			</tr>
		</table>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>
