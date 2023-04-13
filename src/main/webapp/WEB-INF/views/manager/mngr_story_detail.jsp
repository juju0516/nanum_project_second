<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 소개, 공지 사항, 새 소식 상세 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.text-title {
	margin-left: 20px;
	padding: 0px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 80px;
}
</style>
<script type="text/javascript">
	function story_update(f) {
		f.action ="mngr_story_update.do";
		f.submit();
	}
	
	function story_delete(f) {
		f.action ="mngr_story_delete.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 소개, 공지 사항, 새 소식 상세 </div>
	<div class="table-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 사이트 소개 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">나눔 상시 프로그램 안내</div>
					<div class="text-view">400 views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>관리자 ID</td><td class="td-padding">admin1</td></tr>
			<tr><td>등록 날짜</td><td class="td-padding">2023-03-30 09:00:30</td></tr>
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
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="story_update(this.form)">수 정</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="story_delete(this.form)">삭 제 (내림)</button></div>
	</div> 
</form>	
</section>
</body>
</html>