<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : goods_basket</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">

#menu_wrap {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

ul.basket_menu {
	display: flex;
	flex-direction: row;
	padding-inline-start: 0;
	list-style-type: none;
	font-size: 19px;
	font-family: 'NanumSquareNeoBold'; 
}

ul.basket_menu a {
	margin: 0px 20px 0px 20px;
	padding-top: 20px;
	background-color: white;
	color: black;
	text-decoration: none;
	border-right: 3px solid white;
}
	
ul.basket_menu a:hover{
	color: black;
	font-weight: bold;
	font-size: 20px;
	border-bottom: 2px solid black;
}


table{
	width:100%;
	padding:50px;
	border-spacing: 0; /* td간 간격 없애기*/
}

td {
	padding-left: 50px;
    padding-top: 50px;
    padding-bottom: 50px;
    border-bottom: 2px solid #005793;
    line-height: 50px; /* 행간 간격*/
}


.thumbnail { /*img로 하면 다른 아이콘들도 같이 먹혀서 class 주었음*/
	width: 150px;
	height: 150px;
}

.goods_wrap {
    max-width: 1000px;
    margin: 50px auto 100px auto;
    position: relative;
    text-align: left;
    border: 1px solid rgb(0,87,147);
    border-radius: 40px;
    font-family: 'NanumSquareNeoBold';
    font-size: 15px;
}

.empty_basket {
	font-family: 'NanumSquareNeoBold';
    font-size: 45px;
    text-align: left;
    padding-left: 45px;
    padding-bottom: 30px;
    padding-top: 30px;
    
}

/*참여 및 결제 버튼*/
.del_btn, .correction_btn {
    border-radius: 10px;
    border: none;
	color: #6e6e6e;
	cursor: pointer;
	font-family: 'NanumSquareNeoBold';
    font-size: x-small;
}

.payment_btn{
    font-family: 'NanumSquareNeoBold';
    font-size: 10px;
    color: rgb(253,95,0);
    border: 1.5px solid rgb(253,95,0);
    background-color: #fff;
    border-radius: 5px;
    padding: 5px;
    cursor: pointer;
    margin-right: 7px;
}

.total_order_btn{
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 90px; 
	height: 37px; 
	color: white; 
	border-color:rgb(253, 95, 0);
	background-color: rgb(253, 95, 0); 
	font-size: 16px; 
	font-family: 'NanumSquareNeoBold'; 
	text-align: center;
}

td > input {
	accent-color: rgb(0,87,147);
	zoom: 1.5;
	}
span > input {
	width: 80px; 
	height: 20px;
	border-radius: 5px;
	padding-left: 6px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	 /* 1. 체크된 항목에 대한 정보 가져오기
	 		1-1. goods_idx / amount / price
	 	2. 체크된 항목에 대한 총 가격 계산하기 
	 	3. 체크된 항목만 주문하기 (goods_idx, amount, price)
	 	4. 주문 완료 후 각 goods_idx 의 재고 수량 변경하기 (여러개인 경우, for문 돌려야 하지 않나? 컨트롤러에서?)
	 */
 	$(document).ready(function() {
	  // 체크박스 변경 시 총 가격 계산
	  $(".goods_chk").click(function() {
		  chkPriceTotal();
	  });
	  
	function chkPriceTotal() {
		var total = 0;
		var count = document.getElementsByClassName("goods_chk");
		var cnt = document.getElementsByClassName("price");
		var amt = document.getElementsByClassName("amt");
		
		for (var i = 0; i < count.length; i++) {
			if(count[i].checked == true) {
				var price =  cnt[i].value;
				var amount = amt[i].value;
				total += Number(price) * Number(amount);
			}
		} 
		 /*  $(".goods_chk").each(function() {
			  if ($(this).is(':checked') == true) {
			    var price = parseInt($(this).parents("tr").find("#price").val());
			    var amount = parseInt($(this).parents("tr").find("#amount").val());
			    total += price * amount;
				}
		 	 }); */
		 	 //for문 끝
		  $("#totalprice").text(total);
		}// chkPriceTotal() 끝
		
	});
 
 		
	function basket_amount_edit(goods_basket_idx, goods_idx, index) { // 파라미터를 함수안에 함께 넘겨서 값을 가져오자 
		alert(index)
		var amt = document.getElementsByClassName("amt");
		var amount = amt[index].value;
		alert(amount)
		location.href = "basket_goods_edit.do?goods_idx=" + goods_idx + "&goods_basket_idx="+ goods_basket_idx +"&amount=" +amount;
	}
	
	function goodsBasketOnedel(f) {
		if (confirm("굿즈바구니 목록에서 삭제하시겠습니까?") == true) {
			f.action="basket_goods_delete.do";
			f.submit();
		}
	}
	
	/*목록에서 체크박스와 관련 없이, 하나의 상품만 따로 주문하는 경우 */
	function goodsOne_Order_exec(goods_basket_idx, goods_idx, index) {
		var amt = document.getElementsByClassName("amt");
		var amount = amt[index].value;
		location.href="goods_basket_sale.do?goods_basket_idx="+goods_basket_idx+"&goods_idx="+goods_idx+"&amount=" +amount;
	}

	
 	/* 체크박스로 선택하여 주문하는 경ㅇ(1개일수도 , 2개 이상일 수도 있다.)*/
 	function total_order_exec(f) {
	 	alert('왔니?');
	    var goodsBasket = []; // 체크된 굿즈 정보를 배열로 저장하자
	
	    var checkboxes = document.getElementsByClassName("goods_chk");
	    var prices = document.getElementsByClassName("price");
	    var amounts = document.getElementsByClassName("amt");
	    var basketIdx = document.getElementsByClassName("goods_basket_idx");
	    var goodsIdx = document.getElementsByClassName("goods_idx");
	    var total = 0; // 총 주문 금액을 저장할 변수
	
	    for (var i = 0; i < checkboxes.length; i++) {
	        if (checkboxes[i].checked) {
	            // 굿즈 정보를 객체에 저장한다.
	            var goods_list = {
	                goodsBasketIndex: basketIdx[i].value,
	                goodsIndex: goodsIdx[i].value,
	                price: prices[i].value,
	                amount: amounts[i].value
	            };
	            // 배열에 굿즈 정보 객체를 추가한다.
	            goodsBasket.push(goods_list);
	            // 총 주문 금액을 계산한다.
	            total += Number(prices[i].value) * Number(amounts[i].value);
	        }//if 끝
	    }//for 끝
	    // 폼을 서버로 제출한다. 
	    f.action = "goods_basket_sale.do";
	    f.submit();
	}

</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
	<div id="menu_wrap">	
		<ul class="basket_menu">
			<li class="project_menu"><a href="basket_prj.do">프로젝트바구니</a></li>
			<li class="goods_menu"><a href="basket_goods.do">굿즈바구니</a></li>
		</ul>
	</div>
</header>
<section>
<form method="post">
	<article class="goods_wrap">
		<table>
 			<c:choose>
				<c:when test="${empty basket_goodslist}">
					<tr><th class="empty_basket" colspan="5" style="text-align: center;">굿즈 바구니가 비어있습니다.</th></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${basket_goodslist}" varStatus="vs"> 
						<tr>
							<td width="25px;"><input type="checkbox" class="goods_chk" name="goods_chk" checked="checked" ></td>
							<td><img class="thumbnail" src="resources/upload/system/attach/${k.goods_f_name}"></td><!-- 이미지이름 가져오는 곳 -->
							<td><span class="subject">[굿즈] ${k.goods_name}</span><br>
								<span class="amount">수량 :&nbsp;&nbsp; <input type="number" class="amt" name="amount" min="1" value="${k.amount}"></span>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="hidden" class="goods_idx" name="goods_idx" value="${k.goods_idx}"> 
								<input type="hidden" class="price" name="price" value="${k.price}"> 
	 							<input type="hidden" class="goods_basket_idx" name="goods_basket_idx" value="${k.goods_basket_idx}">
								<input type="button" class="correction_btn" value="수정" onclick="basket_amount_edit('${k.goods_basket_idx}','${k.goods_idx}','${vs.index}')" style="padding-bottom: 2px; padding-top: 2px;"> 
							 </td>
							 <td style="text-align: right;">
							 <p style="font-size:18px; font-weight: bold; padding-right: 15px; margin-bottom: 0px;" >총 <fmt:formatNumber  value="${k.amount * k.price}" pattern="#,##0" /> 나누미</p>
 							 <input type="button" class="payment_btn" value="주문하기" onclick="goodsOne_Order_exec('${k.goods_basket_idx}','${k.goods_idx}','${vs.index}')"></td> 
							 <td><input type="button" class="del_btn" value="x" onclick="goodsBasketOnedel(this.form)"></td> 
						</tr>
						<c:set var="total" value="${total + (k.amount * k.price)}"/>
						<input type="hidden" id="total" name="total" value="${total}">
		 			</c:forEach>
				</c:otherwise>
			</c:choose> 
			
			  <tfoot>
			  <c:choose>
			  	<c:when test="${empty basket_goodslist}">
				  	<tr>
						<td colspan="3">
							<p style="font-size: 20px; font-weight: bold; text-align: right; margin-bottom: -30px">선택 굿즈 총 결제포인트</p>
							<p style="font-size: 25px; font-weight: bold; color: rgb(0,87,147); text-align: right;">총 0 나누미</p></td>
						<td colspan="2" style="text-align: center;"><input type="button" class="total_order_btn" value="주문하기" 
						style="background-color: #c7c7c7; border-color: #c7c7c7; cursor: default;"
												disabled></td>			  	
				  	</tr>
			  	</c:when>
			  	<c:otherwise>
				  	<tr>
						<td colspan="3">
							<p style="font-size: 20px; font-weight: bold; text-align: right; margin-bottom: -30px">선택 굿즈 총 결제포인트</p>
							<p style="font-size: 25px; font-weight: bold; color: rgb(0,87,147); text-align: right;" >총 <span id="totalprice"  style="margin-right: 10px;">${total}</span>나누미</p></td>
						<td colspan="2" style="text-align: center;"><input type="button" class="total_order_btn" value="주문하기" onclick="total_order_exec(this.form)"></td>			  	
				  	</tr>
			  	</c:otherwise>
			  </c:choose>
			  </tfoot>
			  
		</table>
	</article>

</form>		
</section>

<footer>
	<jsp:include page="../footer.jsp" />
</footer>
<!-- 바구니에 담은 상품 한꺼번에 결제할 때 필요 한가...? -->
<form id="" name="" method="post">

</form>


</body>
</html>






