<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Date date = new Date();
	SimpleDateFormat simDateFormat = new SimpleDateFormat("yyyy. MM. dd");
	String sysdate = simDateFormat.format(date);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project_List</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
	<style type="text/css">
		table {
			width: 1000px;
			margin: 100px auto 150px auto;
			border-spacing: 0;
			font-family: 'NanumSquareNeo';
			text-align: center;
		}
		
		tbody>tr>td {
			height: 50px;
		}
		
		#review_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold'; 
		}
		
		#review_list, #review_save{
			border-radius: 5px;
			width: 120px; 
			height: 50px; 
			color: white; 
			border-color:rgb(0, 87, 146); 
			background-color: rgb(0, 87, 146); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold';
			margin-right: 30px;
			cursor: pointer;
		}
		
		#review_regi{
			border-radius: 5px;
			width: 120px; 
			height: 50px; 
			color: white; 
			border-color:rgb(253, 95, 0); 
			background-color: rgb(253, 95, 0); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
		}
		
		#btn{
			text-align: center;
			margin-top: -100px;
			margin-bottom: 50px;
		}
		
		.review_attach{
			height: 30px;
			width: 300px;
			font-size: 15px;
			border: none;
			background-color: white;
		}
		
		.review_old_attach{
			height: 30px;
			width: 300px;
			font-size: 15px;
			border: none;
			background-color: white;
			text-align: center;
		}
		#re_title{
			width: 700px;
			height: 30px;
			font-size: 15px;
			text-align: center;
			border: none;
			outline: none;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var file = "";
			var filePath = "";
			var filePathSplit = ""; 
			var filePathLength = "";
			var fileNameSplit = "";
			var fileName = "";
			var fileExt = "";
			var fileSize = "";
			var img_name_start = "";
			
			// 첨부 이미지
			$("#review_img_attach1").click(function (e) {
			 	e.preventDefault();
				$("#review_attach1").click();
			});
			
			review_img_attach1_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("review_attach1");
					// 파일 경로.
					filePath = file.value;
					// 전체경로를 \ 나눔.
					filePathSplit = filePath.split("\\"); 
					// 전체경로를 \로 나눈 길이.
					filePathLength = filePathSplit.length;
					// 마지막 경로를 .으로 나눔.
					fileNameSplit = filePathSplit[filePathLength-1].split(".");
					// 파일명 : .으로 나눈 앞부분
					fileName = fileNameSplit[0];
					// 파일 확장자 : .으로 나눈 뒷부분
					fileExt = fileNameSplit[1];
					// 파일 크기
					// fileSize = file.files[0].size;
					
					$("#re_f_name1").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#re_f_name1").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#review_img_attach2").click(function (e) {
			 	e.preventDefault();
				$("#review_attach2").click();
			});
			
			review_img_attach2_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("review_attach2");
					// 파일 경로.
					filePath = file.value;
					// 전체경로를 \ 나눔.
					filePathSplit = filePath.split("\\"); 
					// 전체경로를 \로 나눈 길이.
					filePathLength = filePathSplit.length;
					// 마지막 경로를 .으로 나눔.
					fileNameSplit = filePathSplit[filePathLength-1].split(".");
					// 파일명 : .으로 나눈 앞부분
					fileName = fileNameSplit[0];
					// 파일 확장자 : .으로 나눈 뒷부분
					fileExt = fileNameSplit[1];
					// 파일 크기
					// fileSize = file.files[0].size;
					
					$("#re_f_name2").val(fileName + "." + fileExt);
					if (fileName == null) {
						$("#re_f_name2").val("");
					}
				}
			}
			
			// 파일을 선택하면 반복 종료
			if ($("#re_f_name2").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#review_img_attach3").click(function (e) {
			 	e.preventDefault();
				$("#review_attach3").click();
			});
			
			review_img_attach3_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("review_attach3");
					// 파일 경로.
					filePath = file.value;
					// 전체경로를 \ 나눔.
					filePathSplit = filePath.split("\\"); 
					// 전체경로를 \로 나눈 길이.
					filePathLength = filePathSplit.length;
					// 마지막 경로를 .으로 나눔.
					fileNameSplit = filePathSplit[filePathLength-1].split(".");
					// 파일명 : .으로 나눈 앞부분
					fileName = fileNameSplit[0];
					// 파일 확장자 : .으로 나눈 뒷부분
					fileExt = fileNameSplit[1];
					// 파일 크기
					// fileSize = file.files[0].size;
					
					$("#re_f_name3").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#re_f_name3").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#review_img_attach4").click(function (e) {
			 	e.preventDefault();
				$("#review_attach4").click();
			});
			
			review_img_attach4_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("review_attach4");
					// 파일 경로.
					filePath = file.value;
					// 전체경로를 \ 나눔.
					filePathSplit = filePath.split("\\"); 
					// 전체경로를 \로 나눈 길이.
					filePathLength = filePathSplit.length;
					// 마지막 경로를 .으로 나눔.
					fileNameSplit = filePathSplit[filePathLength-1].split(".");
					// 파일명 : .으로 나눈 앞부분
					fileName = fileNameSplit[0];
					// 파일 확장자 : .으로 나눈 뒷부분
					fileExt = fileNameSplit[1];
					// 파일 크기
					// fileSize = file.files[0].size;
					
					$("#re_f_name4").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#re_f_name4").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#review_img_attach5").click(function (e) {
			 	e.preventDefault();
				$("#review_attach5").click();
			});
			
			review_img_attach5_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("review_attach5");
					// 파일 경로.
					filePath = file.value;
					// 전체경로를 \ 나눔.
					filePathSplit = filePath.split("\\"); 
					// 전체경로를 \로 나눈 길이.
					filePathLength = filePathSplit.length;
					// 마지막 경로를 .으로 나눔.
					fileNameSplit = filePathSplit[filePathLength-1].split(".");
					// 파일명 : .으로 나눈 앞부분
					fileName = fileNameSplit[0];
					// 파일 확장자 : .으로 나눈 뒷부분
					fileExt = fileNameSplit[1];
					// 파일 크기
					// fileSize = file.files[0].size;
					
					$("#re_f_name5").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#re_f_name5").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
		})
	</script>
	<script type="text/javascript">
		function review_update(f) {
			f.action="review_update.do?cPage=${cPage}&review_idx=${review_idx}";
			f.submit();
		}
		
		function review_list_go(f) {
			f.action="review_list.do";
			f.submit();
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<div id="review_title">
			<h1>후기 작성</h1>
		</div>
	</header>
	
	<form method="post" enctype="multipart/form-data">
		<div style="width: 100%">
		<table border="1">
			<tbody>
				<tr>
					<td><input type="text" id="re_title" name="re_title" value="${revo.re_title}"></td>
					<td width="15%">${revo.id}</td>
					<td width="15%"><%=sysdate%></td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea name="re_content" id="re_content" rows="50" cols="138" style="resize: none">${revo.re_content}</textarea>
					</td>
				</tr>
			</tbody>
			</table>
		</div>
		<div style="margin-top: -152px; width: 100%">
			<table border="1">
				<tbody>
				<tr>
					<c:choose>
						<c:when test="${empty revo.re_f_name1}">
							<td width="30%">첨부이미지</td>
							<td>
								<span><input type="text" id="re_f_name1" class="review_attach" disabled></span>
								<a href="javascript:void(0);" id="review_img_attach1">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach1" type="file" name="re_f_param1" accept="image/*" onclick="review_img_attach1_url(this);">
									<input type="hidden" name="old_re_f_name1">
								</span>
							</td>
						</c:when>
						<c:otherwise>
							<td width="30%">첨부이미지</td>
							<td>
								<span>
									<input type="text" id="re_f_name1" class="review_attach" disabled>
									<input type="text" class="review_old_attach" value="기존파일 : ${revo.re_f_name1}" disabled>
								</span>
								<a href="javascript:void(0);" id="review_img_attach1">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach1" type="file" name="re_f_param1" accept="image/*" onclick="review_img_attach1_url(this);">
									<input type="hidden" name="old_re_f_name1" value="${revo.re_f_name1}">
								</span>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${empty revo.re_f_name2}">
							<td width="30%">첨부이미지</td>
							<td>
								<span><input type="text" id="re_f_name2" class="review_attach" disabled></span>
								<a href="javascript:void(0);" id="review_img_attach2">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach2" type="file" name="re_f_param2" accept="image/*" onclick="review_img_attach2_url(this);">
									<input type="hidden" name="old_re_f_name2">
								</span>
							</td>
						</c:when>
						<c:otherwise>
							<td width="30%">첨부이미지</td>
							<td>
								<span>
									<input type="text" id="re_f_name2" class="review_attach" disabled>
									<input type="text" class="review_old_attach" value="기존파일 : ${revo.re_f_name2}" disabled>
								</span>
								<a href="javascript:void(0);" id="review_img_attach2">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach2" type="file" name="re_f_param2" accept="image/*" onclick="review_img_attach2_url(this);">
									<input type="hidden" name="old_re_f_name2" value="${revo.re_f_name2}">
								</span>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${empty revo.re_f_name3}">
							<td width="30%">첨부이미지</td>
							<td>
								<span><input type="text" id="re_f_name3" class="review_attach" disabled></span>
								<a href="javascript:void(0);" id="review_img_attach3">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach3" type="file" name="re_f_param3" accept="image/*" onclick="review_img_attach3_url(this);">
									<input type="hidden" name="old_re_f_name3">
								</span>
							</td>
						</c:when>
						<c:otherwise>
							<td width="30%">첨부이미지</td>
							<td>
								<span>
									<input type="text" id="re_f_name3" class="review_attach" disabled>
									<input type="text" class="review_old_attach" value="기존파일 : ${revo.re_f_name3}" disabled>
								</span>
								<a href="javascript:void(0);" id="review_img_attach3">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach3" type="file" name="re_f_param3" accept="image/*" onclick="review_img_attach3_url(this);">
									<input type="hidden" name="old_re_f_name3" value="${revo.re_f_name3}">
								</span>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${empty revo.re_f_name4}">
							<td width="30%">첨부이미지</td>
							<td>
								<span><input type="text" id="re_f_name4" class="review_attach" disabled></span>
								<a href="javascript:void(0);" id="review_img_attach4">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach4" type="file" name="re_f_param4" accept="image/*" onclick="review_img_attach4_url(this);">
									<input type="hidden" name="old_re_f_name4">
								</span>
							</td>
						</c:when>
						<c:otherwise>
							<td width="30%">첨부이미지</td>
							<td>
								<span>
									<input type="text" id="re_f_name4" class="review_attach" disabled>
									<input type="text" class="review_old_attach" value="기존파일 : ${revo.re_f_name4}" disabled>
								</span>
								<a href="javascript:void(0);" id="review_img_attach4">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach4" type="file" name="re_f_param4" accept="image/*" onclick="review_img_attach4_url(this);">
									<input type="hidden" name="old_re_f_name4" value="${revo.re_f_name4}">
								</span>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${empty revo.re_f_name5}">
							<td width="30%">첨부이미지</td>
							<td>
								<span><input type="text" id="re_f_name5" class="review_attach" disabled></span>
								<a href="javascript:void(0);" id="review_img_attach5">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach5" type="file" name="re_f_param5" accept="image/*" onclick="review_img_attach5_url(this);">
									<input type="hidden" name="old_re_f_name5">
								</span>
							</td>
						</c:when>
						<c:otherwise>
							<td width="30%">첨부이미지</td>
							<td>
								<span>
									<input type="text" id="re_f_name5" class="review_attach" disabled>
									<input type="text" class="review_old_attach" value="기존파일 : ${revo.re_f_name5}" disabled>
								</span>
								<a href="javascript:void(0);" id="review_img_attach5">
									<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
								</a>
								<span style="display: none;">
									<input id="review_attach5" type="file" name="re_f_param5" accept="image/*" onclick="review_img_attach5_url(this);">
									<input type="hidden" name="old_re_f_name5" value="${revo.re_f_name5}">
								</span>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</table>
		</div>
		<div id="btn">
			<input id="review_list" type="button" value="목록" onclick="review_list_go(this.form)">
			<input id="review_save" type="button" value="글수정" onclick="review_update(this.form)">
		</div>
	</form>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	
	<script src="resources/js/summernote-lite.js"> </script>
	<script src="resources/js/lang/summernote-ko-KR.js"> </script>
	<script type="text/javascript">
		$(function(){
			$("#re_content").summernote({	
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
				
				height: 500,
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
			$("#re_content").summernote("lineHeight", .7);
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
				$("#re_content").summernote("editor.insertImage", path+"/"+fname);
			});
		}
	</script>
</body>
</html>