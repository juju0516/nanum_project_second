<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : Manager Info </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">

<style type="text/css">
.title {
	margin-top: 50px;
	display: flex;
	flex-direction: row;
	justify-content: center;
}
.title-sub1 {
	margin: 0px 120px 0px 120px;
	font-size: 23px;
	font-family: 'NanumSquareNeoBold'; 

}
.title-sub1 a {
	text-decoration: none;
	color: black;
}
.title-sub1 a:hover {
	background-color: rgb(234, 234, 234);
	color: black;
	font-weight: bold;
	border-bottom: 2px solid black;
}

.btn-wrap {
	display: flex;
	justify-content: flex-end;
	width: 75%;
}
.btn-create {
	margin: 30px 0px 10px 0px;
	float: right;
}
</style>
<script type="text/javascript">
	function open_create_popup() {
		if("${managerID}" != "${superID}") {
			alert("Super 관리자 기능입니다.");
			return;
		}
		
		//팝업창에 출력될 페이지 URL
		var url = "mngr_manager_create_popup.do"; 
		var name = "create_manager_info";
		
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
	
	function open_update_popup(manager_id) {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_manager_update_popup.do?manager_id=" + manager_id; 
		var name = "update_manager_info";
		
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
	
	function open_delete_popup(manager_id) {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_manager_delete_popup.do?manager_id=" + manager_id; 
		var name = "delete_manager_info";
		
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
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 
		<div class="title-sub1">
			<a href="mngr_member_list.do"> 회원 정보 </a></div>
		<div class="title-sub1" style="background-color:rgb(234, 234, 234);">
			<a href="mngr_manager_info.do"> 관리자 정보 </a></div>
	</div>
	<div class="btn-wrap">
		<div class="btn-create"><button class="btn-detail" onclick="open_create_popup()"> 생 성</button></div>
	</div>
	<div class="table-wrap">
	<table>
		<thead>
			<tr><th>No.</th><th>관리자 ID</th><th>이름</th><th>전화번호</th><th>시작 날짜</th>
			<th>상태</th><th>종료 날짜</th><th width="27%"></th></tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty mng_list}">
				<tr>
					<td colspan="8"><h3>Manager 정보 없음</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${mng_list }" varStatus="vs">
					<tr>
					<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
					<td>${k.manager_id}</td>
					<td>${k.manager_name}</td>
					<td>${k.manager_phone}</td>
					<td>${k.begin_date.substring(0,10)}</td>
					<td>${k.manager_state}</td>
					<c:choose>
						<c:when test="${empty k.end_date}">
							<td> - </td>
						</c:when>
						<c:otherwise>
							<td>${k.end_date.substring(0,10)}</td>
						</c:otherwise>
					</c:choose>
					<td style="text-align:right">
						<button class="btn-detail-s" onclick="open_update_popup('${k.manager_id}')">수 정</button>  &nbsp;
						<button class="btn-detail-s" onclick="open_delete_popup('${k.manager_id}')">사용 중지</button></td>
					</tr>
				</c:forEach>
			</c:otherwise>	
		</c:choose>	
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<!-- 페이지기법 -->
	<section>
		<ol class="paging">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
					<li class="disable"> &lt; </li>
				</c:when>
				<c:otherwise>
					<li><a href="mngr_manager_info.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> &lt; </a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- 블록안에 들어간 페이지번호들 -->
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
				<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
				<c:choose>
					<c:when test="${k == paging.nowPage}">
						<li class="now">${k}</li>
					</c:when>
					<c:otherwise>
						<li><a href="mngr_manager_info.do?cPage=${k}">${k}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
			   	<c:when test="${paging.endBlock >= paging.totalPage}">
			   		<li class="disable"> &gt;</li>
			   	</c:when>
			   	<c:otherwise>
			   		<li><a href="mngr_manager_info.do?cPage=${paging.beginBlock+paging.pagePerBlock}"> &gt;</a></li>
			   	</c:otherwise>
			</c:choose>
		</ol>
	</section>
</form>	
</section>
</body>
</html>