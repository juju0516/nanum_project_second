<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Nanumi </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">
.notice {
	display: flex;
	justify-content: flex-start;
	margin: 0 auto;
	width: 70%;
	margin-top: 70px;
	font-family: 'NanumSquareNeo';
	font-size: 15px;
	color: #444;
}

.search-label-1 {
	margin: 10px 45px 0px 0px;
	font-family: 'NanumSquareNeo';
	font-size: 16px;
	color: #444;	
}

.blank {
	margin-left: 330px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 나누미 정보 </div>
	<div class="notice"> ☆ 나누미 전환 관련은 '<b>나누미 전환 관리</b>' 메뉴를 사용해 주세요. </div>
	<div class="search-row">
		<span class="search-label-1"> ID </span><input type="text"> 
		<select class="select-l blank" name="category">
			<option value=""> -- 카테고리 선택 -- </option>
			<option value="change"> 나누미 전환 요청 </option>
			<optgroup label="프로젝트"> 
				<option value="prj"> 프로젝트 일시 후원</option>
				<option value="r_prj"> 프로젝트 정기 후원</option>
				<option value="aids"> 상시 프로젝트 일시 후원</option>
				<option value="r_aids"> 상시 프로젝트 정기 후원</option>
			</optgroup>
			<optgroup label="기념일 후원"> 
				<option value="special"> 기념일 일시 후원</option>
				<option value="r_special"> 기념일 정기 후원</option>
			</optgroup>
			<optgroup label="굿즈"> 
				<option value="buy"> 굿즈 구매</option>
				<option value="refund"> 주문 취소 환급</option>
			</optgroup>
		</select>		
	</div>
	<div class="search-row"><span class="search-label"> 날짜 </span>
		<input type="date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="date" value="2023-03-29"></div>
	<div class="only-btn-wrap"><button class="btn-detail" onclick=""> 검 색</button></div>	
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>ID</th><th>보유 나누미</th><th>카테고리</th><th>차감 나누미</th>
			<th>반환 나누미</th><th>차감/반환 날짜</th><th>관리자</th></tr>
		</thead>
		<tbody>	
			<tr><td>1</td><td>aaa</td><td>40</td><td>전환 요청</td><td> - </td>
			<td> - </td><td> - </td><td> - </td>
			</tr>
			<tr><td>2</td><td>bbb</td><td>50</td><td> 프로젝트 일시 후원 </td><td> 40 </td>
			<td> - </td><td> 2023-03-27 </td><td> admin1 </td>
			</tr>
			<tr><td>3</td><td>ccc</td><td>100</td><td>주문 취소 환급</td><td> - </td>
			<td> 40 </td><td> 2023-03-25 </td><td> admin1 </td>
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