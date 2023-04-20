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
.btn-wrap {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	width: 75%;
	margin-bottom: 20px;
}
.btn-gap {
	margin-left: 30px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	function project_aids_write(f) {
		f.action = "mngr_prj_aids_write.do";
		f.submit();
	}

	function search_exec(f) {
		var s_range = $('#range option:selected').val();
		var s_word = $('#s-word').val();
		
		// 검색 기간
		var b_date = $("#b-date").val();
		var e_date = $('#e-date').val();
	
		if(e_date != '' && b_date > e_date) {
			alert("검색 시작 날짜가 종료 날짜보다 늦을 수 없습니다.");
			return;
		}
	
		// 시작날자, 종료날짜로 검색	
		var s_type = $("#date-type option:selected").val();
		
		f.action = "mngr_prj_aids.do?search=y&s_range=" + s_range + 
				   "&s_word=" + s_word + "&s_type=" + s_type +  
		   		   "&b_date=" + b_date + "&e_date=" + e_date;
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 상시 프로젝트 정보 </div>
	<div class="search-wrap gap">
		<select class="select" id="range" name="s_range">
			<option value=""> -- 검색 범위 -- </option>
			<option value="제목 %2b 내용"> 제목 + 내용 </option>
			<option value="제목"> 제목 </option>
			<option value="내용"> 내용 </option>
		</select>	
		<input class="blank" type="text" id="s-word" name="s_word"> 
		<select class="select" id="date-type" name="s_type">
			<option value=""> -- 선 택 -- </option>
			<option value="시작 날짜"> 시작 날짜 </option>
			<option value="종료 날짜"> 종료 날짜 </option>
		</select>	
		<input class="input-width" type="date" id="b-date" name="b_date"> ~ &nbsp;&nbsp;
		<input class="input-width" type="date" id="e-date" name="e_date">		
	</div>
	<div class="btn-wrap">
		<button class="btn-detail" onclick="project_aids_write(this.form)"> 생 성</button>
		<button class="btn-detail btn-gap" onclick="search_exec(this.form)"> 검 색</button>
	</div>	
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>구분</th><th>프로젝트 제목</th><th>ID</th><th>목표금액</th>
			<th>후원 금액</th><th>시작 날짜</th><th>종료 날짜</th><th>관리자</th>
			</tr>
		</thead>
		<tbody>	
		<c:choose>
			<c:when test="${empty prj_aids}">
				<tr>
					<td colspan="12"><h3>상시 프로젝트 정보 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${prj_aids }" varStatus="vs">
					<tr>
					<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
					<td> ${k.prj_category} </td>
					<td><a href="mngr_prj_aids_detail.do?project_idx=${k.project_idx }&a_cPage=${paging.nowPage}">
						${k.prj_title} </a></td>
					<td> ${k.id } </td>
					<td> ${k.goal_point } 나누미</td>
					<td> ${k.cur_point } 나누미 </td>
					<td> ${k.prj_begin_date } </td>
					<td> ${k.prj_end_date } </td>
					<td> ${k.manager_id }</td>
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
					<li><a href="mngr_prj_aids.do?a_cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
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
						<li><a href="mngr_prj_aids.do?a_cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="mngr_prj_aids.do?a_cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>