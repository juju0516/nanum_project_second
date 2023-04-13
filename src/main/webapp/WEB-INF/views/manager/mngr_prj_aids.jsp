<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 상시 프로젝트 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.search-label-1 {
	margin: 10px 45px 0px 0px;
	font-family: 'NanumSquareNeo';
	font-size: 16px;
	color: #444;	
}
.gap {
	margin-bottom: 50px;
}
.blank {
	margin-right: 100px;
}
.input-width {
	width: 150px;
	margin-right: 18px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 상시 프로젝트 정보 </div>
	<div class="search-wrap gap">
		<!-- <label for="range"> 검색어 </label> -->
		<select class="select" name="range">
			<option value=""> -- 검색 범위 -- </option>
			<option value="title_content"> 제목 + 내용 </option>
			<option value="title"> 제목 </option>
			<option value="content"> 내용 </option>
		</select>	
		<input class="blank" type="text"> 
		<select class="select" name="date-type">
			<option value=""> -- 선 택 -- </option>
			<option value="begin-date"> 시작 날짜 </option>
			<option value="end-date"> 종료 날짜 </option>
		</select>	
		<input class="input-width" type="date" value="2023-03-29"> ~ &nbsp;&nbsp;
		<input class="input-width" type="date" value="2023-03-29">		
	</div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>구분</th><th>프로젝트 제목</th><th>ID</th><th>목표금액</th>
			<th>후원 금액</th><th>시작 날짜</th><th>종료 날짜</th><th>관리자</th>
			</tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td> 상시 </td>
			<td><a href="mngr_prj_aids_detail.do">프로젝트 3 </a></td>
			<td> AAA </td><td>10,000 나누미</td>
			<td> 100 나누미 </td><td> 2023-03-10 </td><td> 2023-05-10 </td><td> admin1 </td>
			</tr>
			<tr><td>2</td><td> 상시-내림 </td>
			<td><a href="mngr_prj_aids_detail.do">프로젝트 2 </a></td>
			<td> BBB </td><td>5,000 나누미</td>
			<td> 5,000 나누미 </td><td> 2023-02-01 </td><td> 2023-03-01 </td><td> admin1 </td>
			</tr>
			<tr><td>3</td><td> 상시-내림 </td>
			<td><a href="mngr_prj_aids_detail.do">프로젝트 1 </a></td>
			<td> CCC </td><td>5,000 나누미</td>
			<td> 5,000 나누미 </td><td> 2023-01-01 </td><td> 2023-02-01 </td><td> admin1 </td>
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