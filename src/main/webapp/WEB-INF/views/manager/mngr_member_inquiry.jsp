<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Member Inquiry </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 신규 문의 </div>
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>ID</th><th>닉네임</th><th>작성일</th><th width="39%">제 목</th>
			<th width="5%"></th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td>AAA</td><td>A-Nick</td><td>2023-03-31</td>
				<td><a href="mngr_member_inquiry_detail.do">문의합니다.</a></td>
				<td><a href=""><img src="resources/images/system/arrow-down2.png" width="16px"></a></td>
			</tr>
			<tr><td>2</td><td>BBB</td><td>B-Nick</td><td>2023-03-30</td>
				<td><a href="mngr_member_inquiry_detail.do">문의합니다.</a></td>
				<td><a href=""><img src="resources/images/system/arrow-down2.png" width="16px"></a></td>
			</tr>
			<tr><td>3</td><td>CCC</td><td>C-Nick</td><td>2023-03-10</td>
				<td><a href="mngr_member_inquiry_detail.do">문의합니다.</a></td>
				<td><a href=""><img src="resources/images/system/arrow-down2.png" width="16px"></a></td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<!-- 페이지기법 -->
	<section>
		<ol class="paging">
			<!-- 이전 -->
			<c:choose>
				<c:when test="true">
					<li class="disable"> &lt; </li>
				</c:when>
				<c:otherwise>
					<li><a href=""> &lt; </a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- 블록안에 들어간 페이지번호들 -->
			<c:forEach begin="1" end="4" step="1" var="k">
				<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
				<c:choose>
					<c:when test="false">
						<li class="now">2</li>
					</c:when>
					<c:otherwise>
						<li><a href="">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="0">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href=""> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>