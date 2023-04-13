<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 굿즈 주문 취소 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.new-width {
	width:71.5%; 
}

.h-l-wrap {
	display: flex;
	flex-direction: row;
	width: 150px;
}
.img-goods {
	height: 40px;
	padding: 2px 10px 0 20px;
}
.goods-code {
	font-family: 'NanumSquareNeoLight';
	vertical-align: middle;
	margin-right: 30px;
}
.text-title {
	margin-left: 0px;
	padding: 0px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 0px;
}

.num-gap {
	padding: 0px 0px 0px 20px;
}
.refund-gap {
	padding: 0px 0px 0px 20px;
}

.e-o-tb {
	border-radius: 8px;
	background-color: #EAEAEA80;
	background-color: rgb(224, 224, 224);
	height: 2px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if("${second}" == 'y') {
			open_cancel_ok_popup();
		}
	});
	
	function open_cancel_ok_popup() {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_goods_sale_cancel_ok.do?s_cPage=${s_cPage}"; 
		var name = "goods_sale_cancel_ok";
		
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
	
	function goods_cancel_exec(f) {
		f.action ="mngr_goods_sale_cancel_exec.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 굿즈 주문 취소 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : ${gsvo.manager_id }</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div class="h-l-wrap">
						<img src="resources/upload/system/attach/${gsvo.goods_f_name }" class="img-goods">
						<span class="goods-code"> [ ${gsvo.goods_code} ] </span>
					</div>
				</th>
				<th><div class="text-title">${gsvo.goods_name}</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width="27%">가격</td><td class="td-padding">${gsvo.price} 나누미</td></tr>
			<tr><td>구매자 ID</td><td class="td-padding">${gsvo.id} 나누미</td></tr>
			<tr><td>수량</td>
				<td class="td-padding">${gsvo.amount} 개 <span class="num-gap"></span></td></tr>
			<tr><td>반환 금액</td>
				<td class="td-padding">${gsvo.total_price} 나누미 <span class="refund-gap"></span></td></tr>
			<tr><td>주문 날짜</td>
				<td class="td-padding">${gsvo.sale_date} </td></tr>
			<tr><td>주문 취소 신청 날짜</td>
				<td class="td-padding">${gsvo.cancel_date} </td></tr>
			<tr class="e-o-tb"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc">
			<input type="hidden" name="s_cPage" value="${s_cPage }">
			<input type="hidden" name="goods_sale_idx" value="${gsvo.goods_sale_idx}">			
			<button class="btn-detail-l" onclick="goods_cancel_exec(this.form)">주문 취소</button>
		</div>
	</div> 
</form>	
</section>
</body>
</html>