<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Project </title>
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
	width: 73%;
}
.input-width {
	width: 180px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	function search_exec(f) {
		// 검색 기간
		var b_date = $("#b-date").val();
		var e_date = $('#e-date').val();
	
		if(e_date != '' && b_date > e_date) {
			alert("검색 시작 날짜가 종료 날짜보다 늦을 수 없습니다.");
			return;
		}
	
		// 시작날자, 종료날짜로 검색	
		var s_type = $("#date-type option:selected").val();
		
		// prj_category
		var s_category = $("#prj-type option:selected").val();
	
		f.action = "mngr_prj_list.do?search=y&s_type=" + s_type + 
				   "&b_date=" + b_date + "&e_date=" + e_date + "&s_category=" + s_category;
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 프로젝트 정보 </div>
	<div class="search-wrap gap">
		<select class="select" id="date-type">
			<option value=""> -- 선 택 -- </option>
			<option value="시작날짜"> 시작 날짜 </option>
			<option value="종료날짜"> 종료 날짜 </option>
		</select>	
		<input class="input-width" type="date" id="b-date"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="input-width" type="date" id="e-date">
		<select class="select blank" id="prj-type">
			<option value=""> -- 프로젝트 구분 -- </option>
			<option value="진행중"> 진행중 </option>
			<option value="새로 시작된"> 새로 시작된 </option>
			<option value="오픈 예정"> 오픈 예정 </option>
			<option value="완료"> 완료 </option>
			<option value="내림"> 내림 </option>
		</select>	
	</div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick="search_exec(this.form)"> 검 색</button></div>	
	<div class="table-wrap">
	<table class="width-new">
		<thead>
			<tr><th>No.</th><th>구분</th><th> 프로젝트 제목 </th><th>ID</th><th>닉네임</th>
			<th>후원</th><th>후원 금액</th><th>재능나눔</th><th>지원자수</th><th>시작 날짜</th>
			<th>종료 날짜</th><th>관리자</th>
			</tr>
		</thead>
		<tbody>	
		<c:choose>
			<c:when test="${empty prj_list}">
				<tr>
					<td colspan="12"><h3>프로젝트 정보 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${prj_list }" varStatus="vs">
					<tr>
					<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
					<td>${k.prj_category}</td>
					<td><a href="mngr_prj_detail.do?project_idx=${k.project_idx }&cPage=${paging.nowPage}"> 
						${k.prj_title} </a></td>
					<td>${k.id }</td>
					<td>${k.nickname }</td>
					<td>${k.dnt_flag}</td>
					<td>${k.cur_point}</td>
					<td>${k.vlt_flag}</td>
					<td>${k.cur_num_people}</td>
					<td>${k.prj_begin_date }</td>
					<td>${k.prj_end_date }</td>
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
					<li><a href="mngr_prj_list.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
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
						<li><a href="mngr_prj_list.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="mngr_prj_list.do?cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>