<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/mypage.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function change_nick_ok(f) {
		if (f.nickname.value.trim().length <= 0) {
			alert("닉네임을 최소 1글자 이상 등록해주세요");
		} else {
			f.action = "member_nick_change.do"
			f.submit();
			alert("닉네임 변경이 완료되었습니다.");
		}
	};
	function member_point(f) {
		f.action = "member_point.do"
		f.submit();
	};
	function member_like_list(f) {
		f.action = "member_like_list.do"
		f.submit();
	};
	function member_donate(f) {
		f.action = "member_donate.do"
		f.submit();
	};
	function member_inquiry(f) {
		f.action = "member_inquiry.do"
		f.submit();
	};
	function member_regular_list(f) {
		f.action = "member_regular_list.do"
		f.submit();
	};
	function member_special_donate(f) {
		f.action = "member_special_donate.do"
		f.submit();
	};
	function member_project_status(f) {
		f.action = "member_project_status.do"
		f.submit();
	};
	function member_req_aids(f) {
		f.action = "member_req_aids.do"
		f.submit();
	};
	function member_goods_list(f) {
		f.action = "member_goods_list.do"
		f.submit();
	};
	function member_change_info(f) {
		f.action = "member_change_info.do"
		f.submit();
	};
	function page_logout() {
		alert("로그아웃 하시겠습니까?");
		location.href = "member_main_page_logout.do"
	};

	function img_change() {
	    var file = $('#profile_img')[0].files[0];
	    var formData = new FormData();
	    formData.append("f_param", file);
	    $.ajax({
	        url: "member_image_change.do",
	        type: 'post',
	        data: formData,
	        dataType: 'text',
	        contentType: false,
	        processData: false,
	        success: function(result) {
	          if(result == 1){
	        	  location.reload();
	          }
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	};
</script>

</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>
		<h2 style="text-align: center; margin-top: 90px;">마이페이지</h2>
		<form method="post" enctype="multipart/form-data" id="sendImgForm">
			<div id="picture">
					<c:choose>
						<c:when test="${mvo.p_f_name != null}">
							<img src="/resources/upload/${mvo.id}/attach/${mvo.p_f_name}"
								width="150px;" id="p_f_name" name="p_f_name">
						</c:when>
					</c:choose>
				</div>
			<div class="fileclass" style="min-width: 300px;">
				<input type="file" id="profile_img" name="profile_img"
					style="min-width: 254px; margin-left: 15px;"> <input
					type="button" class="img_change_btn" onclick="img_change()"
					value="완료">
			</div>
		</form>

		<form method="post">
			<div class="nickname">
				<table class="nick_table">
					<tr>
						<td style="padding-left: 15px;">닉네임:</td>
						<td><input type="text" id="user" name="nickname"
							placeholder="${mvo.nickname}"></td>
						<td><input type="button" class="change_btn"
							onclick="change_nick_ok(this.form)" value="변경"></td>
					</tr>
				</table>
			</div>
		</form>
		<form method="get">
			<div id="mypage_btn">
				<div class="button1">
					<input type="button" class="bottom_btn"
						onclick="member_point(this.form)" value="보유 나누미"> <input
						type="button" class="bottom_btn"
						onclick="member_like_list(this.form)" value="관심리스트">
				</div>
				<div class="button2">
					<input type="button" class="bottom_btn"
						onclick="member_donate(this.form)" value="후원이력"> <input
						type="button" class="bottom_btn"
						onclick="member_inquiry(this.form)" value="문의하기">
				</div>
				<div class="button3">
					<input type="button" class="bottom_btn"
						onclick="member_regular_list(this.form)" value="정기 결제 내역">
					<input type="button" class="bottom_btn"
						onclick="member_special_donate(this.form)" value="기념일 후원 내역">
				</div>
				<div class="button4">
					<input type="button" class="bottom_btn"
						onclick="member_project_status(this.form)" value="등록한 프로젝트">
					<input type="button" class="bottom_btn"
						onclick="member_req_aids(this.form)" value="보조기구 신청 내역">
				</div>
				<div class="button5">
					<input type="button" class="bottom_btn"
						onclick="member_goods_list(this.form)" value="굿즈 구매 목록"> <input
						type="button" class="bottom_btn"
						onclick="member_change_info(this.form)" value="개인 정보 변경">
				</div>
				<div>
					<a onclick="page_logout()"
						style="font-size: 12px; margin-left: 230px; color: blue; border-bottom: 1px solid blue; cursor: pointer;">로그아웃하기</a>
				</div>
			</div>
		</form>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>