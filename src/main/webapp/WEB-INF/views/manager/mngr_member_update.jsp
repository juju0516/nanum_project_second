<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 회원 정보 수정 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.new-width {
	width:71.5%; 
}

.text-title {
	margin-left: 55px;
	width: 90%;
	font-family: 'NanumSquareNeoLight';
}

.it-gap {
	margin: 0px;
	width: 215px;
}

.td-padding {
	padding-left: 50px;
}

.img-profile {
	height: 40px;
	padding: 5px 0 0 20px;
}

.input-detail {
	width: 210px;
	height: 29px;
	margin: 0px;
	text-align: left;
	text-indent: 10px;
}

.slct-len {
	width: 75px;
}
.addr-len {
	width: 90%;
}

.e-o-tb {
	border-radius: 10px;

	height: 25px;
	border-bottom: 3px solid rgb(224, 224, 224);
}
</style>
<script type="text/javascript">
	function member_update_exec(f) {
		f.action ="mngr_member_update_exec.do";
		f.submit();
	}

	function member_update_cancel(f) {
		f.action ="mngr_member_detail.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 회원 정보 수정 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : admin1</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 가입 회원 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">
						<input class="input-title it-gap" type="text" value="홍길동"></div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>프로필 사진</td>
				<td class="td-padding" style="text-indent: 0">
					<img src="resources/images/system/fullheart.png" class="img-profile">
					<span style="vertical-align:17px;"> profile.png</span>
					<input class="input-file" type="file">
				</td></tr>
			<tr><td>로그인 유형</td><td class="td-padding">카카오 <span>(index: 1)</span></td></tr>
			<tr><td>ID</td><td class="td-padding">AAA</td></tr>		
			<tr><td>닉네임</td>
				<td class="td-padding"><input class="input-text input-detail" type="text" value="A-Nick"></td></tr>
			<tr><td>생년월일</td>
				<td class="td-padding"><input class="input-date" type="date" value="2000-04-10"></td></tr>
			<tr><td>성별</td>
				<td class="td-padding">
				<select class="select-s" name="gender">
						<option value="man"> 남 </option>
						<option value="woman"> 여 </option>
				</select></td></tr>
			<tr><td>전화번호</td>
				<td class="td-padding"><input class="input-text input-detail" type="text" value="010-****-1234"></td></tr>
			<tr><td>Email</td>
				<td class="td-padding"><input class="input-text input-detail" type="text" value="aaa@naver.com"></td></tr>
			<tr><td>주소</td>
				<td class="td-padding"><input class="input-text input-detail addr-len" type="text" value="서울시 마포구"></td></tr>
			<tr><td>보유 나누미</td>
				<td class="td-padding">100 나누미</td></tr>				
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="3">#tag #tag #태그 #태그</textarea></td></tr>
			<tr><td>태그 공개</td><td class="td-padding">
					<select class="select-s slct-len" name="tag-open">
						<option value="public"> 공개 </option>
						<option value="private"> 비공개 </option>
					</select></td></tr>
			<tr><td>후원이력 공개</td><td class="td-padding">
					<select class="select-s slct-len" name="dnt-open">
						<option value="public"> 공개 </option>
						<option value="private"> 비공개 </option>
					</select></td></tr>
			<tr><td>가입 날짜</td>
				<td class="td-padding"><input class="input-date" type="date" value="2023-03-10 23:59:59"></td></tr>
			<tr class="e-o-tb"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="member_update_cancel(this.form)">취 소 (돌아가기)</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="member_update_exec(this.form)">저 장</button></div>
	</div> 
</form>	
</section>
</body>
</html>