<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 소개, 공지 사항, 새 소식 </title>
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
	width: 70%;
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
	<div class="title"> 소개, 공지 사항, 새 소식 </div>
	<div class="search-wrap gap">
		<span class="search-label"> 등록 날짜 </span>
		<input class="input-width" type="date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="input-width" type="date" value="2023-03-29">
		<select class="select blank" name="category">
			<option value=""> -- 카테고리 -- </option>
			<option value="save"> 사이트 소개 </option>
			<option value="req_regi"> 공지 사항 </option>
			<option value="req_cancel"> 새 소식 </option>
		</select>	
	</div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table class="width-new">
		<thead>
			<tr><th>No.</th><th>관리자 ID</th><th>카테고리</th><th> 제목 </th><th>등록 날짜</th>
			<th>조회수</th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td>admin1</td><td>사이트 소개</td>
				<td><a href="mngr_story_detail.do">상시 프로젝트 안내</a></td><td>2023-01-30</td>
				<td>400</td>
			</tr>
			<tr><td>2</td><td>admin1</td><td>공지 사항</td>
				<td><a href="mngr_story_detail.do">굿즈 판매 마감 안내</a></td><td>2023-01-01</td>
				<td>400</td>
			</tr>
			<tr><td>3</td><td>admin1</td><td>새 소식</td>
				<td><a href="mngr_story_detail.do">완료 프로젝트 결과</a></td><td>2023-01-01</td>
				<td>400</td>
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