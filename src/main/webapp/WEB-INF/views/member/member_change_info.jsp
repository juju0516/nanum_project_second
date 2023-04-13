<%@page import="com.ict.member.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my info</title>
<script type="text/javascript">
	function pwchk(f) {
		var pwField = document.getElementById("password");
		var pw2Field = document.getElementById("password2");
		if (f.pw.value.trim() == "${mvo.pw}") {
			pwField.disabled = false;
			pw2Field.disabled = false;
			return;
		} else {
			alert("패스워드가 일치하지 않습니다");
			pwField.disabled = true;
			pw2Field.disabled = true;
			f.pw.focus();
		}
	}

	function change_prof(f) {
		if (f.password.value.trim() != f.password2.value.trim()) {
			alert("입력한 패스워드를 다시 확인하세요");
			f.pw.focus();
			return;
		}

		var checkedTag = document.getElementById("toggle").checked;
		var paramValue1 = checkedTag ? "공개" : "비공개";

		var checkedHistory = document.getElementById("toggle2").checked;
		var paramValue2 = checkedHistory ? "공개" : "비공개";

		document.getElementById("formvalue").tagopen.value = paramValue1;
		document.getElementById("formvalue").historyopen.value = paramValue2;
		document.getElementById("formvalue").submit();

		alert("개인정보 변경이 완료되었습니다.");
		f.action = "member_change_info_ok.do";
		f.submit();
	}
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/change_info.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>
		<h1 style="text-align: center; margin-top: 60px; margin-left: 20px">
			개인 정보 변경</h1>

		<form id="formvalue" method="post">
			<div class="member_info_change">
				<table>
					<!-- 우편번호 서비스 -->
					<div id="wrap"
						style="display: none; border: 1px solid; top: 0; width: 500px; height: 300px; top: 300px; margin: 5px 0; position: fixed;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<tr>
						<td>이름:</td>
						<td>${mvo.name}</td>
					</tr>
					<tr>
						<td>아이디:</td>
						<td>${mvo.id}</td>
					</tr>
					<tr>
						<td>비밀번호:</td>
						<td><input type="password" id="pw" name="pw"
							placeholder="사용중인 PW를 입력하세요"></td>
						<td><input type="button" value="확인"
							onclick="pwchk(this.form)" class="ok_btn"></td>
					</tr>

					<tr>
						<td>새 비밀번호:</td>
						<td><input type="password" id="password" name="password"
							placeholder="사용할 PW를 입력하세요" disabled></td>
					</tr>
					<tr>
						<td>새 비밀번호 확인:</td>
						<td><input type="password" id="password2" name="password2"
							placeholder="PW를 다시 입력하세요" disabled></td>
					</tr>
					<tr>
						<td>생년월일:</td>
						<td>${mvo.birth}</td>
					</tr>
					<tr>
						<td>성별:</td>
						<td>${mvo.gender}</td>
					</tr>
					<tr>
						<td>전화번호:</td>
						<td><input type="number" id="phoneNumber" name="phone"
							placeholder="(-)를 제외하고 입력하세요"></td>
						<td><input type="button" value="보내기" class="send_btn"
							id="phoneNumberButton"></td>
					</tr>
					<tr>
						<td>인증코드:</td>
						<td><input type="text" id="confirmCode"></td>
						<td><input type="button" value="확인" id="confirmCodeButton"
							class="ok_btn"></td>
					</tr>
					<!-- 폰으로 인증코드 보내기 -->
					<script type="module">
	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
  	import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
  	import { getAuth, RecaptchaVerifier, signInWithPhoneNumber } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js";
  		
  	const firebaseConfig = {
   		apiKey: "AIzaSyDf9m7ApC7x7qf6go2_VufKViTdOpEZzi0",
    	authDomain: "logintest-6833c.firebaseapp.com",
   		projectId: "logintest-6833c",
    	storageBucket: "logintest-6833c.appspot.com",
    	messagingSenderId: "527372092364",
    	appId: "1:527372092364:web:d440a8d78e40a27dbc5369",
    	measurementId: "G-WB0YBEFS0J"
  		};

 	const app = initializeApp(firebaseConfig);
 	const analytics = getAnalytics(app);
	
	const auth = getAuth();
	// sign-in-button -> phoneNumberButton
	window.recaptchaVerifier = new RecaptchaVerifier('phoneNumberButton', {
  	'size': 'invisible',
  	'callback': (response) => {
    onSignInSubmit();
 	  }
	}, auth);
	
	// 핸드폰 번호 이벤트 처리
	document.getElementById('phoneNumberButton').addEventListener('click', function(event){
		event.preventDefault();
		const phoneNumber = document.getElementById('phoneNumber').value;
		// 오류 이유 : 국제 전화시 +82 넣어줘야 한다
		const appVerifier = window.recaptchaVerifier;

		const auth = getAuth();
		signInWithPhoneNumber(auth, '+82'+phoneNumber, appVerifier)
    	.then((confirmationResult) => {
			//alert("성공");
      	window.confirmationResult = confirmationResult;
	    }).catch((error) => {
			//alert("실패");
   		});
	});
	
	// 확인 코드 전송
	document.getElementById('confirmCodeButton').addEventListener('click', function(event){
		event.preventDefault();
		const code = document.getElementById('confirmCode').value;
		confirmationResult.confirm(code).then((result) => {
		alert("인증되었습니다");
		const user = result.user;
		}).catch((error) => {
			alert("코드 인증 실패");
			return;
		});
	});
	</script>
					<tr>
						<td>이메일:</td>
						<td><input type="text" id="email" placeholder="e-mail을 입력하세요"
							name="email"></td>
						<td><input type="button" value="보내기" class="send_btn"
							onclick="sendEmail()"></td>
					</tr>
					<tr>
						<td>인증코드:</td>
						<td><input type="text" id="emailcode"></td>
						<td><input type="button" value="확인" class="ok_btn"
							onclick="codeEmailOk()"></td>
					</tr>
					<tr>
						<td>주소:</td>
						<!-- <td><input type="text" id="user"></td>
					<td><a href="#"><button class="addr_btn" onclick="find_addres(this.form)">우편번호</button></a></td> -->
						<td><input type="text" id="sample3_postcode"
							placeholder="우편번호: ${result[0]}" name="sample3_postcode"></td>
						<td><input type="button" class="find_addr_btn"
							onclick="sample3_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="text" id="sample3_address"
							name="sample3_address" placeholder="주소: ${result[1]}"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="text" id="sample3_detailAddress"
							name="sample3_detailAddress" placeholder="상세주소: ${result[3]}"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="text" id="sample3_extraAddress"
							name="sample3_extraAddress" placeholder="참고항목: ${result[2]}"></td>
					</tr>
					<!-- 우편번호 서비스 -->
					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 찾기 화면을 넣을 element
						var element_wrap = document.getElementById('wrap');

						function foldDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_wrap.style.display = 'none';
						}

						function sample3_execDaumPostcode() {
							// 현재 scroll 위치를 저장해놓는다.
							var currentScroll = Math.max(
									document.body.scrollTop,
									document.documentElement.scrollTop);
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("sample3_extraAddress").value = extraAddr;

											} else {
												document
														.getElementById("sample3_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample3_postcode').value = data.zonecode;
											document
													.getElementById("sample3_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"sample3_detailAddress")
													.focus();

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_wrap.style.display = 'none';

											// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
											document.body.scrollTop = currentScroll;
										},
										// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
										onresize : function(size) {
											element_wrap.style.height = size.height
													+ 'px';
										},
										width : '100%',
										height : '100%'
									}).embed(element_wrap);

							// iframe을 넣은 element를 보이게 한다.
							element_wrap.style.display = 'block';
						}
					</script>

				</table>
			</div>
			<div class="tag">
				<table>
					<tr>
						<td>관심태그:</td>
						<td><input type="text" id="tag" placeholder="${mvo.tag}"
							name="tag" style="margin-left: 16px;"></td>
					</tr>
					<tr>
						<td>관심태그 공개:</td>
						<td><input type="checkbox" id="toggle" name="tagopen"
							<c:if test="${mvo.tag_open eq '공개'}">checked</c:if>
							<c:if test="${mvo.tag_open ne '공개'}"> </c:if>> <label
							for="toggle" class="toggleSwitch"> <span
								class="toggleButton"></span>
						</label></td>
					</tr>
					<tr>
						<td>참여이력 공개:</td>
						<td><input type="checkbox" id="toggle2" name="historyopen"
							<c:if test="${mvo.s_history_open eq '공개'}">checked</c:if>
							<c:if test="${mvo.s_history_open ne '비공개'}"> </c:if>> <label
							for="toggle2" class="toggleSwitch2"> <span
								class="toggleButton2"></span>
						</label></td>
					</tr>
				</table>
			</div>
			<div class="change">
				<a href="member_delete_account.do"
					style="font-size: 12px; margin-top: 35px; padding-right: 35px; color: blue;">회원
					탈퇴 하기</a><input type="button" class="change_ok_btn"
					onclick="change_prof(this.form)" value="완료">
			</div>
		</form>
	</section>

	<jsp:include page="../footer.jsp" />

</body>
</html>