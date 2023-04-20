<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : project top</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">

<style type="text/css">
/*네비게이션 메뉴 스타일지정*/
#wrap {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

ul.prj_menu {
	display: flex;
	flex-direction: row;
	padding-inline-start: 0;
	list-style-type: none;
	font-size: 19px;
	font-family: 'NanumSquareNeoBold'; 
}

ul.prj_menu a {
	margin: 0px 20px 0px 20px;
	padding-top: 20px;
	background-color: white;
	color: black;
	text-decoration: none;
	border-right: 3px solid white;
}
	
ul.prj_menu a:hover{
	color: black;
	font-weight: bold;
	font-size: 20px;
	border-bottom: 2px solid black;
}

ul.prj_menu a:focus,
ul.prj_menu a.active{
	color: black;
	font-weight: bold;
	font-size: 20px;
	border-bottom: 2px solid black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"> 	
		/*
		 active 클래스를 추가한 후에 클릭 이벤트를 처리하는데, 
		 이 때 preventDefault() 메소드를 사용하여 기본 동작을 막으면 
		 링크가 실행되지 않는다. 
		 이 경우에는 클릭 이벤트 내에서 preventDefault() 메소드를 호출하지 않고, 
		 링크가 실행된 이후에 active 클래스를 추가하도록 수정하면 됩니다.
		 */
/* 		$(document).ready(function() {
		    // 현재 페이지 URL에서 파일명 추출
		    var currentPage = location.href.substring(location.href.lastIndexOf("/") + 1);
		    
		    // 현재 페이지에 해당하는 메뉴에 active 클래스 추가
		    $('.story_menu li a[href$="' + currentPage + '"]').addClass('active');

		    // 메뉴 클릭 시 active 클래스 추가 및 페이지 이동
		    $('.story_menu li a').click(function() {
		        // 모든 메뉴에서 active 클래스 제거
		        $('.story_menu li a').removeClass('active');
		        // 클릭한 메뉴에 active 클래스 추가
		        $(this).addClass('active');
		        // 클릭한 메뉴의 href 속성 값으로 페이지 이동
		        window.location.href = $(this).attr('href');
		    });
		});
 */		
 
	$(document).ready(function() {
		// 현재 페이지 URL에서 파일명 추출
		var currentPage = location.href.substring(location.href.lastIndexOf("/") + 1);
		// 현재 페이지에 해당하는 메뉴에 active 클래스 추가
		$('.prj_menu li a[href$="' + currentPage + '"]').addClass('active');
		// 메뉴 클릭 시 active 클래스 추가 및 페이지 이동
		$('.prj_menu li a').click(function(event) {
			// 링크의 기본 동작을 막음
			event.preventDefault();
			// 클릭한 메뉴에 active 클래스 추가
			$(this).addClass('active').siblings().removeClass('active');
			// 클릭한 메뉴의 href 속성 값으로 페이지 이동
			var linkUrl = $(this).attr('href');
			window.location.href = linkUrl;
		});
	});
		
 </script>
<body>

	<div id="wrap">
		<ul class="prj_menu">
			<li><a class="" href="prj_list.do?prj_category='진행중'">진행중</a></li>
			<li><a class="" href="prj_list.do?prj_category='새로 시작된'">새로시작한</a></li>
			<li><a class="" href="prj_list.do?prj_category='오픈예정'">오픈예정</a></li>
			<li><a class="" href="prj_list.do?prj_category='완료'">지난프로젝트</a></li>
		</ul>
	<div id="regi_prj">
		<input type="hidden" name="cPage" value="${paging.nowPage}">
		<input type="hidden" name="id" value="${loginID}">
		<input type="button" id="btn_regi_prj" onclick="regi_prj_go(this.form)" value="등록하기">
		</div>
	</div>

</body>
</html>