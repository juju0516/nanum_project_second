<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum Header</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<style type="text/css">
header{
	/*position: fixed;*/
	top:0;
	left:0;
	right:0;
	text-align: left;
}

#title-logo {
	font-size: 70px; 
	font-weight: bold; 
	font-family: 'NanumSquareNeoHeavy'; 
	color: rgb(0,87,147); 
	margin: 30px 0px 10px 50px;
}

#title-container {
	display: flex;
	flex-direction: row;
}

#title-container > .title-icon1 {
	margin-top: 20px;
 	margin-left: auto;

}

#title-container > .title-icon2 {
	margin: 20px 0px 0px 0px;
}

#title-container > .title-icon3 {
	/* margin: 20px 70px 0px 0px; */
	margin: 20px 0px 0px 0px;
}

#title-container > .title-login {
	margin: 30px 0px 0px 0px;
	font-family: 'NanumBarunGothic'; 
}

ul.menu {
	list-style-type: none;
	font-size: 20px; 
	font-family: 'NanumSquareNeoBold'; 
}

ul.menu a {
	float: right; 
	background-color: white;
	color: black;
	text-decoration: none;
	padding: 20px 40px;
	border-right: 3px solid white;
}
	
ul.menu a:hover {
	background-color: lightgray;
	color: rgb(0,87,147);
	font-weight: bold;
	font-size: 20px;
}

#div_donation{
	float: right;
	margin: 0px 70px 0px 100px;
}
	
#btn_donation{
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 120px; 
	height: 50px; 
	color: white; 
	border-color:rgb(253, 95, 0);
	background-color: rgb(253, 95, 0); 
	font-size: 19px; 
	font-family: 'NanumSquareNeoBold'; 
}
</style>
</head>
<body>
<header>
	<c:choose>
	<c:when test="${login=='ok'}">
	<div id="title-container">
		<div id="title-logo"><a href ="main_page.do" style="color: rgb(0,87,147)"> NANUM </a></div>
		<div class="title-icon1"><a href ="search.do"><img src="resources/images/system/search.png" style="width:50px"></a></div>
		<div class="title-icon2"><a href ="basket_prj.do"><img src="resources/images/system/cart.png" style="width:50px"></a></div>
		<div class="title-icon2"><a href ="alarm_list_go.do"><img src="resources/images/system/bell2.png" style="width:50px"></a></div>
		<div class="title-icon2"><a href ="member_mypage.do"><img src="resources/images/system/profile.png" style="width:50px"></a></div>
	</div> 
	</c:when>
	<c:otherwise>
	<div id="title-container">
		<div id="title-logo"><a href ="main_page.do" style="color: rgb(0,87,147)"> NANUM </a></div>
		<div class="title-icon1"><a href ="search.do"><img src="resources/images/system/search.png" style="width:50px"></a></div>
		<div class="title-login"><a href ="login_login.do" style="margin-right: 10px;">로그인 </a> | <a href ="login_sign_up.do" style="margin-left: 10px;"> 회원가입 </a></div>
		<div class="title-icon3"><a href="mngr_login.do"><img src="resources/images/system/admin3.png" style="width:50px"></a></div>
	</div> 
	</c:otherwise>
	</c:choose>
	<nav>
		<div id="div_donation">
			<a href="prj_flag_list.do"><button id="btn_donation" onclick="donatioln_go()">참여하기</button></a>
		</div>
		<ul class="menu">		
			<li><a href="review_list.do">후기</a></li>
			<li><a href="aids_main_go.do">보조기구신청</a></li>
			<li><a href="sp_donator_list_go.do">기념일후원</a></li>
			<li><a href="goods_list.do">굿즈</a></li>
			<li><a href="prj_list.do">프로젝트</a></li>
			<li><a href="story_list.do">스토리</a></li>
		</ul>		
	</nav>
</header>
<hr align="center" noshade="noshade" width="98%" style="border-bottom: 2px solid lightgray">
</body>
</html>