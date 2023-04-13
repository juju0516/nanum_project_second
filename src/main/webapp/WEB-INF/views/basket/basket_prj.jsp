<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : basket_첫화면 > basket_prj</title>
<!-- 프로젝트 바구니를 누르면 prj_basckt 가져오기 -->
<!-- 굿즈 바구니를 누르면 goods_basckt 가져오기 -->
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


/* , .vlt_wrap  */

.dnt_wrap {
	max-width: 1000px;
    margin: 50px auto 100px auto;
    position: relative;
    text-align: left;
    border: 1px solid rgb(0,87,147);
	border-radius: 40px;
	font-family: 'NanumSquareNeoBold';
	font-size: 15px;
 
}

.basket_name, .empty_basket {
	font-family: 'NanumSquareNeoBold';
    font-size: 35px;
    text-align: left;
    padding-left: 45px;
    padding-bottom: 30px;
    padding-top: 30px;
}


/*프로그래스바*/
 #progressbar {
 	margin-top:10px;
    appearance: none;
    width: 200px;
    margin-left: 20px;
    height: 10px; /*좀 더 얇게 조정했으나, 프로젝트 리스트만큼의 두께가 좋다면 지우면됨.*/
}
#progressbar::-webkit-progress-bar { /*배경색*/
    background:lightgray;
    border-radius:5px;
	box-shadow: inset 3px 3px 10px #ccc;
}
#progressbar::-webkit-progress-value { /*진행색*/
	background: rgb(253, 95, 0);
    background: -webkit-linear-gradient(rgb(253, 95, 0));
    border-radius:5px;
}

/*참여 및 결제 버튼*/
.payment_btn, .vlt_btn{
    font-family: 'NanumSquareNeoBold';
    font-size: 17px;
    color: rgb(253,95,0);
    border: 2px solid rgb(253,95,0);
   	background-color: #fff;
    border-radius: 5px;
    padding: 7px;
    cursor: pointer;
}

.del_btn {
    border-radius: 10px;
    border: none;
	color: #6e6e6e;
	cursor: pointer;
}
</style>
</head>
<body>
<form method="post">
<header>
	<jsp:include page="../header.jsp" />
	<div id="menu_wrap">	
		<ul class="basket_menu">
			<li class="project_menu"><a href="basket_prj.do">프로젝트바구니</a></li>
			<li class="goods_menu"><a href="basket_goods.do">굿즈바구니</a></li>
		</ul>
	</div>
</header>
<%-- 	<jsp:include page="prj_basket.jsp" /> --%>

					
<section>
<div class="basket_wrap">
	<article class="dnt_wrap">
		<table>
		<thead> <tr><th class="basket_name" colspan="4"> 프로젝트 </th></tr> </thead>
<%-- 			<c:choose>
				<c:when test="${empty basket_prj}">
					<tr><th class="empty_basket" colspan="4" style="text-align: center;">후원 바구니가 비어있습니다.</th></tr>
				</c:when>
				<c:otherwise> --%>
					<c:forEach var="k" items="${basket_prj}">
						<tr>
							<td><img class="thumbnail" src="resources/images/system/kittt.png" width="150px"></td>
							<td><span class="subject">ABCD 기부 프로젝트</span><br>
								<span class="period">기간: ${''} ~ ${''} 2023.03.06 ~ 2023.04.07</span><br>
								<progress id="progressbar" value="${''}" min="0" max="100"></progress><b>&nbsp;${''}%</b>
							 </td>
							 <td style="text-align: right;"><a href="#나누미결제"><button class="payment_btn" onclick="dnt">참여하기</button></a></td>
							 <td><a href="#목록삭제하기"><button class="del_btn">x</button></a> </td>
						</tr>
					
		 			</c:forEach>
<%-- 				</c:otherwise>
			</c:choose>  --%>
		</table>
	</article>
</div>
</section>
<footer>
	<jsp:include page="../footer.jsp" />
</footer>
</form>
</body>
</html>