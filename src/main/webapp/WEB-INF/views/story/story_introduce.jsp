<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : story_introduce</title>

<style type="text/css">
.intro_wrap {
	max-width: 1000px;
	margin: 100px auto 300px auto;
	position: relative;
	text-align: center;
	font-family: 'NanumSquareNeoBold';
}

article.introduce {
    margin-bottom: 250px;
}

.logo {
	font-size: 45px;
	font-weight: bold;
	font-family: 'NanumSquareNeoHeavy';
	color: rgb(0, 87, 147);
	margin-bottom: 30px;
}

.logo2 {
	font-size: 45px;
	font-weight: bold;
	font-family: 'NanumSquareNeoHeavy';
	color: rgb(253, 95, 0);
}

.line {
	font-family: 'NanumSquareNeoHeavy';
	font-size: 25px;
	font-weight: bold;
}

.sub_line {
	font-family: 'NanumSquareNeolight';
	font-size: 15px;
	text-align: right;
}


/* FAQ 관련 */
article.faq, article.contact {
    width: 1000px;
    display: flex;
    min-height: 500px;
    margin-top: 20%;

}

article.faq_wrap {
	font-size: 20px; 
}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
}

.faq {
	width: 900px;
    line-height: 280%;
    margin-left: 30px;
    margin-right: 30px;
}

.question {
	position: relative;
    padding: 10px;
    border-bottom: 2px solid #005273;
    list-style: none;
}
.answer {
 	background: #00579318; 
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	font-size: 17px;
	font-family: 'NanumSquareNeo';
	display: none; /*처음 답변박스는 안보이도록 설정하자*/
}
.answer.on { /*임의의 클래스를 만들어서 block을 넣어주자, on 클래스를 붙여 안보이는 답변을 보여줌.*/
	display: block;
}

.answer>ul>li {
	width: 85%;
	text-align: justify;
	padding: 30px;
	list-style: none
}

.question>ul>li { /* 질문 */
	width:100%; 
	list-style: none;
	display: flex;
}

.q_link {
	width: 100%;
	height: 100%;
	position:absolute;
	top: 0;
	left: 0;
}

/* 오시는길 관련 */
article.contact {
    flex-direction: column;
    align-items: flex-start;
}

.subject{
	font-family: 'NanumSquareNeoBold';
	font-size: 35px;
	display: flex;
}

.addr {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin: 50px auto 50px 50px;
}

div.addr p{
	font-family: 'NanumSquareNeo';
	font-size: 18px;
	margin: 10px;
}

#map {
	margin-left: 50px;
}

.mark_addr {
	padding:5px; 
	font-size:12px; 
	height: 28px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    var className =""  //변수를 선언한다.
     $('.q_link').on({    //버튼을
         click: function(){  //클릭했을때 
              className=$(this).parent().next().attr('class').slice(-2); 
              //보여줄 li의 class이름을 뒤에서 두자리(on)를 변수에 담는다.
             if(className=='on'){  //만약 클래스명이 'on'이면
                $(this).parent().next().removeClass('on'); //class'on' 삭제
                $(this).prev().children().eq(1).children();
/*                 $(this).prev().children().eq(3).children(); */
             }
             else if(className!='on'){  //만약 클래스명이 'on'이 아니면
                $(this).parent().next().addClass('on');  //class'on' 추가
                $(this).prev().children().eq(1).children();  
/*                 $(this).prev().children().eq(3).children();  기존 코드는 eq(3) 이다! 근데 1로 해도 된다. 뭐지?*/
             }
          }
      });
  });
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp" />
		<jsp:include page="story_top.jsp" />
		<!-- 카테고리 -->
	</header>
	<section>
		<div class="intro_wrap">
			<article class="introduce">
				<p>
					<span class="logo">NANUM ✿</span>
				</p>
				<pre>
			
			</pre>
				<p>
					<span class="line">작은손길, 소액으로도 따듯함을 전하기엔 충분합니다.</span>
				</p>
				<p>
					<span class="sub_line">쉽고 간편한 나누미 포인트로 따뜻함을 전해요.</span>
				</p>
				<pre>
			
			</pre>
				<p>
					<span class="line">어렵지 않아요!</span>
				</p>
				<p>
					<span class="line">다양한 기부 프로젝트에 참여해보세요.</span>
				</p>
				<p>
					<span class="sub_line">굿즈, 기념일 후원도 만나볼수 있어요.</span>
				</p>
				<pre>
			
			</pre>
				<p>
					<span class="line">쉽고 간편한 기부,<span class="logo2">NANUM</span>
						과 함께해요.
					</span>
				</p>
			</article>



			<!-- FAQ -->
			<article class="faq_wrap" id="faq">
				<span class="subject">FAQ</span>
				<ul class="faq">
					<li class="question">
						<ul class="clearfix">
							<li class="q">Q. 후원 참여는 어떻게 할 수 있나요?</li>
						</ul>
						<a href="#" class="q_link" onclick="return false;"></a>
					</li>
					<li class="answer">
						<ul class="clearfix">
							<li>
								프로젝트, 기념일 후원, 굿즈구매를 통해서 참여할 수 있습니다. <br>
								나누미 포인트를 사용한 기부후원과 자원봉사인 재능나눔으로 참여하실 수 있습니다.<br>
								굿즈를 구매하시는 것으로도 프로젝트 후원에 동참하게 되오니 많은 참여 부탁드립니다.
							</li>
						</ul>
					</li>
				
					<li class="question">
						<ul class="clearfix">
							<li class="q">Q. 기념일 후원이 무엇인가요?</li>
						</ul>
						<a href="#" class="q_link"  onclick="return false;"></a>
					</li>
					<li class="answer">
						<ul class="clearfix">
							<li>
								자신만의 특별한 순간을 기념하고, 어려운 이웃을 위해 나누고자 마련된 후원입니다.<br>
								생애주기별로 선택하여 참여가 가능하며, 기념일 후원에 많은 관심 부탁드립니다.
							</li>
						</ul>
					</li>
				
					<li class="question">
						<ul class="clearfix">
							<li class="q">Q. 재능나눔이 무엇인가요?</li>
						</ul>
						<a href="#" class="q_link"  onclick="return false;"></a>
					</li>
					<li class="answer">
						<ul class="clearfix">
							<li>
								자원봉사의 개념입니다.<br>
								후원이 부담스럽거나, 봉사에 직접 참여하고 싶다면, 재능나눔에 함께 해 주세요.<br>
								특별한 재능이 아니더라도 누구나 참여할 수 있습니다.<br>
								당신의 따듯한 온기를 전달해주세요.
							</li>
						</ul>
					</li>
				
					<li class="question">
						<ul class="clearfix">
							<li class="q">Q. 프로젝트 등록은 개인이 할 수 있나요?</li>
						</ul>
						<a href="#" class="q_link"  onclick="return false;"></a>
					</li>
					<li class="answer">
						<ul class="clearfix">
							<li>
								네, 가능합니다.<br>
								상단메뉴 '프로젝트 > 등록하기' 를 이용해주세요<br>
								기부 프로젝트의 내용과 수익금 기부 계획을 작성하시고, 제출서류 등록 후 승인 요청시 <br>
								담당관리자가 검수 후 승인하도록 안내하고 있습니다.
							</li>
						</ul>
					</li>
			
					<li class="question">
						<ul class="clearfix">
							<li class="q">Q. 후원 참여는 어떻게 할 수 있나요? </li>
						</ul>
						<a href="#" class="q_link"  onclick="return false;"></a>
					</li>
					<li class="answer">
						<ul class="clearfix">
							<li>
								프로젝트, 기념일 후원, 굿즈구매를 통해서 참여할 수 있습니다. <br>
								나누미 포인트를 사용한 기부후원과 자원봉사인 재능나눔으로 참여하실 수 있습니다.<br>
								굿즈를 구매하시는 것으로도 프로젝트 후원에 동참하게 되오니 많은 참여 부탁드립니다.
							</li>
						</ul>
					</li>
				</ul>								
			</article>



			<!-- 오시는 길 -->
			<article class="contact" id="contact">
				<span class="subject">오시는 길(Contact)</span>
				<div class="addr">
					<p style="font-family: 'NanumSquareNeoBold';">서울시 마포구 백범로 케이터틀 ICT 한국 인재개발원</p>
					<p>지하철 : 신촌역 6번 출구, 서강대 역</p>
					<p>버스 : 서강대학교 , 신촌로터리 (7016,  7613,  6716,  604,  740,  110B)</p>
				</div>
				<div id="map" style="width:800px;height:300px;"></div>
				<!-- 카카오 지도 관련 스크립트 -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc634a994c0918ff4bba0916b2c4752c"></script>
				<script>
					var lat = 37.552388;
					var lon = 126.937704;
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				        level: 2 // 지도의 확대 레벨
				    };
		
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(lat, lon); 
		
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
		
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					var iwContent = '<div class="mark_addr"><a href="story_introduce.do">한국 ICT인재개발원_NANUM</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
				</script>
				
			</article>
		</div>
	</section>

	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>

</body>
</html>