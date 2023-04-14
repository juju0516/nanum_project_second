<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry_onelist</title>
<script type="text/javascript">
	function member_inquiry_ok(f) {
		f.action = "member_inquiry_ok.do"
		f.submit();
	};
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/inquiry_onelist.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<h1>문의하기</h1>

	</section>
	<section>
		<form method="get">
			<table class="contents">
				<tr>
					<td>제목:</td>
					<td><input type="text" id="subject" name="subject"
						placeholder="문의 제목을 입력하세요"></td>
				</tr>
				<tr>
					<td>ID:</td>
					<c:choose>
						<c:when test="${empty mvo.nickname}">
							<td>${mvo.name}</td>
						</c:when>
						<c:otherwise>
							<td>${mvo.nickname}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>내용:</td>
					<td><textarea rows="20" cols="40" name="content" id="content">
					</textarea></td>
				</tr>
			</table>
			<div class="inquiry">
				<input type="button" value="등록" class="inq_btn"
					onclick="member_inquiry_ok(this.form)">
			</div>
		</form>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>