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
	padding: 5px 0 0 20px;
}
.goods-code {
	font-family: 'NanumSquareNeoLight';
	vertical-align: middle;
}
.text-title {
	margin-left: 0px;
	padding: 0px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 70px;
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
<script type="text/javascript">
	function goods_cancel_exec(f) {
		f.action ="mngr_goods_cancel_exec.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 굿즈 주문 취소 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : admin1</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div class="h-l-wrap">
						<img src="resources/images/system/fullheart.png" class="img-goods">
						<span class="goods-code"> [ 제품 번호 ] </span>
					</div>
				</th>
				<th><div class="text-title">제품 이름</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width="18%">가격</td><td class="td-padding">20 나누미</td></tr>
			<tr><td>수량</td>
				<td class="td-padding">2 개 <span class="num-gap"> (재고 미환급)</span></td></tr>
			<tr><td>반환 금액</td>
				<td class="td-padding">45 나누미 <span class="refund-gap"> (나누미 미환급)</span></td></tr>
			<tr><td>주문 날짜</td>
				<td class="td-padding">2023-03-30 09:00:30</td></tr>
			<tr><td>주문 취소 신청 날짜</td>
				<td class="td-padding">2023-04-01 21:50:50</td></tr>
			<tr class="e-o-tb"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_cancel_exec(this.form)">주문 취소</button></div>
	</div> 
</form>	
</section>
</body>
</html>