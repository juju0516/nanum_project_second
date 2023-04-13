<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : Search 화면</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style type="text/css">

.search_wrap {
    max-width: 1000px;
    margin: 100px auto auto;
    position: relative;
}

.rec_wrap {
	max-width: 1000px;
    margin: 100px auto auto;
    position: relative;
}


.search_field {
	display: flex;
    justify-content: center;
    margin-top: 100px;
}

input.search_keyword {
    width: 800px;
    height: 50px;
    border-radius: 5px;
    font-family: 'NanumBarunGothicLight'; 
    font-size: 20px;
    padding-left: 10px;
	
}

.search_field img {
    width: 65px;
    vertical-align: -30px;
    margin-left: -66px; /* 검색창 안에 이미지 넣기 위해 간격 조정함.*/
    margin-top: 22px;
    z-index: 1;
    }
    

    /* 추천키워드 관련*/
.rec_keyword_wrap {
    width: 800px;
    margin-left: 100px;
    margin-bottom: 100px;
    
}

.rec_keyword_list {
    padding-left: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: 50px;
}

.rec_keyword_list .rec_keyword {
    list-style: none;
    background-color: #e0e0e0;
    border: 1px  solid #e0e0e0;
    border-radius: 10px;
    cursor: pointer;
    margin: 4px;
    padding: 13px;
    width: 120px;/* 검색어박스 크기는 동일하게 설정*/
    height: 20px;
    text-align: center;
    font-family: 'NanumSquareNeoBold';
    font-size:17px;
}

.rec_keyword span {
    margin-left: 0;
    text-decoration: none;
}
    
span.title {
    font-family: 'NanumSquareNeoBold';
    font-size: 35px;
    display: flex;
    justify-content: flex-start;
    margin-left: 80px;
    margin-top: 100px;
}
</style>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
</header>

<section>
		<div class="search_wrap">
		<!-- 검색필드부분 -->
			<div class="search_field">
				<form method="post">
				
					<input class="search_keyword" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요">
					<!-- search_Keyword 필요 -->
					<a href="search_result.do"><img src="resources/images/system/search.png"></a>
				</form>
			</div>
	
			<!-- 추천키워드부분  -->
			<article class="rec_wrap">
				<span class="title">추천 키워드</span>
				<div class="rec_keyword_wrap">
				<ul class="rec_keyword_list">
					<li class="rec_keyword" onclick="후원검색결과이동">
						<span>후원</span>
					</li>
					<li class="rec_keyword" onclick="재능나눔검색결과이동">
						<span>재능나눔</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>굿즈</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>일시후원</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>기부</span>
					</li>
					<li class="rec_keyword" onclick="후원검색결과이동">
						<span>기념일기부</span>
					</li>
		
					<li class="rec_keyword" onclick="재능나눔검색결과이동">
						<span>프로젝트</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>스토리</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>프로젝트결과</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>봉사활동</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
					<span>스토리</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>가입하기</span>
					</li>
					<li class="rec_keyword" onclick="태그클릭시가는 곳">
						<span>나눔</span>
					</li>
				</ul>
				</div>
		</article>
		</div>
</section>

<footer>

	<jsp:include page="../footer.jsp" />
</footer>

</body>
</html>