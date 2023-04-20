<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript">
	function login_go(f) {
		f.action = "login_login_ok.do";
		f.submit();
	}
</script>

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link href="resources/css/login.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />


	<section>
		<h1 style="text-align: center; margin-top: 130px;">로그인</h1>


		<form method="post" class="login_all">
			<div id="wrap">

				<div class="login_part">
					<div class="login_text">
						<p>
							<label>ID: </label><input type="text" id="userid" name="m_id">
						</p>
						<p>
							<label>PW: </label><input type="password" id="userpw" name="m_pw">
						</p>
					</div>
					<div class="go_login">
						<a><button id="btn_login" onclick="login_go(this.form)">로그인</button></a>
					</div>

				</div>



				<div class="button">
					<button class="bottom_btn" onclick="">
						<a href="intro_nanum"
							style="color: white; font-family: 'NanumSquareNeoBold'; font-size: 15px; margin: 0px;">나누미
							소개 ▶</a>
					</button>
					<button class="bottom_btn" onclick="">
						<a href="login_sign_up.do"
							style="color: white; font-family: 'NanumSquareNeoBold'; font-size: 15px; margin: 0px;">회원가입
							▶</a>
					</button>
					<div class="chk_id">
						<!-- <span style="background-color: rgba(224, 224, 224, 0.35);">
						<a><input type="checkbox" id="chk_btn" name="chk_btn"
							onclick="saveId()">아이디저장 &nbsp;&nbsp;</a> <a
						href="login_find_id.do" onclick="">ID 찾기</a>/<a
						href="login_find_id.do" onclick="">PW 찾기</a>
					</span> -->

						<!-- <a
						href="https://kauth.kakao.com/oauth/authorize?client_id=ecf16dad0bf2a470548b7a10f0a60323&redirect_uri=http://localhost:8083/login_kakao_login.do&response_type=code">
						<img
						src="resources/images/system/kakao_login_small.png"
						style="margin-left: 20px;"></a> -->

						<a
							href="https://kauth.kakao.com/oauth/authorize?client_id=ba35fcb2b495ffa24babfedb6d4d6492&redirect_uri=http://localhost:8090/login_kakao_login.do&response_type=code">
							<img src="resources/images/system/kakao_login_small.png"
							style="margin-top: 25px;">
						</a>
					</div>
				</div>


			</div>
		</form>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>