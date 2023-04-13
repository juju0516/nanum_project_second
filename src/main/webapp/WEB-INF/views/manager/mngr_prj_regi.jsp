<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project Registration </title>
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
.input-width {
	width: 200px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 프로젝트 등록 정보 </div>
	<div class="search-wrap gap">
		<span class="search-label"> 입력 날짜 </span>
		<input class="input-width" type="date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="input-width" type="date" value="2023-03-29">
		<select class="select blank" name="state">
			<option value=""> -- 상 태 -- </option>
			<option value="save"> 임시 저장 </option>
			<option value="req_regi"> 승인 요청 </option>
			<option value="req_cancel"> 취소 요청 </option>
			<option value="under_review"> 심사중 </option>
			<option value="approve"> 등록 승인 </option>
			<option value="reject"> 등록 거절 </option>
		</select>	
	</div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table class="width-new">
		<thead>
			<tr><th>No.</th><th>상태</th><th> 프로젝트 제목 </th><th>ID</th><th>닉네임</th>
			<th>후원</th><th>재능나눔</th><th>입력 날짜</th><th>취소요청 날짜</th>
			<th>심사 날짜</th><th>관리자</th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td>임시 저장</td>
				<td><a href="mngr_prj_regi_detail.do"> 프로젝트 9 </a></td>
				<td> AAA </td><td>A-Nick</td>
				<td> Y </td><td> N </td><td> 2023-03-30 </td><td> - </td>
				<td> - </td><td> - </td>
			</tr>
			<tr><td>2</td><td>승인 요청</td>
				<td><a href="mngr_prj_regi_detail.do"> 프로젝트 8 </a></td><td> BBB </td><td>B-Nick</td>
				<td> Y </td><td> N </td><td> 2023-03-27 </td><td> - </td>
				<td> - </td><td> - </td>
			</tr>
			<tr><td>3</td><td>취소 요청</td>
				<td><a href="mngr_prj_regi_detail.do"> 프로젝트 7 </a></td><td> CCC </td><td>C-Nick</td>
				<td> Y </td><td> Y </td><td> 2023-03-25 </td><td> 2023-03-26 </td>
				<td> - </td><td> - </td>
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