<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiry_list</title>
<script type="text/javascript">
	function member_inquiry_onelist(f) {
		f.action = "member_inquiry_onelist.do"
		f.submit();
	};

	function delete_go(f) {
		f.action = "member_inquiry_delete.do"
		f.submit();
		alert("문의가 삭제됩니다.");
	};
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/inquiry.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<h1>문의 이력</h1>
		<form>
			<div class="inquiry">
				<input type="button" name=inquary_btn class="inq_btn"
					onclick="member_inquiry_onelist(this.form)" value="문의하기">
			</div>
		</form>
		<form method="get">
			<div class="nanumi_table">
				<table>
					<tbody>
						<tr class="name_bar">
							<th>NO.&nbsp;</th>
							<th>제목&nbsp;</th>
							<th>날짜&nbsp;</th>
							<th>답변 상태&nbsp;</th>
							<th>삭제&nbsp;</th>
						</tr>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="5"><h2>문의 이력이 존재하지 않습니다</h2></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${list}" varStatus="vs">
									<tr class="list">
										<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index)}</td>
										<td><a
											href="member_inquiry_onelist_ans.do?inquiry_idx=${k.inquiry_idx}&cPage=${paging.nowPage}">
												${k.inq_title} <input type="hidden" name="inquiry_idx"
												value="${k.inquiry_idx}">
										</a></td>
										<td>${k.inq_date.substring(0,10)}</td>
										<td>${k.inq_state}</td>
										<td><input type="image"
											src="resources/images/system/trash.png" style="width: 30px;"
											onclick="delete_go(this.form)"></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</form>
	</section>
	<section>
		<form>
			<div class="contents">
				<input type="button" class="moreview" value="더보기" onclick="">
			</div>
		</form>

	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>