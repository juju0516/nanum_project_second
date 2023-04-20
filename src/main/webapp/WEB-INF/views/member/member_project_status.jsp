<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project_status</title>
<script type="text/javascript">
	function delete_prj_go(f) {
		alert("프로젝트를 삭제하시겠습니까?");
		location.href = "member_delete_reason.do";
	}
	/* function delete_prj_go(f) {
		alert("이미 등록된 프로젝트는 삭제가 불가능합니다.");
	} */
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/project_status.css" type="text/css"
	rel="stylesheet">
<link href="resources/css/paging.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<h1>등록 프로젝트</h1>
		<div class="prj_table">
			<table>
				<tbody>
					<tr class="name_bar">
						<th>NO.&nbsp;</th>
						<th>제목&nbsp;</th>
						<th>날짜&nbsp;</th>
						<th>상태&nbsp;</th>
						<th class="">삭제&nbsp;</th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5"><h2>등록 프로젝트 내역이 존재하지 않습니다</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr class="list">
									<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index)}</td>
									<td>${k.prj_title}</td>
									<td>${k.submit_date.substring(0,10)}</td>
									<td>${k.p_r_state}</td>
									<td><input type="image"
										src="resources/images/system/trash.png" style="width: 30px;"
										onclick="member_delete_prj_go(this.form)" name="delete"></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</section>
	<!-- 페이지기법 -->
	<section>
		<ol class="paging">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
					<li class="disable">&lt;</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="member_project_status.do?cPage=${paging.beginBlock-paging.pagePerBlock}">
							&lt; </a></li>
				</c:otherwise>
			</c:choose>

			<!-- 블록안에 들어간 페이지번호들 -->
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
				step="1" var="k">
				<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
				<c:choose>
					<c:when test="${k == paging.nowPage}">
						<li class="now">${k}</li>
					</c:when>
					<c:otherwise>
						<li><a href="member_project_status.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 -->
			<c:choose>
				<c:when test="${paging.endBlock >= paging.totalPage}">
					<li class="disable">&gt;</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="member_project_status.do?cPage=${paging.beginBlock+paging.pagePerBlock}">
							&gt;</a></li>
				</c:otherwise>
			</c:choose>
		</ol>
	</section>
	<jsp:include page="../footer.jsp" />

</body>
</html>