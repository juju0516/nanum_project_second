<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nanumi_change_list</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/nanumi_change_list.css" type="text/css"
	rel="stylesheet">
<link href="resources/css/paging.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<h1>나누미 전환 목록</h1>
		<div class="nanumi_table">
			<table>
				<tbody>
					<tr class="name_bar">
						<th>NO.&nbsp;</th>
						<th>제목&nbsp;</th>
						<th>나누미&nbsp;</th>
						<th>상태&nbsp;</th>
						<th>날짜&nbsp;</th>
					</tr>

					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5"><h2>나누미 전환 내역이 존재하지 않습니다</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr class="list">
									<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index)}</td>
									<td>[${k.p_category}]포인트 전환 신청</td>
									<td>${k.req_point}</td>
									<td>${k.p_state}</td>
									<td>${k.req_p_date.substring(0,10)}</td>
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
					<li class="disable"> &lt; </li>
				</c:when>
				<c:otherwise>
					<li><a href="member_nanumi_change_list.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- 블록안에 들어간 페이지번호들 -->
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
				<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
				<c:choose>
					<c:when test="${k == paging.nowPage}">
						<li class="now">${k}</li>
					</c:when>
					<c:otherwise>
						<li><a href="member_nanumi_change_list.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="member_nanumi_change_list.do?cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>