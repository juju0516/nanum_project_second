<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 :story_detail</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style type="text/css">

.wrap {
    max-width: 1200px;
    margin: 100px auto 100px auto;
    position: relative;
    text-align: center;
}

.title {
	padding-left: 100px;
    max-width: 1000px;
    margin-bottom: -40px;
    display: flex;
    justify-content: space-around; /*div 크기 안에서 좌우로 대칭*/
    align-items: center; /*제목과 날짜 가운데(높낮이) 정렬*/
    flex-direction: row;
    font-family: 'NanumSquareNeoBold';
}
.subject {
	font-size: 30px;
	margin: 0px 20px 0px 0px;
	word-break: keep-all; /* 단어별로 줄바꿈 가능하도록 */
    line-height: 50px; /* 행간 간격*/
    text-align: -webkit-left;
}

.writer {
	font-size: 20px;
    min-width: 140px;
    margin: 10px -20px 10px 20px;
}
.date {
    font-size: 20px;
    min-width: 140px;
    margin: 10px;
}

.content {
	max-width: 1200px;
    margin-top: 100px;
    margin: 80px 100px 50px 100px;
    padding: 50px;
    position: relative;
    border: 1px solid rgb(0,87,147);
    border-radius: 40px;
	font-size: 18px;
	font-family: 'NanumBarunGothicLight';
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
	border-color:rgb(0, 87, 147);
	background-color: rgb(0, 87, 147); 
	font-size: 17px; 
	font-family: 'NanumSquareNeoBold'; 
	cursor: pointer;
 }
 span { margin-left: 0;}
 a { margin-right: 0;}
 img { max-width: 600px; }/* border를 넘어가지 않을 정도로 이미지 최대너비깞 지정*/
 
</style>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
</header>
<section>
	<div class="wrap">
		<div class="title">
			<span class="subject">[보조기구지원] 'ㅁㅁㅁ님'에게 보내는 선물같은 이야기</span>
			<span class="writer">관리자</span>
			<span class="date">2023-03-13</span>
		</div>
		
		<div class="content">
			<p> 'ㅁㅁㅁ님'에게 보내는 선물같은 이야기</p>
			<p> 지금 시작합니다. </p>
			<p> 거동이 불편한 'ㅁㅁㅁ'님은 누군가의 도움이 없다면 이동하기가 많이 힘이듭니다.</p>
			<p> 혼자서 움직일 수 있을 때는 바닥에서 양 팔을 이용하여 기어다닐 때 뿐이죠.</p>
			<p> 그마저도 힘에 부칩니다.</p>
			<p> 나눔에서 진행하는 보조기구 신청을 할 수 있게 도와드렸고,</p>
			<p> 신청자격이 충분했던 ㅁㅁㅁ님은 보조기구를 지원받게 되었습니다.  </p>
			<p> <img src="resources/images/system/chair.png"></p>
			<p> 이 기구는 전동모터를 이용하고, 손으로 조작하여 이동할 수 있게 도와주는 전동 휠체어 입니다.</p>
			<p> 작동법을 익혀야하고, 꽤 오랜시간 연습이 필요하지만 </p>
			<p> 턱이 없는 넓은 실내에서는 스스로 조작하여 이동이 가능해졌습니다.</p>
			<p> 조금이지만 혼자서도 할 수 있음에 감사하다던 ㅁㅁㅁ님. </p>
			<p> 지금은 실내지만 앞으로 조금씩 세상밖으로 나갈 수 있게되겠지요? </p>
			<p> ㅁㅁㅁ님의 세상과의 연결을 나눔에서 응원합니다! </p>
			
			<p> <img src="resources/images/system/give.jpg" width="300px;"></p>
		</div>
	</div>
	
	<div class="list_go">
		<a href="story_list.do"><button id="list_btn">목록</button></a>
	</div>
</section>
<footer>
	<jsp:include page="../footer.jsp" />
</footer>
</body>
</html>