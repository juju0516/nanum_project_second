<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 프로젝트 상세 </title>
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
	margin-left: 20px;
	padding: 0px 10px 0px 0px;
	font-family: 'NanumSquareNeoLight';
}

.td-padding {
	padding-left: 80px;
}
.span-gap {
	padding-left: 30px;
}
</style>
<script type="text/javascript">
	function change_category_popup(project_idx, cPage) {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_prj_category_popup.do?project_idx="+project_idx+"&cPage="+cPage; 
		var name = "change_project_category";
		
		// 팝업창 크기
		var popupWidth = 700;
		var popupHeigth = 400;
		
		/*팝업창 가운데 정렬*/
		var popupX = window.screenLeft + window.outerWidth/2 - (popupWidth / 2);		
		var popupY= window.screenTop + window.outerHeight/2 - (popupHeigth / 2);
		
		var option="width=" + popupWidth + ",height=" + popupHeigth +
		           ",left=" + popupX + ",top=" + popupY + 
		           ",location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
		
		//이동할주소, 이름, 팝업옵션
	    window.open(url, name, option);
	}
	
	function project_update(f) {
		f.action ="mngr_prj_update.do";
		f.submit();
	}
	
	function project_delete_popup() {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_prj_delete_popup.do?project_idx=${vo.project_idx}&cPage=${cPage}"; 
		var name = "project_delete";
		
		// 팝업창 크기
		var popupWidth = 700;
		var popupHeigth = 400;
		
		/*팝업창 가운데 정렬*/
		var popupX = window.screenLeft + window.outerWidth/2 - (popupWidth / 2);		
		var popupY= window.screenTop + window.outerHeight/2 - (popupHeigth / 2);
		
		var option="width=" + popupWidth + ",height=" + popupHeigth +
		           ",left=" + popupX + ",top=" + popupY + 
		           ",location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
		
		//이동할주소, 이름, 팝업옵션
	    window.open(url, name, option);
	}
	
	function project_list(f) {
		f.action ="mngr_prj_list.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 프로젝트 상세 </div>
	<div class="only-btn-wrap new-width">
		<button class="btn-detail btn-len" onclick="change_category_popup('${vo.project_idx}','${cPage}')">진행 상태 변경</button></div>
	<div class="admin-loc"><span class="admin-text">관리자 : ${vo.manager_id }</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ ${vo.prj_category} ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title"> ${vo.prj_title} </div>
					<div class="text-view">${vo.prj_hit} views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>ID</td><td class="td-padding">${vo.id}</td></tr>
			<tr><td>닉네임</td><td class="td-padding">${vo.nickname}</td></tr>
			<tr><td>승인 날짜</td><td class="td-padding">${vo.aprv_date }</td></tr>
			<tr><td>시작 날짜</td><td class="td-padding">${vo.prj_begin_date }</td></tr>
			<tr><td>종료 날짜</td><td class="td-padding">${vo.prj_end_date }</td></tr>
			<tr><td>후원 [ ${vo.dnt_flag} ]</td><td class="td-padding">현재 ${vo.cur_point + vo.r_cur_point} 나누미 / 목표 ${vo.goal_point} 나누미</td></tr>
			<tr><td></td><td class="td-padding">정기 [ ${vo.regular} ] <span class="span-gap"> ${vo.r_cur_point} 나누미 (${vo.r_dnt_count} 회 후원, 후원자 ${vo.r_p_count} 명)</span></td></tr>
			<tr><td></td><td class="td-padding">일시 [ ${vo.onetime} ] <span class="span-gap"> ${vo.cur_point} 나누미 (${vo.dnt_count} 회 후원)</span></td></tr>
			<tr><td>지원 [ ${vo.vlt_flag} ]</td><td class="td-padding">현재 ${vo.cur_num_people} 명 / 목표 ${vo.goal_num_people} 명</td></tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="3">${vo.tag}</textarea></td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea class="ta" id="content" rows="15">${vo.prj_content }</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/upload/${vo.id}/attach/${vo.prj_main_img}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.prj_main_img}</span><br>
					
				<c:if test="${vo.f_name1 ne null}">	
				<img src="resources/upload/${vo.id}/attach/${vo.f_name1}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name1}</span><br>
				</c:if>
				<c:if test="${vo.f_name2 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.f_name2}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name2}</span><br>
				</c:if>
				<c:if test="${vo.f_name3 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.f_name3}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name3}</span><br>
				</c:if>
				<c:if test="${vo.f_name4 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.f_name4}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name4}</span><br>
				</c:if>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color"><td><b>프로젝트 결과</b></td><td></td></tr>
			<tr class="tr-color">
				<td colspan="2" class="result-padding">
				<textarea class="ta" rows="5"><c:out value="${vo.prj_result }" /></textarea></td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<input type="hidden" name="project_idx" value="${project_idx }">
		<input type="hidden" name="cPage" value="${cPage }">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_update(this.form)">수 정</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_delete_popup()">삭 제 (내림)</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_list(this.form)">목 록</button></div>
	</div> 
</form>	
</section>
<jsp:include page="editor_script.jsp" />
</body>
</html>