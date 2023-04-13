<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : prj_detail_page</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<style type="text/css">

html,body{
	height: 100%;
}

body {
	width: 100%;
    position: relative;
    
	color: black;
	display: flex;
  	flex-direction: column;   	
  	/*전체 폰트?*/
  	font-family: 'NanumBarunGothicLight'; 
  	
}
section{
	flex: 1;
}

footer{
	text-align: left;
	text-decoration: none;
}


/* 프로젝트 결과 + 옵션바 wrap 한 div */
.prj_result {
/*
	max-width: 1000px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
 */
    max-width: 1200px;
    margin: 100px auto auto;
    position: relative;
    column-gap: 500px;

}

.optView2{
	width: 350px;
	min-height: 500px; /*기본 옵션바 길이지정*/
	max-height: auto; /*결과 출력시 길이가 얼만큼일지 모르기때문에 가변형으로 지정함.*/
	background-color: rgb(224, 224, 224);
	color: black;
	float: right; 
	position: sticky; /*스크롤을 내려도 바가 계속 보이도록 지정*/
	top: 100px;
}

p.period{
	margin: 30px 30px;
}
span.status{
    margin: 30px 30px;
    font-size: 23px; 
    font-weight: bold;
}
.progresss_wrap {
   margin: 70px 30px;
   margin-top: 100px;
}

/* 프로젝트 결과출력창 */
.pjr_result_content{
	 margin: 30px 20px;
	 padding:10px;
	 min-height: 200px;
	 max-height: auto;
	 background-color: #fff;
	 border: 1px solid #c0c0c0;
	 border-radius: 5px;
	 word-break: keep-all; /* 단어별로 줄바꿈 가능하도록 */
}

span.nanumi_goal{
	margin-left: 0;
}

/*프로그래스바*/
.progressbar {
 	margin-top:10px;
    margin-right:5px;
    appearance: none;
    width: 85%;
}
.progressbar::-webkit-progress-bar { /*배경색*/
    background:lightgray;
    border-radius:5px;
	box-shadow: inset 3px 3px 10px #ccc;
}
.progressbar::-webkit-progress-value { /*진행색*/
	background: rgb(253, 95, 0);
    background: -webkit-linear-gradient(rgb(253, 95, 0));
    border-radius:5px;
}

.btn_wrap{
	display: flex;
	flex-direction: column;
}


#dnt_flag_btn{
	margin-right:-10px;
 	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 350px; 
	height: 50px; 
	color: white; 
	border-color:rgb(253, 95, 0);
	background-color: rgb(253, 95, 0); 
	font-size: 17px; 
	font-family: 'NanumSquareNeoBold';
	cursor: pointer; 
 }

/* 내용 관련 (메인타이틀 이미지 내용 등) */
.main_img {
    display: flex;
    align-content: center;
    flex-direction: row;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: flex-start; /* div 안에서 시작부분에 맞추자 */
}

div#icons {
    margin-top: auto;
    margin-left: 10px;
}

.main_img{
	display: flex; /*icons(공유,뷰 아이콘) 가로정렬위해 부모속성에 flex줬음*/
}


.prj_title {
    display: flex;
    margin-top: 20px;
    max-width: 650px; /* icons 너비보다 넘어가지 않도록 너비지정 */
    word-break: keep-all; /* 단어별로 줄바꿈 가능하도록 */
    font-size: 30px;
    font-family: 'NanumSquareNeoBold';
}

.prj_subcontent {
	max-width: 650px; /* icons 너비보다 넘어가지 않도록 너비지정 */
    word-break: keep-all; /* 단어별로 줄바꿈 가능하도록 */
    font-size: 15px;
}

/* 프로젝트 내용관련 */
.prj_content{
	padding-top: 50px;
}
.prj_content img {
	max-width: 650px;	
}


/* 더보기버튼 */
.view_more_btn_style {
    border: solid 1px #9d9d9d;
    background-color: #ffffff;
    width: 100%;
    height: 45px;
    border-radius: 22.5px;
    cursor: pointer;
}


/* 태그리스트 */
.prj_tag_wrap{
    float: left;
    width: 630px;
    padding-top: 50px;
    padding-bottom: 50px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.prj_tag_list{
	padding-left: 0;
}

.prj_tag_list .prj_tag {
    float: left;
    box-sizing: border-box;
    background-color: #fff;
    border: 1px  solid #e0e0e0;
    border-radius: 10px;
    cursor: pointer;
    margin: 4px;
    list-style: none;
    padding: 10px 10px;
}

span.tag{ /*footer의 span태그가 먹혀서 클래스를 따로 주고 스타일따로 적용했음.*/
	margin-left: 0;
}


/* 응원메세지 */
.msg_wrap{
	font-family: 'NanumSquareNeo';
	float: left;
    width: 630px;
    padding-top: 50px;
    padding-bottom: 50px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.msg_ul .msg_list {
    list-style: none;
     margin: 4px; 
     padding-left: 5px;
}
.msg{
	margin-left: 0;
    vertical-align: 20px;
}

/* 참여한 프사만*/
.participate_people_wrap {
	float: left;
	display: flex;
    width: 630px;
    padding-top: 50px;
    padding-bottom: 50px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.participate_people .parti_people_ul {
    position: relative;
    z-index: 1;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    width: 100%;
    -webkit-transition-property: -webkit-transform;
    transition-property: -webkit-transform;
    transition-property: transform;
    transition-property: transform, -webkit-transform;
}

il.parti_people_li > p { /*프사와 닉네임 간격 조정*/
    margin-top: 0;
    font-family: 'NanumSquareNeo';
    padding-left: 3px;

}

/* 참여한 사람들 더 보기 */
.people_more{
	width: 70px; 
	height: 30px; 
	border-color: #e0e0e07d;
	border-radius: 20px ;
	font-family: 'NanumSquareNeoBold';
	cursor: pointer; 
}

il.parti_people_li_more { /*더보기 버튼 가운데로 위치 조정*/
    display: flex;
    margin-top: 15px;

}
</style>
</head>

<body>
<header>
	<jsp:include page="../header.jsp" />
</header>


<section class="prj_result_wrap">
	
	<div class="prj_result"> <!-- 사이드바와 프로젝트 상세내용 전체를 하나로 묶자. -->
	<!-- 프로젝트 메인이미지 + 짧은 소개글  div로 묶기-->
	<!-- 프로젝트 상세 내용은 article로 묶기 -->
	<!-- 사이드바도 article로 묶기( 사이드바(div) + 버튼까지(div) )  -->
	<!-- 태그 article로 wrap -->
	
	
		<!-- 오른쪽상단 현황박스 (기간, 종료됨, 프로그래스바 1 or 2) aside바 -->
		<article class="optView2">
		<!-- 	<div class="optView"> -->
			<div>
				<p class="period">2023.03.01 ~ 2023.03.31</p>
				<span class="status" >종료된 프로젝트</span>
				
				<!-- 여기부터 프로그래스바   -->
				<div class="progresss_wrap">
					<div class="goal_nanumi_prg">
					<progress class="progressbar" value="92" min="0" max="100"></progress><b>92%</b>
						<br><span class="nanumi_goal">목표 1,500,000</span> 나누미</p>
					</div>
					<div class="goal_people_prg">
					<progress class="progressbar" value="30" min="0" max="100"></progress><b>33명</b>
						<br><span class="nanumi_goal">목표인원 100명</span>
					</div>
				</div>
				
				<!-- 프로젝트 결과를 담을 텍스트 필드 단.  -->
				<div class="pjr_result_content">
					<p>프로젝트 결과를 출력하는 곳 입니다.</p>
					<p>프로젝트 결과를 출력하는 곳 입니다.</p>
					<p>프로젝트 결과를 출력하는 곳 입니다.</p>
					<p>프로젝트 결과를 출력하는 곳 입니다.</p>
					<p>프로젝트 결과를 출력하는 곳 입니다.</p>
					<p>프로젝트 결과를 출력하는 곳 입니다.</p>
	
				</div>
				
			</div>
			<!-- 버튼 들어가는 부분 -->
			<span></span>
			<div class="btn_wrap">
					<!-- 프로젝트리스트로 이동하기 -->
				<a href="prj_list.do"><button id="dnt_flag_btn">다른 프로젝트 보러가기</button></a>
			</div>
		 </article>
		
		<!-- 왼쪽 프로젝트 메인단 article --><!-- div < 이미지 >-< 제목 >-<간단설명> /div  -->
		<article>
			<!-- 메인이미지 및 제목 -->
			<div class="main_title_wrap">
				<div class="prj_img_wrap">
					<!-- 찜하기 하트 !! 하트 위치 변경 필요.  -->
					<!-- <div>
				       <a href="#" class="heart1"><img src="resources/images/system/heart1.png" width="40px" style="top: 60px; left: 300px; position: relative;"></a> 
					</div> -->
					
						<div class="main_img">
				       	<img src="resources/images/system/m_main_img.jpg" >
				       	<!-- 공유, 뷰 아이콘 수직정렬 하기 -->
						<div id="icons">
						<img src="resources/images/system/share.png" style="width: 30px;" onclick="alert('해당프로젝트 주소뜨기')">
						<br><img src="resources/images/system/view.png" style="width: 30px;">
						<span class="viewChk" style="font-size: 9px; vertical-align: 14px; margin-left: 0;">1000</span>
						</div>
					</div>
				</div><!-- 하트 포함 이미지 -->
				
			       	<div class="prj_title">[ABCD 프로젝트 : 보육시설 보수공사] </div>
			       	<p class="prj_subcontent"> ABCD 프로젝트는 abcd 보육시설 보수공사를 지원하여 기거하는 아이들의 처우개선에 동참하고자 합니다.</p>
			       	
			    </div>
		</article>
		
		<!-- 더보기 표시하는 부분 -->
		<article class="prj_substance">
			<!--  더보기 만들기 위해 높이를 600으로 지정했기 때문에 footer가  600 높이에 만들어진다. 높이 없애면 원래자리로 돌아간다.  -->
			<!-- <div class="moreHidden" style="height: 600px;">  -->
			<div class="moreHidden" style="height:"> 
		        <div class="prj_content">  
	               <p> 이 곳은 프로젝트 세부내용이 시작되는 곳 입니다. </p>
	               <p> ABCD 프로젝트는 어떻게 시작하게 되었나요? </p>
	               <p> abcd 보육시설의 열악한 환경으로 인해 기거하는 아동들의 건강에 악영향을 미치고 있습니다.</p>
	               <p> 이러한 환경을 개선하고자 프로젝트를 진행하게 되었습니다. </p>
	               <p> <img src="resources/images/system//puppy.jpg"> </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> <img src="resources/images/system/kob.png"> </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> <img src="resources/images/system/special.png"> </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> 설명 설명 설명 설명 설명 설명 설명 설명 설명 </p>
	               <p> ... </p>
		        </div>
			</div>
			<!-- 더보기 버튼 관련이나 일단은 주석 처리 -->
			<!--  <div class="view_more">
				<button id="view_more_btn" type="button" class="view_more_btn_style">
					<span>더보기</span>
				</button>
			</div> -->
		
		</article>
		
		<!-- 태그관련 -->
		<article>
			<div class="prj_tag_wrap">
				<ul class="prj_tag_list">
					<li class="prj_tag" onclick="태그클릭시가는 곳">
						<span class="tag">#보육시설</span>
					</li>
					<li class="prj_tag" onclick="태그클릭시가는 곳">
						<span class="tag">#재능나눔</span>
					</li>
					<li class="prj_tag" onclick="태그클릭시가는 곳">
						<span class="tag">#후원</span>
					</li>
					<li class="prj_tag" onclick="태그클릭시가는 곳">
						<span class="tag">#아동</span>
					</li>
					<li class="prj_tag" onclick="태그클릭시가는 곳">
						<span class="tag">#기부</span>
					</li>
					<li class="prj_tag" onclick="태그클릭시가는 곳">
						<span class="tag">#나눔후원</span>
					</li>
				</ul>
			</div>
		</article>
		
		<!-- 왼쪽 하단 참여한 사람들 : 프사 + 응원메세지 -->
		<article class="msg_wrap">
			<div>
				<img src="resources/images/system/people.png" width="50px;">
					<span style="font-family: 'NanumSquareNeoBold'; font-size: 20px; vertical-align: 20px; ">참여한 사람들</span>
					<ul class="msg_ul">
						<li class="msg_list"><a href="#프사정보"><img src="resources/images/system/profile.png" width="40px"></a>
						<span class="msg">프로젝트에 참여했어요! 응원합니다!! </span>
						 </li>
						<li class="msg_list"><a href="#프사정보"><img src="resources/images/system/profile.png" width="40px"></a>
						<span class="msg">응원메세지가 출력되는 곳 입니다. </span>
						 </li>
						<li class="msg_list"><a href="#프사정보"><img src="resources/images/system/profile.png" width="40px"></a>
						<span class="msg">응원메세지가 출력되는 곳 입니다. </span>
						 </li>
						 <!-- 여기에도 더보기란 만들기  -->
					</ul>
			</div>
		
		</article>
		<!-- 참여한 사람들 프사만 모음 -->
		<!-- 더보기 누르면 프사 아이콘만 전체 나오기 -->
		<article class="participate_people_wrap">
			<div class="participate_people">
				<ul class="parti_people_ul">
					
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
					<il class="parti_people_li_more" onclick="parti_people_more_view()">
						<button type="button" class="people_more">더보기 ></button>
					</il>
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