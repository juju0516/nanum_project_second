<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project_List</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/summernote-lite.css">
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
		
		#aids_List, #aids_save{
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
		
		#aids_regi{
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
		
		.aids_attach{
			height: 30px;
			width: 600px;
			font-size: 15px;
			border: none;
			background-color: white;
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
			$("#aids_img_attach1").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach1").click();
			});
			
			aids_img_attach1_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach1");
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
					
					$("#aids_img_name1").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_img_name1").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#aids_img_attach2").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach2").click();
			});
			
			aids_img_attach2_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach2");
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
					
					$("#aids_img_name2").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_img_name2").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#aids_img_attach3").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach3").click();
			});
			
			aids_img_attach3_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach3");
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
					
					$("#aids_img_name3").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_img_name3").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			// 증빙서류
			$("#aids_paper_attach1").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach4").click();
			});
			
			aids_paper_attach1_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach4");
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
					
					$("#aids_paper_name1").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_paper_name1").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#aids_paper_attach2").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach5").click();
			});
			
			aids_paper_attach2_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach5");
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
					
					$("#aids_paper_name2").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_paper_name2").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#aids_paper_attach3").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach6").click();
			});
			
			aids_paper_attach3_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach6");
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
					
					$("#aids_paper_name3").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_paper_name3").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#aids_paper_attach4").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach7").click();
			});
			
			aids_paper_attach4_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach7");
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
					
					$("#aids_paper_name4").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_paper_name4").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#aids_paper_attach5").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach8").click();
			});
			
			aids_paper_attach5_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach8");
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
					
					$("#aids_paper_name5").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_paper_name5").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			// 신분증
			$("#aids_ID_attach").click(function (e) {
			 	e.preventDefault();
				$("#aids_attach9").click();
			});
			
			aids_ID_attach_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("aids_attach9");
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
					
					$("#aids_ID_name").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#aids_ID_name").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
		})
	</script>
	<script type="text/javascript">
		function aids_main_go(f) {
			f.action="aids_main_go.do";
			f.submit();
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
	</header>
	
	<form method="get">
		<table border="1">
			<tbody>
				<tr>
					<td width="30%">제목</td>
					<td>나누미 모집</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>김나누미</td>
				</tr>
				<tr>
					<td>참여인원</td>
					<td>55명</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="aids_content" id="aids_content" rows="50" cols="138" style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td>
						<span><input type="text" id="aids_img_name1" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_img_attach1">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach1" type="file" accept="image/*" onclick="aids_img_attach1_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td>
						<span><input type="text" id="aids_img_name2" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_img_attach2">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach2" type="file" accept="image/*" onclick="aids_img_attach2_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td>
						<span><input type="text" id="aids_img_name3" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_img_attach3">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach3" type="file" accept="image/*" onclick="aids_img_attach3_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span><input type="text" id="aids_paper_name1" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_paper_attach1">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach4" type="file" accept="image/*" onclick="aids_paper_attach1_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span><input type="text" id="aids_paper_name2" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_paper_attach2">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach5" type="file" accept="image/*" onclick="aids_paper_attach2_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span><input type="text" id="aids_paper_name3" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_paper_attach3">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach6" type="file" accept="image/*" onclick="aids_paper_attach3_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span><input type="text" id="aids_paper_name4" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_paper_attach4">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach7" type="file" accept="image/*" onclick="aids_paper_attach4_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span><input type="text" id="aids_paper_name5" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_paper_attach5">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach8" type="file" accept="image/*" onclick="aids_paper_attach5_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>신분증</td>
					<td>
						<span><input type="text" id="aids_ID_name" class="aids_attach" disabled></span>
						<a href="javascript:void(0);" id="aids_ID_attach">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="aids_attach9" type="file" accept="image/*" onclick="aids_ID_attach_url(this);">
						</span>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div id="btn">
			<input id="aids_List" type="button" value="목록" onclick="aids_main_go(this.form)">
			<input id="aids_save" type="button" value="임시저장" onclick="aids_save_go(this.form)">
			<input id="aids_regi" type="button" value="신청하기" onclick="aids_regi_ok(this.form)">
		</div>
	</form>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	
	<script src="resources/js/summernote-lite.js"> </script>
	<script src="resources/js/lang/summernote-ko-KR.js"> </script>
	<script type="text/javascript">
		$(function(){
			$("#aids_content").summernote({	
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
			$("#aids_content").summernote("lineHeight", .7);
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
				$("#aids_content").summernote("editor.insertImage", path+"/"+fname);
			});
		}
	</script>
</body>
</html>