<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : goods_detail</title>
<!-- 글꼴 2가지 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

<style type="text/css">
.goods_detail {
	max-width: 1000px;
	margin: 100px auto 100px auto;
	position: relative;
	text-align: center;
}

.goods_detail_wrap {
	max-width: 1000px;
	margin: 100px auto 100px auto;
	margin-top: 100px;
	position: relative;
	text-align: center;
	border: 1px solid rgb(0, 87, 147);
	border-radius: 40px;
	min-height: 500px;
}

.detail_top_wrap {
	margin: 80px 0px 100px 0px;
	font-family: 'NanumSquareNeoBold';
	font-size: 20px;
	display: flex;
	flex-direction: row;
	align-content: center;
	flex-wrap: wrap;
	justify-content: space-around;
	padding: 10px;
	align-items: center;
}

.top_left_img {
	font-family: 'NanumBarunGothicLight';
	font-size: 9px;
	text-align: left;
	object-fit: contain;
	position: relative;
}

.delivery {
	margin-left: 10px;
	margin-bottom: -3px;
}

/* 옵션바 부분 */
.goods_option {
	float: right;
	top: 100px;
	text-align: left;
	width: 250px;
	padding-left: 50px;
	font-family: 'NanumBarunGothicLight';
	font-size: 18px;
}

.name { /*굿즈이름*/
	font-family: 'NanumSquareNeoBold';
	font-size: 20px;
	word-break: keep-all;
}

/*버튼관련*/
.btn_wrap {
	margin: 50px 0px 20px 0px;
}

#basket_btn {
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 100px;
	height: 40px;
	color: white;
	border-color: rgb(0, 87, 147);
	background-color: rgb(0, 87, 147);
	font-size: 17px;
	font-family: 'NanumSquareNeoBold';
	cursor: pointer;
}

#order_btn {
	margin-left: 2px;
	margin-right: -20px;
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 100px;
	height: 40px;
	color: white;
	border-color: rgb(253, 95, 0);
	background-color: rgb(253, 95, 0);
	font-size: 17px;
	font-family: 'NanumSquareNeoBold';
	cursor: pointer;
}

/* 상품 설명 부분 */
span.explain {
	display: flex;
	margin: 0px 0px 50px 0px;
	font-size: 30px;
	font-family: 'NanumSquareNeoBold';
}

article.goods_content {
	margin: 100px 100px 50px 100px;
	text-align: left;
	font-size: 18px;
	font-family: 'NanumBarunGothicLight';
}

.btn_wrap_lower {
	text-align: center;
	margin-top: 80px;
}

.list_go {
	text-align: center;
	margin: -60px 0 60px 0;
}

#list_btn {
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 100px;
	height: 40px;
	color: white;
	border-color: rgb(0, 87, 147);
	background-color: rgb(0, 87, 147);
	font-size: 17px;
	font-family: 'NanumSquareNeoBold';
	cursor: pointer;
}

/*수량증감버튼*/
#plus, #minus {
	background-color: #dedede;
	font-weight: bold;
	border-color: #dedede;
	border-radius: 6px;
	margin: 8px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#plus").on("click", function() {
			var amt = $("#amount").val();
			$("#amount").val(++amt);
			
			$("#count").text(amt); /*상품수량*/
			
			var total = "${gvo.price}" * amt; /* 총 판매금액 */
			$("#total").text(total);
		});
		
		$("#minus").on("click", function() {
			var amt = $("#amount").val();
			if(amt >= 1) {
				$("#amount").val(--amt);
				
				$("#count").text(amt);
				var total = "${gvo.price}" * amt;
				$("#total").text(total);
				
			}	
		});
	});
	
	/*바구니담기*/
	function add_goods_basket(f) {
		if ("${login}" != "ok") {
			alert('로그인이 필요합니다.');
		} else if("#amount" == 0){
			consol.log("#amount");
			alert('0개의 상품은 바구니에 담을 수 없습니다.');
		} else { 
			f.action = "basket_goods_add.do";
			alert('상품을 바구니에 담았습니다.')
			f.submit(); /*form에 담긴 정보를 같이 보내자*/
		}
	}
	
	/*바로주문하기*/
	function goods_order(f) {
		f.action = "goods_direct_sale.do";
		f.submit();
	}
	
</script>

</head>
<body>
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<section>
		<form method="post">
			<div class="goods_logo"></div>
			<div class="goods_detail">
				<a href="goods_list.do" style="margin-right: 0;"><img
					src="resources/images/system/goods_logo_L.png" width="350px;"></a>
				<!-- 왼쪽 사진, 오른쪽은 옵션바 하나로 묶는 div -->
				<div class="goods_detail_wrap">
					<div class="detail_top_wrap">
						<!-- 굿즈 상품대표이미지 -->
						<article class="top_left_img">
							<div>
								<!-- 품절인 경우 soldout 이미지덮어씌우기  1. 현재 재고수량 알아야함. 2.if (cur_amount == 0) { sold out 이미지 넣고, 버튼 비활성화 시키기}-->
								<c:choose>
									<c:when test="${gvo.cur_amount == 0}">
										<img src="resources/upload/system/attach/${gvo.goods_soldout_img}"
											width="400">
									</c:when>
									<c:otherwise>
										<img src="resources/upload/system/attach/${gvo.goods_main_img}"
											width="400">
									</c:otherwise>
								</c:choose>
								<p class="delivery">
									* 총 결제 포인트에는<span
										style="font-weight: bold; font-style: italic; margin-left: 0px;">
										기본배송비가 포함</span>되어있습니다.
								</p>
								<p class="delivery">&nbsp;&nbsp;(기본배송비 3000원, 6 나누미)</p>
								<p class="delivery">* 도서산간 지역의 경우 추가 배송비가 과금됩니다.</p>
								<p class="delivery">&nbsp;&nbsp;(도서산간 배송비 5000원, 10 나누미)</p>
							</div>
						</article>
						<!-- 오른쪽 옵션부분 -->
						<article class="goods_option">
							<div>
								<span class="name" style="text-align: center;">[굿즈]${gvo.goods_name}</span>
								<pre>
						</pre>
								<p>금액 : ${gvo.price} 나누미</p>
								<p>
									<input type="button" id="minus" value="-" min="1"> 
									<input type="text" id="amount" name="amount" value="1" style="width: 50px; height: 20px; text-align: center;">
									<input type="button" id="plus" value="+" min="1">
								</p>
								<pre>
								</pre>
								<p>
									<span id="count" style="margin-left: 0;">1</span>개 상품금액 : 
									<span id="total" style="margin-left: 0; font-weight: bold; font-size: 20px;">${gvo.price}</span>&nbsp;나누미
								</p>
								<div class="btn_wrap">
									<!-- 품절인 경우 버튼 비활성화  -->
									<c:choose>
										<c:when test="${gvo.cur_amount == 0}">
											<button id="basket_btn" onclick="add_goods_basket()"
												style="background-color: #c7c7c7; border-color: #c7c7c7; cursor: default;"
												disabled>나눔바구니</button>
											<button id="order_btn" onclick="goods_order()"
												style="background-color: #c7c7c7; border-color: #c7c7c7; cursor: default;"
												disabled>주문하기</button>
										</c:when>
										<c:otherwise>
											<input type="hidden" name="goods_idx" value="${gvo.goods_idx}">
											<button id="basket_btn" onclick="add_goods_basket(this.form)">나눔바구니</button>
											<button id="order_btn" onclick="goods_order(this.form)">주문하기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</article>
					</div>
					<!-- 상품 상세설명 -->
					<article class="goods_content">
						<span class="explain">상품설명</span>
						<div class="pdt_explain">
							${gvo.goods_content}
							<!-- 
		               <p> 이 곳은 굿즈 상품설명이 시작되는 곳 입니다. </p>
		               <p> 엽서 설명하기~ </p>
		               <p> <img src="resources/images/system/goodspaper.png" width="300"></p>
		               <p> 5장 1세트<br>상품규격: A7 5장 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> <img src="resources/images/system/sally1.png"> </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> <img src="resources/images/system/pup.png"> </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
		               <p> ... </p> -->
						</div>
						<div class="btn_wrap_lower">
							<!-- 품절인 경우 버튼 비활성화  -->
							<c:choose>
								<c:when test="${gvo.cur_amount == 0}">
									<button id="basket_btn" onclick="add_goods_basket()"
										style="background-color: #c7c7c7; border-color: #c7c7c7; cursor: default;"
										disabled>나눔바구니</button>
									<button id="order_btn" onclick="goods_order()"
										style="background-color: #c7c7c7; border-color: #c7c7c7; cursor: default;"
										disabled>주문하기</button>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="goods_idx" value="${gvo.goods_idx}">
									<button id="basket_btn" onclick="add_goods_basket(this.form)">나눔바구니</button>
									<button id="order_btn" onclick="goods_order(this.form)">주문하기</button>
								</c:otherwise>
							</c:choose>

						</div>
					</article>
				</div>
				<div class="list_go">
					<a href="goods_list.do"><button id="list_btn">목록</button></a>
				</div>
			</div>
		</form>
	</section>

	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>