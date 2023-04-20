<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 상시 프로젝트 생성 </title>
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
	width: 90%;
	font-family: 'NanumSquareNeoLight';
}

.it-gap {
	margin: 0px;
	width: 93%;
}
.td-padding {
	padding-left: 50px;
}
.span-gap {
	padding-left: 10px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		document.getElementById("today").value = new Date().toISOString().substring(0, 10);
	});
	
	function project_aids_write_exec(f) {
		f.action ="mngr_prj_aids_write_exec.do";
		f.submit();
	}

	function project_aids_write_cancel(f) {
		f.action ="mngr_prj_aids_detail.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post" encType="multipart/form-data">
	<div class="title"> 상시 프로젝트 생성 </div>
	<div class="admin-loc new-width"><span class="admin-text">관리자 : ${managerID}</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 상시 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">
						<input class="input-title it-gap" type="text" name="prj_title"></div>
					<div class="text-view">0 views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>등록자 ID</td><td class="td-padding">${managerID}</td></tr>
			<tr><td>시작 날짜</td><td class="td-padding"><input class="input-date" type="date" id="today" name="prj_begin_date"></td></tr>
			<tr><td>종료 날짜</td><td class="td-padding"><input class="input-date" type="date" name="prj_end_date"></td></tr>
			<tr><td>지원자 목표</td>	 
				<td class="td-padding"><input class="input-text" style="margin-left:0" type="number" name="goal_num_people"> 명</td></tr>
			<tr><td>후원</td>
				<td class="td-padding">목표 <input class="input-text" type="number" name="goal_point"> 나누미</td></tr>
			<tr><td></td>
				<td class="td-padding">정기 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" id="rglr_yn" name="regular">
						<option value="Y"> Y </option>
						<option value="N"> N </option>
					</select>
				</td>
			</tr>
			<tr><td></td>
				<td class="td-padding">일시 &nbsp;&nbsp;&nbsp;  
					<select class="select-s" id="onetime_yn" name="onetime">
						<option value="Y"> Y </option>
						<option value="N"> N </option>
					</select>
				</td>
			</tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="3" name="tag"></textarea></td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea id="content" rows="15" name="prj_content"></textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>첨부 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
					<span style="vertical-align:17px;"> Main Image</span>
					<input class="input-file" type="file" name="prj_main_img">
				<br>
					<span style="vertical-align:17px;"> File Name1&nbsp;</span>
					<input class="input-file" type="file" name="f_name1">
				<br>
					<span style="vertical-align:17px;"> File Name2</span>
					<input class="input-file" type="file" name="f_name2">
				<br>
					<span style="vertical-align:17px;"> File Name3</span>
					<input class="input-file" type="file" name="f_name3">
				<br>
					<span style="vertical-align:17px;"> File Name4</span>
					<input class="input-file" type="file" name="f_name4"><br>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color"><td><b>프로젝트 결과</b></td><td></td></tr>
			<tr class="tr-color">
				<td colspan="2" class="result-padding"><textarea class="ta" rows="7"></textarea></td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_aids_write_cancel(this.form)">취 소</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_aids_write_exec(this.form)">저 장</button></div>
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