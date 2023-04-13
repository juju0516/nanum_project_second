<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 정기후원 </title>
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
	margin-left: 100px;
}
.width-new {
	width: 72%;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 정기 후원 관리 </div>
	<div class="search-wrap gap">
		<span class="search-label"> 결제 날짜 </span>
		<input type="date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="date" value="2023-03-29">
		<select class="select blank" name="type">
			<option value=""> -- 정기후원 종류 -- </option>
			<option value="project"> 프로젝트 </option>
			<option value="project_aids"> 상시 프로젝트 </option>
			<option value="special"> 기념일 후원 </option>
		</select>	
	</div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table class="width-new">
		<thead>
			<tr><th>No.</th><th>후원 종류</th><th>프로젝트 이름/기념일 종류</th><th>ID</th><th>후원 나누미</th>
			<th>후원 날짜</th><th>시작 날짜</th><th>횟수</th><th>관리자</th>
			<th width="11%"></th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td>프로젝트</td><td> 프로젝트 5 </td><td> AAA </td><td>40</td>
			<td>29 일</td><td> 2023-03-29 </td><td> 0 회 </td><td> - </td>
			<td style="text-align:right">
				<button class="btn-detail-s" onclick=""> 나누미 차감 </button></td>
			</tr>
			<tr><td>2</td><td>상시</td><td> 상시 프로젝트 2 </td><td> BBB </td><td>20</td>
			<td> 25 일</td><td> 2023-03-25 </td><td> 1 회 </td><td>admin1</td>
			<td style="text-align:right">
				<button class="btn-detail-s btn-disabled" onclick="" disabled> 나누미 차감 </button></td>
			</tr>
			<tr><td>3</td><td>기념일 후원</td><td> 생일 </td><td> CCC </td><td>100</td>
			<td> 10월 27일 </td><td> 2022-03-24 </td><td> 2 회 </td><td>admin1</td>
			<td style="text-align:right">
				<button class="btn-detail-s btn-disabled" onclick="" disabled> 나누미 차감 </button></td>
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