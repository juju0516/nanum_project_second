<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Member </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.title {
	margin-top: 50px;
	display: flex;
	flex-direction: row;
	justify-content: center;
}
.title-sub1 {
	margin: 0px 120px 0px 120px;
	font-size: 23px;
	font-family: 'NanumSquareNeoBold'; 

}
.title-sub1 a {
	text-decoration: none;
	color: black;
}
.title-sub1 a:hover {
	background-color: rgb(234, 234, 234);
	color: black;
	font-weight: bold;
	border-bottom: 2px solid black;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 
		<div class="title-sub1" style="background-color:rgb(234, 234, 234);">
			<a href="mngr_member_list.do"> 회원 정보 </a></div>
		<div class="title-sub1"><a href="mngr_manager_info.do"> 관리자 정보 </a></div>
	</div>
	<div class="search-wrap">
		<label for="search"> 검색어 입력 </label>
		<select name="search">
			<option value=""> -- 검색 항목 -- </option>
			<option value="id"> User ID </option>
			<option value="name" > 이름 </option>
		</select>
		<input type="text"> 
		<div class="btn-location"><button class="btn-detail" onclick=""> 검 색</button></div>
	</div>	
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>ID</th><th>이름</th><th>닉네임</th><th>생년월일</th>
			<th>성별</th><th>전화번호</th><th>나누미</th><th>상태</th><th>관리자</th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td><a href="mngr_member_detail.do">AAA</a></td>
				<td>name1</td><td>A-nick</td><td>2000-01-01</td>
				<td>여</td><td>010-****-1234</td><td> 40 </td><td>가입회원</td><td>admin1</td></tr>
			<tr><td>2</td><td><a href="mngr_member_detail.do">bbb</a></td>
				<td>name2</td><td>B-nick</td><td>2000-01-01</td>
				<td>남</td><td>010-****-2222</td><td> 30 </td><td>가입회원</td><td>admin1</td></tr>
			<tr><td>3</td><td><a href="mngr_member_detail.do">ccc</a></td>
				<td>name3</td><td>C-nick</td><td>2000-01-01</td>
				<td>여</td><td>010-****-3333</td><td> 20 </td><td>가입회원</td><td>admin1</td></tr>
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