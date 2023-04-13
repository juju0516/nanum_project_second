<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign up</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function sendSignUpData(f) {
		if (f.id.value.trim() == "${id}") {
			alert("사용할 수 없는 아이디입니다.");
			f.id.focus();
			return;
		}
		/*if (f.name.value.trim().length <= 0) {
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}*/
		if (f.id.value.trim().length <= 0) {
			alert("아이디를 입력하세요");
			f.id.focus();
			return;
		}

		if (f.pw.value.trim().length <= 0) {
			alert("패스워드를 입력하세요");
			f.pw.focus();
			return;
		}
		if (f.pw2.value.trim().length <= 0) {
			alert("패스워드를 다시 입력하세요");
			f.pw2.focus();
			return;
		}
		if (f.birth.value.trim().length <= 0) {
			alert("생년월일을 입력하세요");
			f.birth.focus();
			return;
		}
		if (f.phone.value.trim().length <= 0) {
			alert("전화번호를 입력하세요");
			f.phone.focus();
			return;
		}
		if (f.email.value.trim().length <= 0) {
			alert("이메일 주소를 입력하세요");
			f.email.focus();
			return;
		}
		if (f.pw.value.trim() != f.pw2.value.trim()) {
			alert("패스워드가 일치하지 않습니다.");
			f.pw.focus();
			return;
		}

		f.action = "login_sign_up_next.do";
		f.submit();

	};

	function idChk(f) {
		$.ajax({
			url : "login_id_check.do",
			type : 'get',
			data : {
				id : $("#id").val()
			},
			dataType : 'json',
			success : function(result) {

				if (result == 0) {
					alert("사용 가능한 아이디입니다.");
				} else {
					alert("사용 불가능한 아이디입니다.");
					f.id.focus();
				}
			}

		});
	};
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/sign_up.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>
		<h1 style="text-align: center; margin-top: 60px; margin-left: 40px">
			회원 가입</h1>

		<div class="progressbar-wrapper">
			<ul class="progressbar">
				<li class="active">회원 정보 입력</li>
				<li>추가 정보 입력</li>
				<li>회원 가입 완료</li>
			</ul>
		</div>

		<form method="post" id="sendData">
			<div class="member_info">
				<table>
					<tr>
						<td>이름:</td>
						<td><input type="text" id="name" name="name"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td>아이디:</td>
						<td><input type="text" id="id" name="id"
							placeholder="사용할 ID를 입력하세요"></td>
						<td><input type="button" value="중복확인" class="dupe_btn"
							onclick="idChk()"></td>
					</tr>
					<tr>
						<td>비밀번호:</td>
						<td><input type="password" id="pw" name="pw"
							placeholder="사용할 PW를 입력하세요"></td>
					</tr>
					<tr>
						<td>비밀번호 확인:</td>
						<td><input type="password" id="pw2" name="pw2"
							placeholder="PW를 다시 입력하세요"></td>
					</tr>
					<tr>
						<td>생년월일:</td>
						<td><input type="date" id="birth" name="birth"
							placeholder="생년월일 8자리 입력하세요"></td>
					</tr>
					<tr>
						<td>성별:</td>
						<td><select id="gender" name="gender">
								<option value="남성" name="man">남성</option>
								<option value="여성" name="woman">여성</option>
						</select></td>
					</tr>
					<tr>
						<td>전화번호:</td>
						<td><input type="tel" id="phone" name="phone"
							placeholder="(-)를 제외하고 입력하세요"></td>
					</tr>
					<tr>
						<td>이메일:</td>
						<td><input type="text" id="email" name="email"
							placeholder="e-mail을 입력하세요"></td>
					</tr>
				</table>
			</div>
			<div class="next">
				<input type="button" value="다음으로" class="next_btn"
					onclick="sendSignUpData(this.form)">
				<!--<button type="submit" class="next_btn"
					onclick="sendSignUpData(this.form)">다음으로</button>  -->
			</div>
		</form>

	</section>

	<jsp:include page="../footer.jsp" />
</body>
</html>