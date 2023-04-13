<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : story_list</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/project_list.css" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">


#wrap_story1 {
/* 	justify-content: space-evenly; 이미지 간격 동일하게
 */
 	display: flex;
 	justify-content: center;
 	align-content: center;
	position: relative;
	width: 100%;
	border: 1px solid white;
	margin-top: 50px;
}
#wrap_story2 {
/* 	justify-content: space-evenly; 이미지 간격 동일하게
 */
 	display: flex;
 	justify-content: center;
 	align-content: center;
	position: relative;
	width: 100%;
	border: 1px solid white;
	margin-bottom: 50px;
}


.story_list{
    font-family: 'NanumBarunGothicLight'; 
/* 	font-size:12px; */
    color: black;
   /*  margin-top:100px;
    margin-bottom: 60px; */
}

.storycase{
	text-align: center;	
	padding:50px;
    display: inline-block;
    
    text-decoration:none;
    color: black;
 
	margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px; 
    width:300px; /* 기존값 230*/

    word-break: keep-all; /* 단어별로 줄바꿈 가능하도록 */
    line-height: 25px; /* 행간 간격*/
    
}

.story_subject{
  	font-size: 18px;
  	font-weight: bold;
	text-align: center;
    margin-top: 20px;
    margin-bottom: 4px;
}

.story_subcontent{
  	font-size: 15px;
	text-align:left;
    margin-top: 20px;
    margin-bottom: 4px;
}
img {
	width: 300px;
	max-width: 320px;
	border-radius: 5%; /*이미지 모서리 둥글게*/
	
}
</style>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
	<jsp:include page="story_top.jsp" />
</header>
<section>
	<div id="wrap_story1">
		 <div class="story_list">
           <a href="story_detail.do" class="storycase">
               <img src="resources/images/system/237.jpg">
               <div class="story_subject"> [보조기구지원] 'ㅁㅁㅁ님'에게 보내는 선물같은 이야기</div>
               <div class="story_subcontent">보조기구 지원을 받은 'ㅁㅁㅁ 님'의 일상이 어떻게 바뀌었을까요?</div></a>
         </div>
		 <div class="story_list">
           <a href="#" class="storycase">
               <img src="resources/images/system/279.jpg">
               <div class="story_subject"> [기념일후원후기] 아기의 태명으로 기부했어요</div>
               <div class="story_subcontent">선물같은 아이가 찾아와 좋은일에 동참하고 싶었어요.</div></a>
          </div>

		 <div class="story_list">
           <a href="#" class="storycase">
               <img src="resources/images/system/866.jpg">
               <div class="story_subject"> [프로젝트후기] 재능나눔에 참여했어요</div>
               <div class="story_subcontent">몸소 실천했던 자원봉사! 내용이 궁금하시죠?</div></a>
         </div>
     </div>
           
     <div id="wrap_story2">
		 <div class="story_list">
           <a href="#" class="storycase">
       			<img src="resources/images/system/237.jpg">
              	<div class="story_subject"> [보조기구지원] 보조기구 지원 그후 ..</div>
	          	<div class="story_subcontent">보조기구 지원을 받은 'ㅁㅁㅁ 님'의 일상이 어떻게 바뀌었을까요?</div></a>
         </div>
           

		 <div class="story_list">
           <a href="#" class="storycase">
               <img src="resources/images/system/866.jpg">
               <div class="story_subject"> [프로젝트후기] ABCD 프로젝트 후기</div>
               <div class="story_subcontent">ABCD프로젝트에 참여하진 '모메모'님의 후기입니다.<br>모두 궁금하시죠?</div></a>
         </div>

		 <div class="story_list">
           <a href="#" class="storycase">
               <img src="resources/images/system/279.jpg">
              <div class="story_subject"> [프로젝트후기] ABCD 프로젝트 후기</div>
               <div class="story_subcontent">ABCD프로젝트에 참여하진 '모메모'님의 후기입니다.<br>모두 궁금하시죠?</div></a>
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