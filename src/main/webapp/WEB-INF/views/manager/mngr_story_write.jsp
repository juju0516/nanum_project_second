<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 새 글 등록 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
.s-gap {
	margin-left: 20px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post">
	<div class="title"> 새 글 등록 </div>
	<div class="table-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th width="20%">
				<select class="s-gap" name="category">
					<option value=""> -- 카테고리 -- </option>
					<option value="save"> 사이트 소개 </option>
					<option value="req_regi"> 공지 사항 </option>
					<option value="req_cancel"> 새 소식 </option>
				</select></th>
				<th width="80%"><input class="input-title" type="text" value="제 목"></th>
			</tr>
		</thead>
		<tbody>	
			<tr><td></td></tr>		
			<tr><td><b>내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea id="content" cols="50" rows="10">content</textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td style="text-indent: 0">
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
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick=""> 취 소</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick=""> 등 록</button></div>
	</div> 
</form>	
</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				focus:true,
				
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