<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : Project_list</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/prj_list.css" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script> -->
<script type="text/javascript">
	/*네비게이션 메뉴*/
	$(document).ready(function() {
	  var currentPage = location.href.substring(location.href.lastIndexOf("/") + 1);
	  $('.prj_menu li a[href$="' + currentPage + '"]').addClass('active');
	
	  $('.prj_menu li a').click(function(e) {
	    e.preventDefault();
	    $('.prj_menu li a').removeClass('active');
	    $(this).addClass('active');
	    var href = $(this).attr('href');
	    window.location.href = href;
	  });
	});
		
	//프로젝트 등록하기 버튼
	function regi_prj_go(f) {
		/* alert(${loginID});
		console.log("${loginID}");
		// 1. 로그인되어있어야 등록할 수 있다.
		// 2. 로그인 아이디를 받아와야한다.
		if ("${loginID}" == null) {
			alert('로그인이 필요합니다.');
			return false;
		} */
		f.action="prj_regi_go.do";
		f.submit();
	 		//location.href = "prj_regi_go.do?loginID="+loginID+"&cPage="+cPage;
	}
	
	// 관심리스트 등록 or 해제
	// 해당 프로젝트 index와 id, cPage를 가져 가야한다.
/*	function interestClick(f) {
	  var img = document.getElementsByClassName("interest")[0];
	  if (img.src.endsWith("fullheart.png")) {
		  alert('오니?')
	    img.src = "resources/images/system/heart1.png";
	  } else {
	    img.src = "resources/images/system/fullheart.png";
	  }
	  // 여기에 관심리스트 등록 컨트롤러 호출하는 코드 추가
	  f.action = "prj_interest.do";
	  f.submit(); 
	}*/
</script>

<body>
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<form method="post">
	<section>
 		<div id="wrap">
			<ul class="prj_menu">
				<li><a class="" href="prj_list.do?prj_category=진행중">진행중</a></li>
				<li><a class="" href="prj_list.do?prj_category=새로 시작된">새로 시작된</a></li>
				<li><a class="" href="prj_list.do?prj_category=오픈 예정">오픈예정</a></li>
				<li><a class="" href="prj_list.do?prj_category=완료">지난프로젝트</a></li>
			</ul>
			<div id="regi_prj">
				<input type="hidden" name="cPage" value="${paging.nowPage}">
				<input type="hidden" name="id" value="${loginID}">
				<input type="button" id="btn_regi_prj" onclick="regi_prj_go(this.form)" value="등록하기">
			</div>
		</div>

		<div id="wrap_prj1">
		<c:choose>
			<c:when test="${empty prj_List}">
				프로젝트 리스트가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${prj_List}" varStatus="vs">
					<!-- 찜기능(하트) -->
			<!-- 		<div class="interest">
						<a href="#마이페이지 좋아요에 삽입" class="heart1">
						<img src="resources/images/system/fullheart.png" width="40px"
							style="top: 60px; left: 300px; position: relative;"></a>
					</div> -->
					<!-- 	<img class="interest" alt="관심프로젝트" src="resources/images/system/fullheart.png" onclick="interestClick(this.form)"> -->
					<div class="prj_list1">
						<a href="prj_detail.do?project_idx=${k.project_idx}&cPage=${paging.nowPage}" class="project"> 
						<img src="resources/upload/${k.id}/attach/${k.prj_main_img}" width="225" height="340px">
							<c:if test="${k.prj_category ne '오픈 예정'}">
								<progress id="progressbar" value="${Math.round(((k.cur_point + k.r_cur_point) / k.goal_point) * 100)}" min="0" max="100"></progress>
								<b style="margin-left: 1.5px;">${Math.min(Math.round(((k.cur_point + k.r_cur_point) / k.goal_point) * 100), 100)}%</b>
							</c:if>
							<div class="prj_subject">${k.prj_title}</div>
							<div class="prj_period">기간: ${k.prj_begin_date.substring(0,10)} ~ ${k.prj_end_date.substring(0,10)}</div>
							<div class="prj_Goal_point">목표금액: <fmt:formatNumber value="${k.goal_point * 500}" pattern="#,##0" />원</div>
							<div class="prj_cur_point">현재후원금액:<fmt:formatNumber value="${(k.cur_point+k.r_cur_point) * 500}" pattern="#,##0" /> 원</div>
							<c:if test="${k.vlt_flag == 'Y'}">
								<div class="prj_cur_people">지원인원: ${k.cur_num_people}명</div>
							</c:if>
						</a>
					</div>
					<c:if test="${vs.index % 3 == 2}">
                    <div style="clear: both;"></div>
                </c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
	</section>
	<!-- 페이지기법 -->
	<section>
		<ol class="paging">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
					<li class="disable">&lt;</li>
				</c:when>
				<c:otherwise>
					<li><a href="prj_list.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
				</c:otherwise>
			</c:choose>

			<!-- 블록안에 들어간 페이지번호들 -->
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
				<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
				<c:choose>
					<c:when test="${k == paging.nowPage}">
						<li class="now">${k}</li>
					</c:when>
					<c:otherwise>
						<li><a href="prj_list.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음 -->
			<c:choose>
				<c:when test="${paging.endBlock >= paging.totalPage}">
					<li class="disable">&gt;</li>
				</c:when>
				<c:otherwise>
					<li><a href="prj_list.do?cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
				</c:otherwise>
			</c:choose>
		</ol>
	</section>
	</form>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
