<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 보조기구 신청 내역</title>
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
	<div class="title"> 보조기구 신청 내역 </div>
	<div class="search-row gap">
		<label for="search"> 검색어 &nbsp;&nbsp;&nbsp;&nbsp; </label>
		<select name="search">
			<option value=""> -- 검색 항목 -- </option>
			<option value="id"> 신청자 ID </option>
			<option value="title" > 제목 </option>
		</select>
		<input type="text"> 
		
		<select class="select blank" name="state">
			<option value=""> -- 상 태 -- </option>
			<option value="request"> 신청 </option>
			<option value="under_review"> 심사중 </option>
			<option value="approve"> 승인 </option>
			<option value="reject"> 거절 </option>
		</select>		
	</div>
	<div class="search-row"><span class="search-label"> 신청 날짜 </span>
		<input class="input-width" type="date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="input-width" type="date" value="2023-03-29"></div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>신청자 ID</th><th>이름</th><th>상태</th><th>제목</th>
			<th>신청 날짜</th><th>관리자</th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td> AAA </td><td> 에*이</td><td>신청</td>
				<td><a href="mngr_aids_detail.do">보조기구 신청합니다.</a></td>
			<td>2023-03-27</td><td> - </td>
			</tr>
			<tr><td>2</td><td> BBB </td><td> 비*비</td><td>승인</td>
				<td><a href="mngr_aids_detail.do">보조기구 신청</a></td>
				<td>2023-03-26</td><td> admin1 </td>
			</tr>
			<tr><td>3</td><td> CCC </td><td> 씨*씨</td><td>거절</td>
				<td><a href="mngr_aids_detail.do">보조기구 신청</a></td>
				<td>2023-03-25</td><td> admin1 </td>
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