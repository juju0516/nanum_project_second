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
			<p> 이곳은 스토리 상세 내용을 보는 페이지 입니다.</p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 사진도 포함될 수 있습니다.  </p>
			<p> summernote를 이용할 거니까요!  </p>
			<p><img src="resources/images/system/886.png"></p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p><img src="resources/images/system/special.png"></p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용 </p>
			<p><img src="resources/images/system/kittt.png"></p>
			<p> 스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
			<p> 스토리 내용 내용 내용  스토리 내용 내용 내용  스토리 내용 내용 내용 </p>
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