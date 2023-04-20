<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 결제 확인 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style type="text/css">
.logo {
	font-family: 'NanumSquareNeoHeavy';
	font-size: 45px;
	font-weight: bold;
	color: rgb(0, 87, 147);
	margin:30px;
}

.pay_wrap {
text-align: center;
	margin: 30px;
	width: 85%;
	border: 2px solid #005273;
	border-radius: 5px;
	padding-top: 30px;
	padding-left: 15px;
}

.pay_t {
width: 95%;
text-align: center;
font-family: 'NanumSquareNeoBold';
} 

.pay_t th {
	background-color: #eaeaea;
	padding: 15px;
}
table .head { /*th보다 아래에 있어야 배경색이 먹힘.*/
	text-align: left; 
	padding-bottom: 15px; 
	font-size: 20px;
	background-color: white;
}
.pay_t td {
	padding: 15px;
	background-color: #f5f5f5;
}

.btn_wrap {
	margin: 30px;
	text-align: right;
}

#cancel_btn, #payment_btn {
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 80px; 
	height: 30px; 
	color: white; 
	font-size: 13px; 
	font-family: 'NanumSquareNeoBold'; 
	cursor: pointer;
}

#cancel_btn {
	border-color: #005273;
	background-color: #005273; 
	margin-right: 5px;
}

#payment_btn {
	border-color: #fd5f00;
	background-color: #fd5f00; 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.3/jquery.min.js"></script>
<script type="text/javascript">
	function cancel() {
	 	if (confirm("결제를 취소하시겠습니까?") == true) {
			window.opener.location.reload();    //부모창 reload
			window.close(); 
		}
	}
	
	/* 결제 진행하기*/
	function pay_final(f) {
		// 실제 결제 진행할 컨트롤러 호출.
		
	    f.action = "goods_basketpay_ok_exec.do";
	  	f.submit();
	}
</script>
</head>
<body>
	<form method="post">
	<div class="pay_popup">
		<span class="logo">NANUM ✿</span>
		<div class="pay_wrap">
			<table class="pay_t">
				<thead>
					<tr><th colspan="3" class="head">총 ${amount}개의 상품, 결제하시겠습니까?</th></tr>
					<tr>
						<th>총 상품 포인트</th>
						<th>배송 포인트</th>
						<th>총 결제 포인트</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${gvo.price * amount}나누미</td>
						<%-- <td>${gvo.delivery_charge} 나누미</td> --%>
						<td>6 나누미</td>
						<td>${(gvo.price * amount) + 6}나누미</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
<!-- 				<form method="post" name ="paymentOK"> -->
					<input type="hidden" name="goods_idx" value="${gvo.goods_idx}">
			    	<input type="hidden" name="price" value="${gvo.price}">
					<input type="hidden" name="id" value="${mvo.id}">
					<input type="hidden" name="amount" value="${amount}">
				<button id="cancel_btn" onclick="cancel(this.form)">취소</button>
				<button id="payment_btn" onclick="pay_final(this.form)">결제하기</button>
			</div>
		</div>
	</div>	
	</form>
</body>
</html>



