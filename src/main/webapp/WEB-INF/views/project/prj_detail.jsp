<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Nanum 🌷 : prj_detail</title>
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


/* 프로젝트 상세 + 옵션바 wrap 한 div */
.prj_detail {
    max-width: 1200px;
    margin: 100px auto auto;
    position: relative;
    column-gap: 500px;
}
 
.optView2{
	width: 350px;
	height: 500px;
	background-color: rgb(224, 224, 224);
	color: black;
	float: right; 
	position: sticky;
	top: 100px;
}

p.period{
	margin: 30px 30px;
}
span.d-day{
    margin: 30px 30px;
}
.progresss_wrap {
   margin: 30px 30px;
   margin-top: 100px;
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
	margin: 100px 30px 20px 30px;
}
 
#basket_btn{
 	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 130px; 
	height: 50px; 
	color: white; 
	border-color:rgb(0, 87, 147);
	background-color: rgb(0, 87, 147); 
	font-size: 17px; 
	font-family: 'NanumSquareNeoBold'; 
	cursor: pointer;
 }
 
#dnt_flag_btn{
	margin-left:20px;
 	margin-right:-20px; 
 	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 130px; 
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	
	window.onload = function () {
		
		// D-Day 계산하기
		// 종료일을 Date 객체로 변환합니다.
		const endDate = new Date("${prjvo.prj_end_date.substring(0, 10)}");
		// 현재 날짜를 가져옵니다.
		const now = new Date();
		// 종료일과 현재 날짜의 차이를 계산합니다.
		const diffTime = endDate.getTime() - now.getTime();
		const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
		  // 결과를 HTML 요소에 출력합니다.
	    document.getElementById("d-day").innerHTML = "D-"+ diffDays ;
	}


	
	
	// 바구니 담기	
	function add_prj_basket() {
		alert('해당프로젝트를 나눔바구니에 담았습니다.');
	}
	
	function add_flag() {
		
	}
</script>

</head>

<body>
<form method="post">
<header>
	<jsp:include page="../header.jsp" />
</header>


<section class="prj_detail_wrap">
	
	<div class="prj_detail">
		<article class="optView2">
			<div>
				<p class="period">${prjvo.prj_begin_date.substring(0,10)} ~ ${prjvo.prj_end_date.substring(0,10)}</p>
				<p style="font-size: 12px;"><span id="d-day" style="font-size: 20px; font-weight: bold; padding-left: 10px"></span>(종료일까지)</p>
				
				<!-- 여기부터 프로그래스바   -->
				<div class="progresss_wrap">
					<div class="goal_nanumi_prg">
					<progress class="progressbar" value="${Math.round(((prjvo.cur_point + k.r_cur_point) / prjvo.goal_point) * 100)}" min="0" max="100"></progress>
					<b style="font-size: 12px;">${Math.min(Math.round(((prjvo.cur_point + k.r_cur_point) / prjvo.goal_point) * 100), 100)}%</b>
						<br><span class="nanumi_goal" >목표 <fmt:formatNumber value="${prjvo.goal_point * 500}" pattern="#,##0" /></span> 원</p>
					</div>
					<c:if test="${prjvo.vlt_flag == 'Y'}">
						<div class="goal_people_prg">
						<progress class="progressbar" value="${Math.round((prjvo.cur_num_people / prjvo.goal_num_people) * 100)}" min="0" max="100"></progress><b style="font-size: 12px;">${prjvo.cur_num_people}명</b>
							<br><span class="nanumi_goal">목표인원 <fmt:formatNumber value="${prjvo.goal_num_people}" />명 </span>
						</div>
					</c:if>
				</div>
				
				<!-- 버튼 들어가는 부분 -->
				<div class="btn_wrap">
					<input type="hidden" name="project_idx" value="${prjvo.project_idx}">
					<button id="basket_btn" onclick="add_prj_basket(this.form)">나눔바구니</button>
					<!-- 정보를 가지고 후원폼으로 이동해야함. -->
					<button id="dnt_flag_btn" onclick="flag(this.form)">참여하기</button>
				</div>
			</div>
		 </article>
		
		<article>
			<!-- 메인이미지 및 제목 -->
			<div class="main_title_wrap">
				<div class="prj_img_wrap">
					<!-- 찜하기 하트 !! 하트 위치 변경 필요.  -->
					<!-- <div>
				       <a href="#" class="heart1"><img src="resources/images/system/heart1.png" width="40px" style="top: 60px; left: 300px; position: relative;"></a> 
					</div> -->
					
						<div class="main_img">
				       	<img src="resources/upload/${prjvo.id}/attach/${prjvo.prj_main_img}"  style="max-width: 600px; max-height: 500px;" >
				       	<!-- 공유, 뷰 아이콘 수직정렬 하기 -->
						<div id="icons">
						<!-- cPage를 어떻게 가져오지? -->
						<img src="resources/images/system/share.png" style="width: 30px; cursor: pointer;" onclick="pageLocation()" >
						<br><img src="resources/images/system/view.png" style="width: 30px;">
						<span class="viewChk" style="font-size: 9px; vertical-align: 14px; margin-left: 0;">${prjvo.prj_hit}</span>
						</div>
					</div>
				</div>
				
			       	<div class="prj_title">${prjvo.prj_title} </div>
			       	<p class="prj_subcontent"></p>
			       	
			    </div>
		</article>
		
		<article class="prj_substance">
			<%--  더보기 만들기 위해 높이를 600으로 지정했기 때문에 footer가  600 높이에 만들어진다. 높이 없애면 원래자리로 돌아간다.  --%>
			<%-- <div class="moreHidden" style="height: 600px;">  --%>
		        <div class="prj_content">  
	              ${prjvo.prj_content}
		        </div>
		<%-- 	</div> --%>
			<%-- 더보기 버튼 관련이나 일단은 주석 처리 --%>
<%--			  <div class="view_more">
				<button id="view_more_btn" type="button" class="view_more_btn_style">
					<span>더보기</span>
				</button>
			</div> 
		--%>
		</article>
		
		<%-- 태그관련 --%>
		<article>
			<div class="prj_tag_wrap">
				<ul class="prj_tag_list">
					  <c:set var="tag" value="${prjvo.tag}" />
					  <c:set var="arraytaglist" value="${tag.split(' ')}" />
						  <c:forEach var="arraytag" items="${arraytaglist}">
						    <li class="prj_tag" onclick="태그클릭시가는 곳">
						      <span class="tag">${arraytag}</span>
						    </li>
						  </c:forEach>
				</ul>
			</div>
		</article>
		
		
		<!-- 왼쪽 하단 참여한 사람들 : 프사 + 응원메세지 -->
		<article class="msg_wrap">
			<div>
				<img src="resources/images/system/person.png" width="50px;">
					<span style="font-family: 'NanumSquareNeoBold'; font-size: 20px; vertical-align: 20px; ">참여한 사람들</span>
					<ul class="msg_ul">
						<c:forEach var="k" items="${donator}">
							<li class="msg_list"><a href="#프사정보">
						<%-- donator 정보와 member 정보 필요.	<c:if test="${}"> --%>
								<img src="resources/images/system/profile.png" width="40px">
	<%-- 						</c:if> --%>
							</a>
								<span class="msg">응원메세지가 출력되는 곳 입니다. </span>
							 </li>
						</c:forEach>
					</ul>
			
			</div>
		
		
		</article>
		<!-- 참여한 사람들 프사만 모음 -->
		<!-- 더보기 누르면 프사 아이콘만 전체 나오기 -->
		<article class="participate_people_wrap">
			<div class="participate_people">
				<ul class="parti_people_ul">
				
				<c:forEach var="k" items="${donator}">
					<il class="parti_people_li">
						<span style="margin: 7px;">
						<a href="#프사정보"><img src="resources/images/system/profile.png" width="40px;"></a>
						</span>
						<p>닉네임</p>
					</il>
				</c:forEach>

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
</form>
</body>
</html>