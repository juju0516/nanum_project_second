<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 회원 정보 상세 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.new-width {
	width:71.5%; 
}

.text-title {
	margin-left: 20px;
	padding: 0px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 80px;
}

.img-profile {
	height: 40px;
	padding: 5px 0 0 20px;
}

.e-o-tb {
	border-radius: 10px;

	height: 20px;
	border-bottom: 3px solid rgb(224, 224, 224);
}
</style>
<script type="text/javascript">
	function member_update(f) {
		f.action ="mngr_member_update.do";
		f.submit();
	}
	
	function member_delete(f) {
		f.action ="mngr_member_delete.do";
		f.submit();
	}
	
	function member_list(f) {
		f.action ="mngr_member_list.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 회원 정보 상세 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : ${vo.manager_id }</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ ${vo.m_state } ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">${vo.name }</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>프로필 사진</td>
				<td class="td-padding" style="text-indent: 0">
					<img src="resources/upload/${vo.id}/attach/${vo.p_f_name}" class="img-profile">
					<span style="vertical-align:17px;"> ${vo.p_f_name}</span>
				</td></tr>
			<tr><td>로그인 유형</td><td class="td-padding">${vo.login_type }
				<c:if test="${vo.login_type eq '카카오'}">
					<span>(index: ${vo.kakao_login_idx })</span>
				</c:if>
				</td></tr>
			<tr><td>ID</td><td class="td-padding">${vo.id}</td></tr>
			<tr><td>닉네임</td><td class="td-padding">${vo.nickname}</td></tr>
			<tr><td>생년월일</td><td class="td-padding">${vo.birth.substring(0,10)}</td></tr>
			<tr><td>성별</td><td class="td-padding">${vo.gender }</td></tr>
			<tr><td>전화번호</td><td class="td-padding">${vo.phone }</td></tr>
			<tr><td>Email</td><td class="td-padding">${vo.email }</td></tr>
			<tr><td>주소</td><td class="td-padding">${vo.address }</td></tr>
			<tr><td>최근 배송지</td><td class="td-padding">${vo.last_address }</td></tr>
			<tr><td>보유 나누미</td><td class="td-padding">${vo.cur_point } 나누미</td></tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="3">${vo.tag }</textarea></td></tr>
			<tr><td>태그 공개</td><td class="td-padding">${vo.tag_open }</td></tr>
			<tr><td>후원이력 공개</td><td class="td-padding">${vo.s_history_open }</td></tr>
			<tr><td>가입 날짜</td><td class="td-padding">${vo.join_date}</td></tr>
			<tr><td>탈퇴 날짜</td><td class="td-padding">${vo.leave_date}</td></tr>
			<tr class="e-o-tb"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<input type="hidden" name="member_idx" value="${vo.member_idx }">
		<input type="hidden" name="cPage" value="${cPage }">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="member_update(this.form)">수 정</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="member_delete(this.form)">탈 퇴</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="member_list(this.form)">목 록</button></div>
	</div> 
</form>	
</section>
</body>
</html>