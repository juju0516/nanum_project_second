<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : 참여가능리스트</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/prj_list.css" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">
.maintitle {
	font-family: 'NanumSquareNeoBold';
    font-size: 40px;
    text-align: center;
    padding: 50px;er;	
	}
	
#wrap {
    flex-direction: column;
    align-items: center;

}
</style>
</head>
<body>
<header>
		<jsp:include page="../header.jsp" />
	</header>

	<section>
	<div id="wrap">	
	
		<span class="maintitle">참여가능 리스트</span>
		<ul class="prj_menu">
			<li><a href="#정기후원리스트">정기후원</a></li>
			<li><a href="#일시후원리스트">일시후원</a></li>
		</ul>	
	</div>


	<div id="wrap_prj1">
		<!-- <div>
           <a href="#" class="heart1"><img src="resources/images/system/heart1.png" width="40px" style="top: 60px; left: 300px; position: relative;"></a>
		</div> -->
		 <div class="prj_list1">
           <a href="prj_detail.do" class="project">
               <img src="resources/images/system/32595.jpg" width="225px;" height="300px;">
               <progress id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
               <div class="prj_subject"> [아름다운 벽 프로젝트] </div>
               <div class="prj_period"> 기간: 2023.03.06 ~ 2023. 05.27</div>
               <div class="prj_Goal_point"> 목표금액: 2,500,000 </div>
               <div class="prj_cur_point"> 현재후원금액: 300,000 </div>
               <div class="prj_cur_people"> 지원인원: 24명 </div>
           </a>
           </div>
           
          <!--  <div>
           <a href="#" class="heart1"><img src="resources/images/system/heart.png" width="40px" style="top: 60px; left: 300px; position: relative;"></a>
		</div> -->
		 <div class="prj_list1">
           <a href="#" class="project">
               <img src="resources/images/system/groupvlt.jpg" width="225px;" height="300px;">
               <progress id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
               <div class="prj_subject"> [뚝딱뚝딱 프로젝트] </div>
               <div class="prj_period"> 기간: 2023.03.06 ~ 2023. 05.27</div>
               <div class="prj_Goal_point"> 목표금액: 2,500,000 </div>
               <div class="prj_cur_point"> 현재후원금액: 300,000 </div>
               <div class="prj_cur_people"> 지원인원: 24명 </div>
           </a>
           </div>
           
         <!--   <div>
           <a href="#" class="heart1"><img src="resources/images/system/heart.png" width="40px" style="top: 60px; left: 300px; position: relative;"></a>
		</div> -->
		 <div class="prj_list1">
           <a href="#" class="project">
               <img src="resources/images/system/hands.jpg" width="225px;" height="300px;">
               <progress id="progressbar" value="10" min="0" max="100"></progress><b>30%</b>
               <div class="prj_subject"> [반짝반짝 프로젝트] </div>
               <div class="prj_period"> 기간: 2023.03.06 ~ 2023. 05.27</div>
               <div class="prj_Goal_point"> 목표금액: 2,500,000 </div>
               <div class="prj_cur_point"> 현재후원금액: 300,000 </div>
               <div class="prj_cur_people"> 지원인원: 24명 </div>
           </a>
           </div>
           
           </div>
          
    </div>    
	</section>
	<!-- 페이지기법 -->
	<section>
		<ol class="paging">
			<!-- 이전 -->
			<c:choose>
				<c:when test="true">
					<li class="disable"> &lt; </li>
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
			   		<li class="disable"> &gt;</li>
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