<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : Project_list</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link href="resources/css/prj_list.css" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css"
	rel="stylesheet">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script type="text/javascript"></script>
<body>
	<header>
		<jsp:include page="../header.jsp" />
	</header>

	<section>
		<div id="wrap">
			<ul class="prj_menu">
				<li><a href="prj_list.do?category='진행중'">진행중</a></li>
				<li><a href="prj_list.do?category='새로 시작된'">새로시작한</a></li>
				<li><a href="prj_list.do?category='오픈예정'">오픈예정</a></li>
				<li><a href="prj_list.do?category='완료'">지난프로젝트</a></li>
			</ul>
			<div id="regi_prj">
				<a href="req_aids"><button id="btn_regi_prj"
						onclick="regi_prj_go()">등록하기</button></a>
			</div>
		</div>


		<div id="wrap_prj1">
		
		<c:choose>
			<c:when test="${empty projectList}">
				프로젝트 리스트가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${projectList}" varStatus="vs">
					<div>
						<a href="#마이페이지 좋아요에 삽입" class="heart1">
						<img src="resources/images/system/heart.png" width="40px"
							style="top: 60px; left: 300px; position: relative;"></a>
					</div>
					<div class="prj_list1">
						<a href="prj_detail.do?" class="project"> 
						<img src="resources/upload/system/attach/${pvo.prj_main_img}" width="225" height="340px">
							<progress id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
							<div class="prj_subject">[ABCD 프로젝트]</div>
							<div class="prj_period">기간: 2023.03.06 ~ 2023. 05.27</div>
							<div class="prj_Goal_point">목표금액: 2,500,000</div>
							<div class="prj_cur_point">현재후원금액: 300,000</div>
							<div class="prj_cur_people">지원인원: 24명</div>
						</a>
					</div>
				</c:forEach>
			</c:otherwise>
		
		</c:choose>
		

			<div>
				<a href="#" class="heart1"><img
					src="resources/images/system/heart.png" width="40px"
					style="top: 60px; left: 300px; position: relative;"></a>
			</div>
			<div class="prj_list1">
				<a href="#" class="project"> <img
					src="resources/images/system/dog.jpg" width="225px" height="340px">
					<progress id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
					<div class="prj_subject">[ABCD 프로젝트]</div>
					<div class="prj_period">기간: 2023.03.06 ~ 2023. 05.27</div>
					<div class="prj_Goal_point">목표금액: 2,500,000</div>
					<div class="prj_cur_point">현재후원금액: 300,000</div>
					<div class="prj_cur_people">지원인원: 24명</div>
				</a>
			</div>

			<div>
				<a href="#" class="heart1"><img
					src="resources/images/system/heart.png" width="40px"
					style="top: 60px; left: 300px; position: relative;"></a>
			</div>
			<div class="prj_list1">
				<a href="#" class="project"> <img
					src="resources/images/system/dog.jpg" width="225px" height="340px"> <progress
						id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
					<div class="prj_subject">[ABCD 프로젝트]</div>
					<div class="prj_period">기간: 2023.03.06 ~ 2023. 05.27</div>
					<div class="prj_Goal_point">목표금액: 2,500,000</div>
					<div class="prj_cur_point">현재후원금액: 300,000</div>
					<div class="prj_cur_people">지원인원: 24명</div>
				</a>
			</div>

		</div>
		<div id="wrap_prj2">

			<div>
				<a href="#" class="heart2"><img
					src="resources/images/system/heart.png" width="40px"
					style="top: 60px; left: 300px; position: relative;"></a>
			</div>
			<div class="prj_list1">
				<a href="#" class="project"> <img
					src="resources/images/system/dog.jpg" width="225px" height="340px"> <progress
						id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
					<div class="prj_subject">[ABCD 프로젝트]</div>
					<div class="prj_period">기간: 2023.03.06 ~ 2023. 05.27</div>
					<div class="prj_Goal_point">목표금액: 2,500,000</div>
					<div class="prj_cur_point">현재후원금액: 300,000</div>
					<div class="prj_cur_people">지원인원: 24명</div>
				</a>
			</div>

			<div>
				<a href="#" class="heart2"><img
					src="resources/images/system/heart.png" width="40px"
					style="top: 60px; left: 300px; position: relative;"></a>
			</div>
			<div class="prj_list1">
				<a href="#" class="project"> <img
					src="resources/images/system/dog.jpg" width="225px" height="340px"> <progress
						id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
					<div class="prj_subject">[ABCD 프로젝트]</div>
					<div class="prj_period">기간: 2023.03.06 ~ 2023. 05.27</div>
					<div class="prj_Goal_point">목표금액: 2,500,000</div>
					<div class="prj_cur_point">현재후원금액: 300,000</div>
					<div class="prj_cur_people">지원인원: 24명</div>
				</a>
			</div>

			<div>
				<a href="#마이페이지 좋아요에 삽입" class="heart2"><img
					src="resources/images/system/fullheart.png" width="40px"
					style="top: 60px; left: 300px; position: relative;"></a>
			</div>
			<div class="prj_list1">
				<a href="#" class="project"> <img
					src="resources/images/system/dog.jpg" width="225px" height="340px"> <progress
						id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
					<div class="prj_subject">[ABCD 프로젝트]</div>
					<div class="prj_period">기간: 2023.03.06 ~ 2023. 05.27</div>
					<div class="prj_Goal_point">목표금액: 2,500,000</div>
					<div class="prj_cur_point">현재후원금액: 300,000</div>
					<div class="prj_cur_people">지원인원: 24명</div>
				</a>
			</div>
			<!-- <div class="end"></div> -->
		</div>
	</section>
	<!-- 페이지기법 -->
	<section>
		<ol class="paging">
			<!-- 이전 -->
			<c:choose>
				<c:when test="true">
					<li class="disable">&lt;</li>
				</c:when>
				<c:otherwise>
					<li><a href=""> &lt; </a></li>
				</c:otherwise>
			</c:choose>

			<!-- 블록안에 들어간 페이지번호들 -->
			<c:forEach begin="1" end="4" step="1" var="k">
				<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
				<c:choose>
					<c:when test="false">
						<li class="now">2</li>
					</c:when>
					<c:otherwise>
						<li><a href="">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 -->
			<c:choose>
				<c:when test="0">
					<li class="disable">&gt;</li>
				</c:when>
				<c:otherwise>
					<li><a href=""> &gt;</a></li>
				</c:otherwise>
			</c:choose>
		</ol>
	</section>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
