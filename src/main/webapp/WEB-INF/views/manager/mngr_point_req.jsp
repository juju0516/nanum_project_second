<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Nanumi Request </title>
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
	padding-top: 20px;
}
.blank {
	margin-left: 100px;
}
.width-new {
	width: 73%;
}
.input-width {
	width: 157px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 나누미 전환 관리 </div>
	<div class="search-row gap">
		<label for="search"> 검색어 </label>
		<select name="search">
			<option value=""> -- 검색 항목 -- </option>
			<option value="id"> User ID </option>
			<option value="name" > 이름 </option>
		</select>
		<input type="text"> 
		
		<select class="select blank" name="state">
			<option value=""> -- 상 태 -- </option>
			<option value="chg_req"> 나누미 전환 신청 </option>
			<option value="approve"> 나누미 전환 승인 </option>
			<option value="reject"> 나누미 전환 거절 </option>
		</select>		
	</div>
	<div class="search-row"><span class="search-label"> 날 &nbsp;&nbsp; 짜 </span>
		<input class="input-width" type="date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="input-width" type="date" value="2023-03-29"></div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table class="width-new">
		<thead>
			<tr><th>No.</th><th>ID</th><th>현재 나누미</th><th>신청자 이름</th><th>요청 나누미</th>
			<th>요청 금액</th><th>요청 날짜</th><th>상태</th><th>승인 날짜</th><th>관리자</th>
			<th width="15.5%"></th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td>AAA</td><td> 40 </td><td> Name1 </td><td>100</td>
			<td>50,000 원</td><td> 2023-03-29 </td><td> 전환 신청</td><td> - </td><td> - </td>
			<td style="text-align:right"><button class="btn-detail-ss" onclick=""> 승 인 </button>  &nbsp;
				<button class="btn-detail-ss" onclick=""> 거 절 </button></td>
			</tr>
			<tr><td>2</td><td>BBB</td><td> 20 </td><td> Name2 </td><td>50</td>
			<td>25,000 원</td><td> 2023-03-25 </td><td> 승인 </td><td> 2023-03-26 </td><td>admin1</td>
			<td style="text-align:right"><button class="btn-detail-ss btn-disabled" onclick="" disabled> 승 인 </button>  &nbsp;
				<button class="btn-detail-ss btn-disabled" onclick="" disabled> 거 절 </button></td>
			</tr>
			<tr><td>3</td><td>CCC</td><td> 100 </td><td> Name3 </td><td>100</td>
			<td>50,000 원</td><td> 2023-03-24 </td><td> 거절 </td><td> 2023-03-25 </td><td>admin1</td>
			<td style="text-align:right"><button class="btn-detail-ss btn-disabled" onclick="" disabled> 승 인 </button>  &nbsp;
				<button class="btn-detail-ss btn-disabled" onclick="" disabled> 거 절 </button></td>
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