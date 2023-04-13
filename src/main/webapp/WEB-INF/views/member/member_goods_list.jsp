<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goods_list</title>
<script type="text/javascript">
	function delete_order_go(f) {
		alert("주문을 취소하시겠습니까?");
		location.href = "member_goods_list.do";
	}
	/* function delete_prj_go(f) {
		alert("배송이 시작된 상품은 주문 취소가 불가능합니다.");
	} */
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/goods_list.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>
		<h1>구매목록</h1>
		<div class="nanumi_table">
			<table>
				<tbody>
					<tr class="name_bar">
						<th>NO.&nbsp;</th>
						<th>제목&nbsp;</th>
						<th>나누미&nbsp;</th>
						<th>상태&nbsp;</th>
						<th>날짜&nbsp;</th>
						<th class="">주문 취소&nbsp;</th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="6"><h2>나누미 전환 내역이 존재하지 않습니다</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr class="list">
									<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index)}</td>
									<td>[종류]상품이름&nbsp;&nbsp;</td>
									<td>차감 포인트&nbsp;&nbsp;</td>
									<td>상태(상품준비중/배송중/완료)&nbsp;&nbsp;</td>
									<td>날짜&nbsp;&nbsp;</td>
									<td><input type="image"
										src="resources/images/system/trash.png" style="width: 30px;"
										onclick="delete_order_go(this.form)" name="delete"></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>