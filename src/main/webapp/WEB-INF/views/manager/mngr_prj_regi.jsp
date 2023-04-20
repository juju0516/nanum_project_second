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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	function search_exec(f) {
		// 검색 기간
		var b_date = $("#b-date").val();
		var e_date = $("#e-date").val();

		if(e_date != '' && b_date > e_date) {
			alert("검색 시작 날짜가 종료 날짜보다 늦을 수 없습니다.");
			return;
		}

		// p_r_state
		var p_r_state = $("#state option:selected").val();

		f.action = "mngr_prj_regi.do?search=y&b_date=" + b_date + "&e_date=" + e_date +
				   "&p_r_state=" + p_r_state;
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 프로젝트 등록 정보 </div>
	<div class="search-wrap gap">
		<span class="search-label"> 입력 날짜 </span>
		<input class="input-width" type="date" id="b-date"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="input-width" type="date" id="e-date">
		<select class="select blank" id="state">
			<option value=""> -- 상 태 -- </option>
			<option value="임시 저장"> 임시 저장 </option>
			<option value="승인 요청"> 승인 요청 </option>
			<option value="취소 요청"> 취소 요청 </option>
			<option value="심사중"> 심사중 </option>
			<option value="등록 승인"> 등록 승인 </option>
			<option value="등록 거절"> 등록 거절 </option>
			<option value="취소 완료"> 취소 완료 </option>
		</select>	
	</div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick="search_exec(this.form)"> 검 색</button></div>	
	<div class="table-wrap">
	<table class="width-new">
		<thead>
			<tr><th>No.</th><th>상태</th><th> 프로젝트 제목 </th><th>ID</th><th>닉네임</th>
			<th>목표 금액</th><th>목표 인원</th><th>입력 날짜</th><th>취소요청 날짜</th>
			<th>심사 날짜</th><th>관리자</th></tr>
		</thead>
		<tbody>	
		<c:choose>
			<c:when test="${empty prj_regi}">
				<tr>
					<td colspan="11"><h3>프로젝트 등록 정보 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${prj_regi }" varStatus="vs">
					<tr>
					<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
					<td>${k.p_r_state}</td>
					<td><a href="mngr_prj_regi_detail.do?prj_regi_idx=${k.prj_regi_idx}&r_cPage=${paging.nowPage}">
					 	${k.prj_title} </a></td>
					<td>${k.id }</td>
					<td>${k.nickname }</td>
					<td>${k.goal_point }</td>
					<td>${k.goal_num_people }</td>
					<td>${k.submit_date}</td>
					<td>${k.req_cancel_date}</td>
					<td>${k.judge_date}</td>
					<td>${k.manager_id}</td>
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
					<li><a href="mngr_prj_regi.do?r_cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
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
						<li><a href="mngr_prj_regi.do?r_cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="mngr_prj_regi.do?r_cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>