<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 문의 내역 상세 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.new-width {
	width:70%; 
}

.text-title {
	margin-left: 20px;
	padding: 0px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 70px;
}

.answer-label {
	/* padding: 10px, 0px, 10px, 0px; */
	background-color: rgb(224, 224, 224);
	font-family: 'NanumSquareNeo';
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function member_inquiry_answer(f) {
		f.action ="mngr_member_inquiry_answer.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 문의 내역 상세 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : admin1</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 프로젝트 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title"> 프로젝트 ABC 문의입니다. </div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>ID</td><td class="td-padding">AAA</td></tr>
			<tr><td>닉네임</td><td class="td-padding">A-Nick</td></tr>
			<tr><td>문의 날짜</td><td class="td-padding">2023-03-10 10:00:00</td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea class="ta" rows="10">
				프로젝트1 문의
				ㄴ[Re:2023-03-11 10:00:00][admin1] 메일 드렸습니다. 
				  ㄴ[Re:2023-03-12] 안왔어요. 
				</textarea></td></tr>
			<tr><td></td></tr>
			<tr><td class="answer-label">답글 입력</td><td></td></tr>
			<tr>
				<td colspan="2" class="result-padding"><textarea class="ta" rows="7">답글 입력</textarea></td>				
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="member_inquiry_answer(this.form)">저 장</button></div>
	</div> 
</form>	
</section>
</body>
</html>