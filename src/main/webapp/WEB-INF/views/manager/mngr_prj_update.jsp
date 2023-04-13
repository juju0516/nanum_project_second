<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 프로젝트 수정 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
.new-width {
	width:70%; 
}
.btn-len {
	width: 140px;
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
	padding-left: 30px;
}
</style>
<script type="text/javascript">
	function project_update_exec(f) {
		f.action ="mngr_prj_update_exec.do";
		f.submit();
	}

	function project_update_cancel(f) {
		f.action ="mngr_prj_detail.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 프로젝트 수정 </div>
	<div class="only-btn-wrap new-width">
		<button class="btn-detail btn-len" onclick="">진행 상태 변경</button></div>
	<div class="admin-loc"><span class="admin-text">관리자 : admin1</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category"> [ 새로 시작된 ] </span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">
						<input class="input-title it-gap" type="text" value="프로젝트 ABC 제목입니다."></div>
					<div class="text-view">300 views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>ID</td><td class="td-padding">AAA</td></tr>
			<tr><td>닉네임</td><td class="td-padding">A-Nick</td></tr>
			<tr><td>승인 날짜</td><td class="td-padding">2023-03-10 10:00:00</td></tr>
			<tr><td>시작 날짜</td><td class="td-padding"><input class="input-date" type="date" value="2023-03-30 09:00:30"></td></tr>
			<tr><td>종료 날짜</td><td class="td-padding"><input class="input-date" type="date" value="2023-04-10 23:59:59"></td></tr>
			<tr><td>후원 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" name="dnt_yn">
						<option value="dnt_y"> O </option>
						<option value="dnt_n"> X </option>
					</select></td>
				<td class="td-padding">현재 50 나누미 / 목표 <input class="input-text" type="number" value="500"> 나누미</td></tr>
			<tr><td></td>
				<td class="td-padding">정기 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" name="rglr_yn">
						<option value="rglr_y"> O </option>
						<option value="rglr_n"> X </option>
					</select>
					<span class="span-gap"> 20 나누미 (2 회 후원, 후원자 2 명)</span>
				</td>
			</tr>
			<tr><td></td>
				<td class="td-padding">일시 &nbsp;&nbsp;&nbsp;  
					<select class="select-s" name="onetime_yn">
						<option value="onetime_y"> O </option>
						<option value="onetime_n"> X </option>
					</select><span class="span-gap"> 30 나누미 (5 회 후원)</span>
				</td>
			</tr>
			<tr><td>지원 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" name="vlt_yn">
						<option value="vlt_y"> O </option>
						<option value="vlt_n"> X </option>
					</select></td>	 
				<td class="td-padding">현재 3 명 / 목표 <input class="input-text" type="number" value="20"> 명</td></tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="4">#tag #tag #태그 #태그</textarea></td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea id="content" rows="10">content</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name1.png</span>
					<input class="input-file" type="file">
				<br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name2.png </span>
					<input class="input-file" type="file">
				<br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name3.png </span>
					<input class="input-file" type="file">
				<br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name4.png </span>
					<input class="input-file" type="file">
				<br>
				<img src="resources/images/system/fullheart.png" class="img-attached">
					<span style="vertical-align:17px;"> image_name5.png </span>
					<input class="input-file" type="file"><br>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color"><td><b>프로젝트 결과</b></td><td></td></tr>
			<tr class="tr-color">
				<td colspan="2" class="result-padding"><textarea class="ta" rows="10">프로젝트 결과 보고</textarea></td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_update_cancel(this.form)">취 소</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_update_exec(this.form)">저 장</button></div>
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