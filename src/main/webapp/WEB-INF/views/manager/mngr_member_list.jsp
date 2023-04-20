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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	function search_exec(f) {
		f.action = "mngr_member_list.do?search=y";
		f.submit();
	}
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
		<label for="s_type"> 검색어 입력 </label>
		<select name="s_type">
			<option value=""> -- 검색 항목 -- </option>
			<option value="User ID"> User ID </option>
			<option value="이름" > 이름 </option>
		</select>
		<input type="text" name="s_word"> 
		<div class="btn-location"><button class="btn-detail" onclick="search_exec(this.form)"> 검 색</button></div>
	</div>	
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>ID</th><th>이름</th><th>닉네임</th><th>생년월일</th>
			<th>성별</th><th>전화번호</th><th>나누미</th><th>상태</th><th>관리자</th></tr>
		</thead>
		<tbody>
		<c:choose>	
			<c:when test="${empty member_list }">
				<tr>
					<td colspan="10"><h3>회원 정보 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${member_list }" varStatus="vs">
				<tr>
					<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
					<td><a href="mngr_member_detail.do?member_idx=${k.member_idx }&cPage=${paging.nowPage}">
						${k.id }</a></td>
					<td>${k.name }</td>
					<td>${k.nickname }</td>
					<td>${k.birth.substring(0,10) }</td>
					<td>${k.gender }</td>
					<td>${k.phone }</td>
					<td>${k.cur_point }</td>
					<td>${k.m_state }</td>
					<td>${k.manager_id }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
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
				<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
					<li class="disable"> &lt; </li>
				</c:when>
				<c:otherwise>
					<li><a href="mngr_member_list.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
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
						<li><a href="mngr_member_list.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="mngr_member_list.do?cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>