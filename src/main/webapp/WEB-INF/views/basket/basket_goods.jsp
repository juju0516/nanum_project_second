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
}

.payment_btn{
    font-family: 'NanumSquareNeoBold';
    font-size: 17px;
    color: rgb(253,95,0);
    border: 2px solid rgb(253,95,0);
   	background-color: #fff;
    border-radius: 5px;
    padding: 7px;
    cursor: pointer;
}

.order_btn{
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 100px; 
	height: 40px; 
	color: white; 
	border-color:rgb(253, 95, 0);
	background-color: rgb(253, 95, 0); 
	font-size: 19px; 
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
}
</style>
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
					<c:forEach var="k" items="${basket_goodslist}"> 
						<tr>
							<td width="25px;"><input type="checkbox" name="goods_chk" value="on" checked="checked" > </td>
							<td><img class="thumbnail" src="resources/upload/system/attach/${k.goods_f_name}"></td><!-- 이미지이름 가져오는 곳 -->
							<td><span class="subject">[굿즈] ${k.goods_name}</span><br>
								<span class="amount">수량 :&nbsp;&nbsp; <input type="number" min="1" placeholder="${k.amount}"></span>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="hidden" id="goods_idx" value="${k.goods_idx}">
								<input type="hidden" id="price" value="${k.price}">
								<button class="correction_btn">수정</button>
							 </td>
							 <td style="text-align: right;">
							 <p style="font-size:18px; font-weight: bold; padding-right: 15px;" >총 <fmt:formatNumber  value="${k.amount * k.price}" pattern="#,##0" /> 나누미</p>
							 <a href="goods_sale.do"><button class="payment_btn">주문하기</button></a></td>
							 <td><a href="#목록삭제하기"><button class="del_btn">x</button></a> </td>
						</tr>
						<c:set var="total" value="${total + (k.amount * k.price)}" />
		 			</c:forEach>
				</c:otherwise>
			</c:choose> 
			
			  <tfoot>
			  	<tr>
					<td colspan="3">
						<p style="font-size: 20px; font-weight: bold; text-align: right; margin-bottom: -30px">선택 굿즈 총 결제포인트</p>
						<p style="font-size: 25px; font-weight: bold; color: rgb(0,87,147); text-align: right;">총 ${total} 나누미</p></td>
					<td colspan="2" style="text-align: center;"><a href="basket_goods_sale.do"><button class="order_btn">주문하기</button></a></td>			  	
			  	</tr>
			  </tfoot>
			  
		</table>
	</article>
</form>		
</section>

<footer>
	<jsp:include page="../footer.jsp" />
</footer>


</body>
</html>