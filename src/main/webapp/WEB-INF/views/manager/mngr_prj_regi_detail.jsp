<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	function change_state_popup(prj_regi_idx, r_cPage) {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_prj_regi_state_popup.do?prj_regi_idx="+prj_regi_idx+"&r_cPage="+r_cPage; 
		var name = "change_prj_regi_state";
	
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

	function project_regi_approve_popup() {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_prj_regi_approve_popup.do?prj_regi_idx=${prj_regi_idx}&r_cPage=${r_cPage}"; 
		var name = "prj_regi_approve";
	
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
	
	function project_regi_reject_popup() {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_prj_regi_reject_popup.do?prj_regi_idx=${prj_regi_idx}&r_cPage=${r_cPage}"; 
		var name = "prj_regi_reject";
	
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

	function project_regi(f) {
		f.action ="mngr_prj_regi.do";
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
	<c:choose>
	<c:when test="${vo.p_r_state eq '승인 요청' || vo.p_r_state eq '승인요청'}">
		<button class="btn-detail btn-len" onclick="change_state_popup('${vo.prj_regi_idx}', '${r_cPage}')">심사 시작</button>
	</c:when>
	<c:otherwise>
		<button class="btn-detail btn-len btn-disabled" disabled onclick="">심사 시작</button>		
	</c:otherwise>
	</c:choose>
	</div>
	<div class="admin-loc"><span class="admin-text">관리자 : ${vo.manager_id }</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ ${vo.p_r_state} ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title"> ${vo.prj_title} </div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>ID</td><td class="td-padding">${vo.id}</td></tr>
			<tr><td>닉네임</td><td class="td-padding">${vo.nickname}</td></tr>
			<tr><td>입력 날짜</td><td class="td-padding">${vo.submit_date }</td></tr>
			<tr><td>취소요청 날짜</td><td class="td-padding">${vo.req_cancel_date}</td></tr>
			<tr><td>취소요청 사유</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="2"><c:out value="${vo.req_cancel }" /></textarea></td></tr>
			<tr><td>심사 날짜</td><td class="td-padding">
				<c:choose>
				<c:when test="${vo.judge_date eq null}">
					심사 전 
				</c:when>
				<c:otherwise>
					${vo.judge_date } <span style="padding-left:20px"> (심사자 : ${vo.manager_id })</span>
				</c:otherwise>
				</c:choose>
				</td></tr>
			<tr><td>후원</td><td class="td-padding">목표 
				<span style="padding-left:35px"><fmt:formatNumber value="${vo.goal_point }" pattern="#,###" /> 나누미</span></td></tr>
			<tr><td></td><td class="td-padding">정기 [ ${vo.regular } ] </td></tr>
			<tr><td></td><td class="td-padding">일시 [ ${vo.onetime } ] </td></tr>
			<tr><td>지원</td><td class="td-padding">목표 
							<span style="padding-left:35px"> ${vo.goal_num_people } 명</span></td></tr>
			<tr><td>진행 기간</td><td class="td-padding">${vo.period } 일</td></tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="3"><c:out value="${vo.tag }" /></textarea></td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea class="ta" rows="10" id="content">${vo.content }</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
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
				<c:if test="${vo.f_name5 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.f_name5}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name5}</span><br>
				</c:if>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>증빙 서류</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<c:if test="${vo.id_f_name ne null}">	
				<img src="resources/upload/${vo.id}/attach/${vo.id_f_name}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.id_f_name}</span><br>
				</c:if>	
				<c:if test="${vo.crtf_f_name1 ne null}">	
				<img src="resources/upload/${vo.id}/attach/${vo.crtf_f_name1}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.crtf_f_name1}</span><br>
				</c:if>
				<c:if test="${vo.crtf_f_name2 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.crtf_f_name2}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.crtf_f_name2}</span><br>
				</c:if>
				<c:if test="${vo.crtf_f_name3 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.crtf_f_name3}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.crtf_f_name3}</span><br>
				</c:if>
				<c:if test="${vo.crtf_f_name4 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.crtf_f_name4}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.crtf_f_name4}</span><br>
				</c:if>
				<c:if test="${vo.crtf_f_name5 ne null}">		
				<img src="resources/upload/${vo.id}/attach/${vo.crtf_f_name5}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.crtf_f_name5}</span><br>
				</c:if>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<input type="hidden" name="prj_regi_idx" value="${prj_regi_idx}">
		<input type="hidden" name="r_cPage" value="${r_cPage}">
		<c:choose>
		<c:when test="${vo.p_r_state eq '승인 요청' || vo.p_r_state eq '승인요청' || vo.p_r_state eq '심사 중' || 
						vo.p_r_state eq '취소 요청' || vo.p_r_state eq '취소요청' || vo.p_r_state eq '심사중'}">
			<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_regi_approve_popup()">승 인</button></div>
			<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_regi_reject_popup()">거 절</button></div>
		</c:when>
		<c:otherwise>
			<div class="btn-btm-loc"><button class="btn-detail-l btn-disabled" disabled onclick="">승 인</button></div>
			<div class="btn-btm-loc"><button class="btn-detail-l btn-disabled" disabled onclick="">거 절</button></div>
		</c:otherwise>
		</c:choose>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_regi(this.form)">목 록</button></div>
	</div> 
</form>	
</section>
<jsp:include page="editor_script.jsp" />
</body>
</html>