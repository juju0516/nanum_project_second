<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_header_menu.css?after" type="text/css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		const now = new Date();
		const year = now.getFullYear();
		const month = now.getMonth()+1;
		const date = now.getDate();	
		$("#cur-date").text(year + "-" + month + "-" + date);
				
		setInterval(getClock, 1000);
		
		$(".menu-item").on("click", function() {
			if($(this).children(".sub-container").css("display") == "none") {
				$(this).children(".sub-container").css("display", "block");
				/* $(this).children(".sub-container").show("slow"); */
				$(this).children(".sub-container").slideDown();
			} else {	
				$(this).children(".sub-container").css("display", "none");
				/* $(this).children(".sub-container").hide("slow"); */
				$(this).children(".sub-container").slideUp();
			}
		});
		
		$(".header-logout").on("click", function() {
			if(window.confirm("로그아웃 하시겠습니까?")) {
				alert("로그아웃 되었습니다.");
				location.href = "mngr_logout.do";
			}
		});
	});
	
	function getClock() {
		const date = new Date();
		const hour = String(date.getHours()).padStart(2, "0");
		const minutes = String(date.getMinutes()).padStart(2, "0");
		const second = String(date.getSeconds()).padStart(2, "0");
		
		$("#cur-time").text(hour + ":" + minutes + ":" + second);	
	}
</script>
</head>
<!-- <body style="overflow-x:hidden; overflow-y:auto"> -->
<body>
<div class="page-header"> 
	<div class="header-logo"><a href="main_page.do"> NANUM </a></div>
	<div class="header-grid">
		<div class="header-icon"><a href="mngr_alarm.do">
			<img src="resources/images/system/bell2.png" style="width:32px"></a></div>
		<div class="header-managerid"> ${managerID} 님 </div>
		<div class="header-logout"> Logout </div>
		<div class="header-time"><span id="cur-date" style="padding-right:26px"></span>
								 <span id="cur-time"></span></div>
	</div>
</div>

<aside>
<ul class="menu">
	<li class="menu-item"> 회원 관리
		<div class="sub-container">
			<div class="sub-menu"><a href="mngr_member_list.do?init=y"> - 회원 정보 </a></div>
			<div class="sub-menu"><a href="mngr_member_inquiry.do"> - 문의 내역 </a></div>
			<div class="sub-menu"><a href="mngr_manager_info.do"> - 관리자 정보 </a></div>
		</div>
	</li>	
	<li class="menu-item">나누미 관리
		<div class="sub-container">
			<div class="sub-menu"><a href="mngr_point_list.do"> - 나누미 정보 </a></div>
			<div class="sub-menu"><a href="mngr_point_req.do"> - 나누미 전환 관리 </a></div>
		</div>	
	</li>	
	<li class="menu-item"><a href="mngr_regular.do">정기후원 관리</a></li>
	<li class="menu-item">프로젝트 관리
		<div class="sub-container">
			<div class="sub-menu"><a href="mngr_prj_list.do?init=y"> - 프로젝트 정보 </a></div>
			<div class="sub-menu"><a href="mngr_prj_regi.do?init=y"> - 프로젝트 등록 관리 </a></div>
			<div class="sub-menu"><a href="mngr_prj_aids.do?init=y"> - 상시 프로젝트 관리 </a></div>
		</div>
	</li>
	<li class="menu-item">굿즈 관리
		<div class="sub-container">
			<div class="sub-menu"><a href="mngr_goods_list.do?init=y"> - 굿즈 정보 </a></div>
			<div class="sub-menu"><a href="mngr_goods_write.do"> - 상품 등록 </a></div>
			<div class="sub-menu"><a href="mngr_goods_sale.do?init=y"> - 구매 내역 관리 </a></div>
		</div>	
	</li>
	<li class="menu-item"><a href="mngr_aids_list.do">보조기구 신청 관리</a></li>
	<li class="menu-item">소식 관리
		<div class="sub-container">
			<div class="sub-menu"><a href="mngr_story_list.do"> - 소개,공지,소식 정보 </a></div>
			<div class="sub-menu"><a href="mngr_story_write.do"> - 새글 등록 </a></div>
		</div>	
	</li>
	<li class="menu-item"><a href="mngr_dashboard.do">대시보드</a></li>
 </ul>
 </aside>
</body>
</html>