<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : notice_detail</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style type="text/css">
.active{
	font-size: 20px;
}

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
			<span class="subject">후원참여 안내 및 공지사항</span>
			<span class="writer">관리자</span>
			<span class="date">2023-03-44</span>
		</div>
		
		<div class="content">
			<p> ** 공지사항 **</p>
			<p> NANUM은 작은기부부터 실천 할 수 있는 곳 입니다.</p>
			<p> 다양한 프로젝트에 참여하거나 직접 등록할 수 있습니다.(단, 등록시 심사과정이 있습니다.)</p>
			<p> 재능나눔, 정기후원, 일시후원, 굿즈구매는 가입 후 로그인을 헤야 참여하실 수 있습니다.  </p>
			<p> 여러분의 많은 참여 부탁드립니다.</p>

		</div>
	</div>
	
	<div class="list_go">
		<a href="story_notice.do"><button id="list_btn">목록</button></a>
	</div>
</section>
<footer>
	<jsp:include page="../footer.jsp" />
</footer>
</body>
</html>