<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 보조기구 신청 상세 </title>
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
	padding-left: 80px;
	/*padding-top: 7px;*/
}
.span-gap {
	padding-left: 10px;
}
</style>
<script type="text/javascript">
	function goods_update(f) {
		f.action ="mngr_goods_update.do";
		f.submit();
	}
	
	function goods_delete(f) {
		f.action ="mngr_goods_delete.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 보조기구 신청 상세 </div>
	<div class="only-btn-wrap new-width">
		<button class="btn-detail btn-len" onclick="">심사 시작</button></div>
	<div class="admin-loc"><span class="admin-text">관리자 : admin1</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 신청 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">보조 기구 신청합니다.</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>신청자 ID</td><td class="td-padding">ID-AAA</td></tr>
			<tr><td>신청자 이름</td><td class="td-padding">에*이</td></tr>
			<tr><td>신청 날짜</td><td class="td-padding">2023-03-30 09:00:30</td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea class="ta" rows="20">신청 내용</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>첨부 파일</b></td>
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
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>증빙 서류</b></td>
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
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_update(this.form)">승 인</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_delete(this.form)">거 절</button></div>
	</div> 
</form>	
</section>
</body>
</html>