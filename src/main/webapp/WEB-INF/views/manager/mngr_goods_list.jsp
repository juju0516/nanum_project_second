<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Goods </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">
.btn-loc {
	margin-left: 100px;
}
.new-gap {
	margin-bottom: 20px;
}
</style>
<script type="text/javascript">
	function goods_search(f) {
		// ajax로 데이터 가져오기
		//f.action ="mngr_goods_search.do";
		//f.submit();
	}
	
	function goods_write(f) {
		//f.action ="mngr_goods_write.do?cPage=${paging.nowPage}";
		f.action ="mngr_goods_write.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 굿즈 정보 </div>
	<div class="search-wrap new-gap">
		<span class="search-label"> 제품명 </span><input type="text"> 
		<div class="btn-loc">
			<button class="btn-detail" onclick="goods_search(this.form)"> 검 색</button>
		</div>	
	</div>	
	<div class="only-btn-wrap">
		<button class="btn-detail" onclick="goods_write(this.form)"> 상품 등록 </button>
		<input type="hidden" name="cPage" value="${paging.nowPage }">
	</div>
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>상태</th><th>제품 번호</th><th>제품명</th><th>가격</th><th>총 재고</th>
				<th>재고</th><th>등록 날짜</th><th>조회수</th><th>관리자</th></tr>
		</thead>
		<tbody>	
		<c:choose>
			<c:when test="${empty goods_list}">
				<tr>
					<td colspan="10"><h3>Goods 정보 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${goods_list }" varStatus="vs">
					<tr><td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
					<td>${k.g_state}</td>
					<td><a href="mngr_goods_detail.do?goods_idx=${k.goods_idx}&cPage=${paging.nowPage}">${k.goods_code}</a></td>
					<td><a href="mngr_goods_detail.do?goods_idx=${k.goods_idx}&cPage=${paging.nowPage}">${k.goods_name}</a></td>
					<td>${k.price}</td>
					<td>${k.init_amount}</td>
					<td>${k.cur_amount}</td>
					<td>${k.open_date.substring(0,10)}</td>
					<td>${k.goods_hit}</td>
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
					<li><a href="mngr_goods_list.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
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
						<li><a href="mngr_goods_list.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="mngr_goods_list.do?cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>