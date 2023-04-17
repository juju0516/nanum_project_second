<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pointchange</title>
<script type="text/javascript">
	function member_point_change_ok(f) {
		f.action = "member_point_change_ok.do"
		f.submit();
	};
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/point_change.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section>

		<div class="progressbar-wrapper">
			<ul class="progressbar">
				<li class="active">MY PAGE</li>
				<li class="active">보유 나누미</li>
				<li class="active">나누미 전환 신청</li>
			</ul>
		</div>
		<div class="my_nanumi">
			<h2>보유 나누미</h2>
			<form method="post" enctype="multipart/form-data" id="sendImgForm">
				<div id="picture">
					<c:choose>
						<c:when test="${mvo.p_f_name != null}">
							<img src="/resources/upload/${mvo.id}/attach/${mvo.p_f_name}"
								width="150px;" id="p_f_name" name="p_f_name">
						</c:when>
					</c:choose>
				</div>
			</form>
			<c:choose>
				<c:when test="${empty mvo.nickname}">
					<h3>${mvo.name}님${mvo.cur_point}나누미</h3>
				</c:when>
				<c:otherwise>
					<h3>${mvo.nickname}님${mvo.cur_point}나누미</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<form method="get">
			<div class="nanumi_list">
				<h3 style="margin-right: 65px;">나누미 전환</h3>
				<div class="radio_list">
					<ul>
						<li><input type="radio" name="select" value="50나누미(5,000원)">50
							나누미( 5,000원)</li>
						<li><input type="radio" name="select" value="100나누미(10,000원)">100
							나누미(10,000원)</li>
						<li><input type="radio" name="select" value="150나누미(15,000원)">150나누미
							(15,000원)</li>
						<li><input type="radio" name="select" value="200나누미(20,000원)">200나누미
							(20,000원)</li>
						<li><input type="radio" name="select" value="other">직접
							입력(나눔)<input type="text" name="writenanum" style="width: 100px;"
							disabled></li>
					</ul>
				</div>
			</div>
			<div class="name">
				<table>
					<tr>
						<td>이름:</td>
						<td><input type="text" id="user" name="writename"
							placeholder="이름을 정확하게 입력하세요"></td>
					</tr>
				</table>
			</div>
			<div class="nanumi_req">
				<input type="button" class="nanumi_req_btn"
					onclick="member_point_change_ok(this.form)" value="신청">
			</div>
		</form>
	</section>
	<script>
    const otherRadio = document.querySelector('input[name="select"][value="other"]');
    const otherText = document.querySelector('input[name="writenanum"]');
    otherRadio.addEventListener("change", (event) => {
      if (event.target.checked) {
        otherText.disabled = false;
        otherText.focus();
      } else {
        otherText.disabled = true;
      }
    });
  </script>
	<jsp:include page="../footer.jsp" />
</body>
</html>