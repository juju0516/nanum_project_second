<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_reason</title>
<script type="text/javascript">
	function delete_prj_ok(f) {
		alert("삭제 신청을 완료하였습니다.");
	}
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/delete_reason.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>
		<h1>프로젝트 삭제 사유</h1>
		
	</section>
	<section>
		<table class="contents">
					<td>ID:</td>
					<td>aaaaaaaaaa</td>
				</tr>
				<tr>
				<td>취소 사유: </td>
				<td>
					<textarea rows="20" cols="40">
					</textarea>
				</td>
				</tr>
		</table>
		<div class="delete">
			<a href="member_project_status.do"><button class="delete_btn" onclick="delete_prj_ok(this.form)">삭제신청</button></a>
		</div>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>