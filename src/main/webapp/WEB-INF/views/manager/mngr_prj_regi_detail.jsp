<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 프로젝트 등록 상세 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.new-width {
	width:70%; 
}
.btn-len {
	width: 140px;
}

.text-title {
	margin-left: 10px;
	padding: 1px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 80px;
}
</style>
<script type="text/javascript">
	function project_regi_approve(f) {
		f.action ="mngr_prj_regi_approve.do";
		f.submit();
	}
	
	function project_reject(f) {
		f.action ="mngr_prj_regi_reject.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 프로젝트 등록 상세 </div>
	<div class="only-btn-wrap new-width">
		<button class="btn-detail btn-len" onclick="">심사 시작</button></div>
	<div class="admin-loc"><span class="admin-text">관리자 : admin1</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 승인 요청 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title"> 프로젝트 ABC 승인 요청 합니다. </div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>ID</td><td class="td-padding">AAA</td></tr>
			<tr><td>닉네임</td><td class="td-padding">A-Nick</td></tr>
			<tr><td>입력 날짜</td><td class="td-padding">2023-03-10 10:00:00</td></tr>
			<tr><td>취소요청 날짜</td><td class="td-padding">2023-03-30 09:00:30</td></tr>
			<tr><td>취소요청 사유</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="2">취소 요청 사유 </textarea></td></tr>
			<tr><td>심사 날짜</td><td class="td-padding">2023-04-10 23:59:59 (심사자 : admin1)</td></tr>
			<tr><td>후원 [ O ]</td><td class="td-padding">목표 500 나누미</td></tr>
			<tr><td></td><td class="td-padding">정기 [ O ] </td></tr>
			<tr><td></td><td class="td-padding">일시 [ O ] </td></tr>
			<tr><td>지원 [ O ]</td><td class="td-padding">목표 20 명</td></tr>
			<tr><td>진행 기간</td><td class="td-padding">30 일</td></tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="4">#tag #tag #태그 #태그</textarea></td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea class="ta" rows="20">content</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name1.png</span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name2.png </span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name3.png </span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name4.png </span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name5.png </span><br>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>증빙 서류</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> 작성자 신분증</span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name1.png</span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name2.png </span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name3.png </span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name4.png </span><br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name5.png </span><br>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_regi_approve(this.form)">승 인</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_regi_reject(this.form)">거 절</button></div>
	</div> 
</form>	
</section>
</body>
</html>