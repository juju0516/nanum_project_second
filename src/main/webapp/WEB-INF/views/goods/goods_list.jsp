<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : goods_list</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<style type="text/css">
.goods_top {
    max-width: 1000px;
    margin: 100px auto 100px auto;
    position: relative;
    text-align: center;
}

.goods_explain {
	margin: 100px 0px 100px 0px;
	border: 1px solid rgb(0,87,147);
	border-radius: 40px;
	font-family: 'NanumSquareNeoBold';
	font-size: 15px;
	padding: 10px;
}


/* 굿즈 상품 관련  */
.wrap_goods{ 
	max-width: 1000px;
    margin: 100px auto 200px auto;
    position: relative;
}

.goods_list {
	display: flex;
	justify-content: center;
    text-align: center;
}

.goods img{
	width: 300px;
	height: 200px;
	object-fit: contain; /*가로세로비율유지하면서 컨테이너 사이즈에 맞게 조절(빈공간 생길 수 있음)*/
	margin-bottom: 15px;
	} 

.goods {
    margin: 30px;
    font-family: 'NanumSquareNeoBold';
    font-size: 18px;
}

.goods_name{
	font-family: 'NanumSquareNeoBold';
    font-size: 22px;
}

span.commingSoon {
	font-family: 'NanumSquareNeoBold';
	font-size: 30px;
}
.goods_period {
	font-family: 'NanumSquareNeo';
	font-size: 14px;
}

/* 품절인 경우 */
.soldout{
	font-family: 'NanumSquareNeoBold';
	font-size: 17px;
	color: red;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<form method="post" name="f">
<header>
	<jsp:include page="../header.jsp" />
</header>
<section>
	<article class="goods_top">
		<span class="logo" style="margin-left: 0;"><img src="resources/images/system/goods_logo_L.png" width="350px;"> </span>
		<!-- 굿즈설명화면 및 기간  -->
		<!-- 관리자 굿즈 등록시 메인 설명 쓰는 란.... 썸머노트 컨텐트 받아와야함.? 또는 이미지 첨부? -->
		<div class="goods_explain">
			<p><span style="font-size: 30px; font-family:NanumSquareNeoHeavy; color: rgb(253, 97, 0);">후원</span>
			, 어렵지않아요!</p>
			<p>굿즈 판매 기금은<span style="font-family:NanumSquareNeoHeavy; font-size: 25px;">프로젝트 후원기금</span>으로 사용됩니다.</p>
			<pre>
			</pre>
			<p><span style="font-size: 20px; font-weight: bold;">기간별로 진행되는 나누미굿즈!</span></p>
			<p><span>굿즈를 통해 후원에 동참해보세요.</span></p>
		</div>
	</article>
	
	<article class="wrap_goods">
		<div class="goods_list">
	 		<c:choose>
	 			<c:when test="${empty goodsList}"> 
					<span class="commingSoon"> 굿즈 준비중입니다.  Comming Soon... </span>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${goodsList}">
						 <div class="goods">
				           		<c:choose>
				           			<c:when test="${k.cur_amount == 0}">
										<a href="goods_detail.do?goods_idx=${k.goods_idx}" class="goods">
				           				<img src="resources/upload/system/attach/${k.goods_soldout_img}" width="300" >
						              	<p><span class="goods_period">기간 : ${k.open_date.substring(0,10)} ~ ${k.close_date.substring(0,10)}</span></p>
						               	<p><span class="goods_name"> [굿즈]${k.goods_name}</span></p>
						               	<p><span class="goods_price" style="display: none;"> ${k.price} 나누미</span></p>
					              		<p><span class="soldout"> SOLD OUT </span></p>
					              		 </a>
				           			</c:when>
				           			<c:otherwise>
				           				
										<a href="goods_detail.do?goods_idx=${k.goods_idx}" class="goods">
				           				<img src="resources/upload/system/attach/${k.goods_main_img}" width="300">
						              	<p><span class="goods_period">기간 : ${k.open_date.substring(0,10)} ~ ${k.close_date.substring(0,10)}</span></p>
						               	<p><span class="goods_name"> [굿즈]${k.goods_name}</span></p>
				               			<p><span class="goods_price"> ${k.price} 나누미</span></p>
				               			 </a>
				               			 
				           			</c:otherwise>
				           		</c:choose>			          
				           </div>
					</c:forEach>
			 	</c:otherwise>
			</c:choose> 
		</div>
	</article>

	</section>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</form>
</body>
</html>