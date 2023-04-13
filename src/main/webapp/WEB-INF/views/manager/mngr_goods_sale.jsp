<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 굿즈 구매 내역</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css"
	rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css"
	rel="stylesheet">
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

.width-new {
	width: 80%;
}

.input-width {
	width: 157px;
}

#popup:hover {
	border-bottom: 1px solid #888;
	cursor: pointer;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#popup").on('click', function() {
			var idx = $("#goods_sale_idx").val();
			open_state_change_popup(idx, "${paging.nowPage}");
		});
	});
	
	function open_state_change_popup(g_s_idx, cPage) {	 	
		//팝업창에 출력될 페이지 URL
		var url = "mngr_goods_sale_popup.do?goods_sale_idx="+g_s_idx+"&s_cPage="+cPage; 
		var name = "goods_sale";
		
		// 팝업창 크기
		var popupWidth = 700;
		var popupHeigth = 400;
		
		/*팝업창 가운데 정렬*/
		var popupX = window.screenLeft + window.outerWidth/2 - (popupWidth / 2);		
		var popupY= window.screenTop + window.outerHeight/2 - (popupHeigth / 2);
		
		var option="width=" + popupWidth + ",height=" + popupHeigth +
		           ",left=" + popupX + ",top=" + popupY + 
		           ",location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
		
		//이동할주소, 이름, 팝업옵션
	    window.open(url, name, option);
	}
	
	function search_exec(f) {
		// 검색 기간
		const b_date = document.querySelector("b-date").value;
		const e_date = document.querySelector("e-date").value;
		if(b_date > e_date) {
			alert("검색 시작 날짜가 종료 날짜보다 늦을 수 없습니다.");
			return;
		}
		
		// 제품명, 제품번호로 검색
		const s_type = document.getElementById("s-type");
		const type_val = s_type.options[s_type.selectedIndex].value;
		const s_word = document.getElementById("s-word").value.trim();
		
		// 주문 처리 상태값
		const state = document.getElementById("state");
		const state_val = state.options[state.selectedIndex].value;
		
		f.action = "mngr_goods_sale_search.do?s_type=" + type_val + "&s_word=" + s_word + 
				   "&state=" + state + "&b_date=" + b_date + "&e_date=" + e_date;
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="mngr_header_menu.jsp" />
	<section>
		<form method="post">
			<div class="title">굿즈 구매 내역</div>
			<div class="search-row gap">
				<label for="search"> 검색어 &nbsp;&nbsp;&nbsp;&nbsp; </label> 
				<select id="s-type">
					<option value="none">-- 검색 항목 --</option>
					<option value="제품명">제품명</option>
					<option value="제품번호">제품 번호</option>
				</select> 
				<input type="text" id="s-word"> 
				<select class="select blank" id="state">
					<option value="none">-- 상 태 --</option>
					<option value="주문">주문</option>
					<option value="주문취소 신청">주문 취소 신청</option>
					<option value="주문취소 완료">주문 취소 완료</option>
					<option value="제품준비">제품 준비</option>
					<option value="배송시작">배송 시작</option>
					<option value="배송완료">배송 완료</option>
				</select>
			</div>
			<div class="search-row">
				<span class="search-label"> 구입 날짜 </span> 
				<input class="input-width" type="date" id="b-date" value="2023-03-29"> ~ &nbsp;&nbsp;&nbsp;&nbsp;
				<input class="input-width" type="date" id="e-date" value="2023-03-29">
			</div>
			<div class="only-btn-wrap">
				<button class="btn-detail" onclick="search_exec(this.form)">검 색</button>
			</div>
			<div class="table-wrap">
				<table class="width-new">
					<thead>
						<tr>
							<th>No.</th>
							<th>상태</th>
							<th>ID</th>
							<th>이미지</th>
							<th>제품번호</th>
							<th>제품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>총금액</th>
							<th>구입 날짜</th>
							<th>취소신청 날짜</th>
							<th>취소완료 날짜</th>
							<th>관리자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty g_s_list}">
								<tr>
									<td colspan="13"><h3>Goods 판매 정보 없음</h3></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${g_s_list }" varStatus="vs">
									<tr>
										<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
										<td>
											<c:choose>
												<c:when test="${k.g_s_state eq '주문취소 신청'}">
													<a href="mngr_goods_sale_cancel.do?s_cPage=${paging.nowPage}&goods_sale_idx=${k.goods_sale_idx}">
														${k.g_s_state}</a>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${k.g_s_state eq '주문취소 완료' || k.g_s_state eq '배송완료'}">
															${k.g_s_state}
														</c:when>
														<c:otherwise>
															<span id="popup"> ${k.g_s_state} </span>													
															<input type="hidden" id="goods_sale_idx" value="${k.goods_sale_idx}">
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>									
										</td>
										<td>${k.id }</td>
										<td><img src="resources/upload/system/attach/${k.goods_f_name}" width="50px"></td>
										<td>${k.goods_code}</td>
										<td>${k.goods_name}</td>
										<td>${k.price}</td>
										<td>${k.amount}</td>
										<td>${k.total_price}</td>
										<td>${k.sale_date }</td>
										<td>${k.cancel_date }</td>
										<td>${k.cancel_cmpl }</td>
										<td>${manager_id }</td>
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
							<li class="disable">&lt;</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="mngr_goods_sale.do?s_cPage=${paging.beginBlock-paging.pagePerBlock}">
									&lt; </a></li>
						</c:otherwise>
					</c:choose>

					<!-- 블록안에 들어간 페이지번호들 -->
					<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
						step="1" var="k">
						<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
						<c:choose>
							<c:when test="${k == paging.nowPage}">
								<li class="now">${k}</li>
							</c:when>
							<c:otherwise>
								<li><a href="mngr_goods_sale.do?s_cPage=${k}">${k}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 -->
					<c:choose>
						<c:when test="${paging.endBlock >= paging.totalPage}">
							<li class="disable">&gt;</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="mngr_goods_sale.do?s_cPage=${paging.beginBlock+paging.pagePerBlock}">
									&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
			</section>
		</form>
	</section>
</body>
</html>