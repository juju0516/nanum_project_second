<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<style type="text/css">
footer{
	margin-left: 0px;
	color: black;
	width: 100%;
	height: 120px;
	bottom: 0px;
	font-family: 'NanumBarunGothicLight'; 
	
/* 	postion: absolute; */
}

nav{
	margin-left: 20px;
	text-decoration: none;
} 
 
a {
	text-decoration: none;
	color: black;
	margin-right: 20px;
}

span{
	margin-left: 20px;
	text-decoration: none;
} 
 
</style>
</head>
<body>
<div>
<!-- 	<hr> -->
	<hr align="center" noshade="noshade" width="98%" style="border-bottom: 2px solid lightgray">
	<br>
	<footer>
		<nav>
			<%-- 일부 로그인시 링크 이동하게 처리하기 오시는길, 1대1 문의하기 div? 쪽에 ID부여 후 a링크 뒤에 ID 주기--%>
			<a href="info.do">개인 정보 처리 방침</a>
			<a href="TOS.do">이용약관</a>
			<a href="story_introduce.do?contact:아이디 있는 곳 링크 바로가기 만드시오 상묵">오시는길</a>
			<a href="member_inquiry.do">1:1문의하기</a>
			<a href="story_introduce.do?faq::아이디 있는 곳 링크 바로가기 만드시오 상묵">FAQ</a>
		</nav>
		<p>
			<span>서울시 마포구 백범로 케이터틀 ICT 한국 인재 개발원</span><br>
			<span>전화번호 02-1004-1004</span><br>
		</p>
	</footer>
</div>
</body>
</html>