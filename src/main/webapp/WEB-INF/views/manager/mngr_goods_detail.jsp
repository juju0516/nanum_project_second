<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 굿즈 정보 상세 </title>
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
.span-gap {
	padding-left: 10px;
}
</style>
<script type="text/javascript">
	function goods_update(f) {
		if("${vo.g_state}" == "내림") {
			alert("내림 처리된 상품의 내용은 수정할 수 없습니다.");
			reutrn;
		}
		
		f.action ="mngr_goods_update.do";
		f.submit();
	}
	
	function open_delete_popup() {
		//팝업창에 출력될 페이지 URL
		var url = "mngr_goods_delete_popup.do?goods_idx=${vo.goods_idx}&cPage=${cPage}"; 
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
	
	function goods_list(f) {
		f.action ="mngr_goods_list.do?init=y";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 굿즈 정보 상세 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : ${vo.manager_id}</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ ${vo.g_state} ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">[ ${vo.goods_code} ] &nbsp;&nbsp;&nbsp; ${vo.goods_name}</div>
					<div class="text-view">${vo.goods_hit} views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>가격</td><td class="td-padding">${vo.price} 나누미</td></tr>
			<tr><td>총 재고 수량</td><td class="td-padding">${vo.init_amount} 개</td></tr>
			<tr><td>현재 재고 수량</td><td class="td-padding">${vo.cur_amount} 개</td></tr>
			<tr><td>판매 시작 날짜</td><td class="td-padding">${vo.open_date}</td></tr>
			<c:choose>
				<c:when test="${vo.close_date eq null}">
					<tr><td>판매 종료 날짜</td><td class="td-padding"> - </td></tr>
				</c:when>
				<c:otherwise>
					<tr><td>판매 종료 날짜</td><td class="td-padding">${vo.close_date}</td></tr>
				</c:otherwise>
			</c:choose>
			<tr><td>일반 배송비</td><td class="td-padding">${vo.delivery_charge} 나누미</td></tr>
			<tr><td>특수 배송비</td><td class="td-padding">${vo.delivery_charge_l} 나누미</td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea class="ta" id="content" rows="15">${vo.goods_content}</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/upload/system/attach/${vo.goods_main_img}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_main_img} </span><br>
				
				<c:if test="${vo.goods_soldout_img ne null}">
				<img src="resources/upload/system/attach/${vo.goods_soldout_img}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_soldout_img} </span><br>
				</c:if>
				
				<c:if test="${vo.goods_f_name1 ne null}">	
				<img src="resources/upload/system/attach/${vo.goods_f_name1}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_f_name1}</span><br>
				</c:if>
					
				<c:if test="${vo.goods_f_name2 ne null}">
				<img src="resources/upload/system/attach/${vo.goods_f_name2}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_f_name2} </span><br>
				</c:if>
				
				<c:if test="${vo.goods_f_name3 ne null}">
				<img src="resources/upload/system/attach/${vo.goods_f_name3}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_f_name3} </span><br>
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
		<input type="hidden" name="cPage" value="${cPage}">
		<input type="hidden" name="goods_idx" value="${vo.goods_idx}">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_update(this.form)">수 정</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="open_delete_popup()">삭 제 (내림)</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_list(this.form)">목 록</button></div>
	</div> 
</form>	
</section>
<jsp:include page="editor_script.jsp" />
</body>
</html>