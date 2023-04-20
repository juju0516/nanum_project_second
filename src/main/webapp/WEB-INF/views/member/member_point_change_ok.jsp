<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point_change_ok</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/point_change_ok.css" type="text/css"
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
		<div class="pay_info">
			<h2 style="color: rgb(0, 87, 146); text-align: center;">포인트 신청
				완료</h2>
			<div class="pay_info_rec">
				<%
				String selectValue = request.getParameter("select");
				String showValue;
				if (selectValue.equals("other")) {
					showValue = request.getParameter("writenanum");
				} else {
					showValue = selectValue;
				}
				%>
				<h3>${mvo.nickname}님
					<%=showValue%>
					나누미 신청이 완료되었습니다!
				</h3>
				<h3>ㅁㅁ 은행 ㅁㅁㅁ-ㅁㅁㅁㅁ-ㅁㅁㅁㅁㅁㅁ-ㅁㅁ 으로</h3>
				<%
				String selectValue2 = request.getParameter("select");
				String showValue2;
				if (selectValue.equals("other")) {
					showValue2 = request.getParameter("writenanum")+"00원";
				} else {
					showValue2 = selectValue2;
				}
				%>
				<h3><%=showValue2%> 입금해주세요!</h3>
				<h3>신청한 날부터 24시간 이후에도 미입금 상태일 경우 전환 신청이 반려될 수 있습니다</h3>
			</div>
		</div>
		<div class="button">
			<a href="member_main_page.do"><button onclick="">메인메뉴로
					이동</button></a> <a href="member_nanumi_change_list.do"><button onclick="">포인트
					전환 내역</button></a> <a href="#"><button onclick="">나눔하러 가기</button></a> <a
				href="member_mypage.do"><button onclick="">마이페이지</button></a>
		</div>
	</section>

	<jsp:include page="../footer.jsp" />
</body>
</html>