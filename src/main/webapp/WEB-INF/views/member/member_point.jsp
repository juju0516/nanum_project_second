<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point</title>
<script type="text/javascript">
	function member_point_change(f) {
		f.action = "member_point_change.do"
		f.submit();
	};
	function member_mypage(f) {
		f.action = "member_mypage.do"
		f.submit();
	};
	function member_nanumi_change_list(f) {
		f.action = "member_nanumi_change_list.do"
		f.submit();
	};
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/point.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>

		<div class="progressbar-wrapper">
			<ul class="progressbar">
				<li class="active">MY PAGE</li>
				<li class="active">보유 나누미</li>
			</ul>
		</div>
		<div class="my_nanumi">
			<h2>보유 나누미</h2>
			<img src="resources/images/system/profile2.png" width="200px;">
			<h3>${mvo.nickname}님 ${mvo.cur_point}나누미</h3>
		</div>
		<form method="get">
			<div class="button">
				<input type="button" class="nanum_btn1"
					onclick="member_point_change(this.form)" value="포인트 전환 신청">
				<input type="button" class="nanum_btn1"
					onclick="member_mypage(this.form)" value="마이페이지"> <input
					type="button" class="nanum_btn1"
					onclick="member_nanumi_change_list(this.form)" value="포인트 전환 내역">
			</div>
		</form>
	</section>

	<jsp:include page="../footer.jsp" />
</body>
</html>