<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 굿즈 정보 수정 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
.new-width {
	width:71.5%; 
}

.text-title {
	width: 75%;
	padding-left: 30px;
	font-family: 'NanumSquareNeoLight';
}

.it-gap {
	margin: 0px;
	width: 93%;
}
.td-padding {
	padding-left: 17px;
}
.text-gap {
	margin: 0px;
}
</style>
<script type="text/javascript">
	function goods_update_exec(f) {
		f.action ="mngr_goods_update_exec.do?cPage=${cPage}&goods_idx=${vo.goods_idx}";
		f.submit();
	}

	function goods_update_cancel(f) {
		f.action ="mngr_goods_list.do?cPage=${cPage}&goods_idx=${vo.goods_idx}";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post" encType="multipart/form-data">
	<div class="title"> 굿즈 정보 수정 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : ${vo.manager_id}</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><input class="input-title" type="text" name="goods_code" value="${vo.goods_code}"></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">
						<input class="input-title it-gap" type="text" name="goods_name" value="${vo.goods_name}"></div>
					<div class="text-view">${vo.goods_hit} views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width="23%">가격 (나누미)</td>
				<td class="td-padding"><input class="input-text text-gap" type="number" name="price" value="${vo.price}"> 나누미</td></tr>
			<tr><td>총 재고 수량</td>
				<td class="td-padding"><input class="input-text text-gap" type="number" name="init_amount" value="${vo.init_amount}"> 개</td></tr>
			<tr><td>현재 재고 수량</td><td class="td-padding">${vo.cur_amount} 개</td></tr>
			<tr><td>판매 시작 날짜</td><td class="td-padding">${vo.open_date}</td></tr>
			<tr><td>판매 종료 날짜</td><td class="td-padding"><input class="input-date" type="date" name="close_date" value="${vo.close_date.substring(0,10)}"></td></tr>
			<tr><td>일반 배송비</td><td class="td-padding"><input class="input-text text-gap" type="number" name="delivery_charge" value="${vo.delivery_charge}"> 나누미</td></tr>
			<tr><td>특수 배송비</td><td class="td-padding"><input class="input-text text-gap" type="number" name="delivery_charge_l" value="${vo.delivery_charge_l}"> 나누미</td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea id="content" name="goods_content" rows="10">${vo.goods_content}</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/upload/system/attach/${vo.goods_main_img}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_main_img} </span>
					<input class="input-file" type="file" name="f_main">
				<br>
				<img src="resources/upload/system/attach/${vo.goods_soldout_img}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_soldout_img} </span>
					<input class="input-file" type="file" name="f_soldout"><br>
				
				<c:if test="${vo.goods_f_name1 ne null}">		
				<img src="resources/upload/system/attach/${vo.goods_f_name1}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_f_name1}</span>
					<input class="input-file" type="file" name="f_name1">
				<br></c:if>
				
				<c:if test="${vo.goods_f_name2 ne null}">	
				<img src="resources/upload/system/attach/${vo.goods_f_name2}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_f_name2} </span>
					<input class="input-file" type="file" name="f_name2">
				<br></c:if>
				
				<c:if test="${vo.goods_f_name3 ne null}">
				<img src="resources/upload/system/attach/${vo.goods_f_name3}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.goods_f_name3} </span>
					<input class="input-file" type="file" name="f_name3">
				<br></c:if>
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
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_update_cancel(this.form)">취 소</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="goods_update_exec(this.form)">저 장</button></div>
	</div> 
</form>	
</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"> </script>
	<script src="resources/js/lang/summernote-ko-KR.js"> </script>
	<script type="text/javascript">
		$(function(){
			$("#content").summernote({	
				toolbar: [
					// [groupName, [list of button]]
					['fontname', ['fontname']],
					['fontsize', ['fontsize']],
					['style', ['bold', 'italic', 'underline', /*'strikethrough', 'clear'*/]],
					['color', [/*'forecolor',*/'color']],
					['table', ['table']],
					//['para', ['ul', 'ol', 'paragraph']],
					['height', ['height']],
					['insert',['picture','link'/*,'video'*/]],
					//['view', [/*'fullscreen',*/'help']]
				],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				
				height: 300,
				/*maxHeight:400,
				minHeight:200, */
				lang:"ko-KR",
				/* focus:true, */
				
				callbacks:{
					onImageUpload:function(files, editor) {
						for(var i=0; i < files.length; i++) {
							sendImage(files[i], editor)
						}
					}
				}
			});
			$("#content").summernote("lineHeight", .7);
		});	
		
		function sendImage(file, editor) {
			// 서버로 이미지 파일을 보내기 위해 폼 객체 준비
			var frm = new FormData(); // <form></form>
			
			// 폼에 파라미터 값이 등록 (폼 객체 안에 upload라는 이름으로 파일이 등록된다.)
			frm.append("s_file", file);
			
			// 비동기식 통신
			$.ajax({
				url  :"saveImage.do", // 전달하고자하는 서버 위치
				data : frm,            // 전달하고자하는 파라미터
				type : "post",         // 전송 방식
				contentType: false,
				processData: false,
				cache: false,
				dataType: "json"
			}).done(function(data) {
				var path = data.path;    // 이미지가 저장된 경로
				var fname = data.fname; // 파일명
				// 이미지가 서버의 upload 폴더에 저장 성공시
				// 이미지 경로가 data에 저장되어 넘어온다.
				// 이것을 에디터에 넣어주면 된다.
				$("#content").summernote("editor.insertImage", path+"/"+fname);
			});
		}
	</script>
</body>
</html>