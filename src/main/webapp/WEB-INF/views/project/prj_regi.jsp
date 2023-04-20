<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			/* 가로 크기는 고정이지만 세로크기는 고정X */
			table-layout: fixed; 
		}
		
		tbody>tr>td {
			height: 50px;
		}
		
		#prj_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold';
			margin-top: 50px; 
		}
		
		#prj_List, #prj_save{
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
		
		#prj_regi{
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
			white-space: nowrap;
		}
		
		.prj_attach{
			height: 30px;
			width: 600px;
			font-size: 15px;
			border: none;
			background-color: white;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#prj_thumbnail_image").click(function (e) {
				e.preventDefault();
				$("#prj_thumbnail_image_start").click();
			});
			
			// 대표 이미지
			prj_thumbnail_image_name = function(f) {
				if (f.files && f.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						document.getElementById('prj_thumbnail').src = e.target.result;
					};
					reader.readAsDataURL(f.files[0]);
				} else {
					document.getElementById('prj_thumbnail').src = "";
				}
			}
			
			image_restart = function(){
				$("#prj_thumbnail_image_start").click();
			}
			
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
			$("#prj_img_attach1").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach1").click();
			});
			
			prj_img_attach1_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach1");
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
					
					$("#prj_img_name1").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_img_name1").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_img_attach2").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach2").click();
			});
			
			prj_img_attach2_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach2");
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
					
					$("#prj_img_name2").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_img_name2").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_img_attach3").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach3").click();
			});
			
			prj_img_attach3_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach3");
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
					
					$("#prj_img_name3").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_img_name3").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_img_attach4").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach4").click();
			});
			
			prj_img_attach4_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach4");
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
					
					$("#prj_img_name4").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_img_name4").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_img_attach5").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach5").click();
			});
			
			prj_img_attach5_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach5");
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
					
					$("#prj_img_name5").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_img_name5").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			// 증빙서류
			$("#prj_paper_attach1").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach6").click();
			});
			
			prj_paper_attach1_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach6");
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
					
					$("#prj_paper_name1").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_paper_name1").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_paper_attach2").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach7").click();
			});
			
			prj_paper_attach2_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach7");
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
					
					$("#prj_paper_name2").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_paper_name2").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_paper_attach3").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach8").click();
			});
			
			prj_paper_attach3_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach8");
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
					
					$("#prj_paper_name3").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_paper_name3").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_paper_attach4").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach9").click();
			});
			
			prj_paper_attach4_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach9");
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
					
					$("#prj_paper_name4").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_paper_name4").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			$("#prj_paper_attach5").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach10").click();
			});
			
			prj_paper_attach5_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach10");
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
					
					$("#prj_paper_name5").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_paper_name5").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
			
			// 신분증
			$("#prj_ID_attach").click(function (e) {
			 	e.preventDefault();
				$("#prj_attach11").click();
			});
			
			prj_ID_attach_url = function (f) {
				// 0.1초마다 반복 실행시켜 업데이트 한다
				img_name_start = setInterval(start, 100);
				
				function start() {
					file = document.getElementById("prj_attach11");
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
					
					$("#prj_ID_name").val(fileName + "." + fileExt);
					}
				}
			
			// 파일을 선택하면 반복 종료
			if ($("#prj_ID_name").val(fileName + "." + fileExt) != ".undefined") {
				clearInterval(img_name_start);
			}
		})
	</script>
	<script type="text/javascript">
		function prj_list_go(f) {
			f.action="prj_list.do";
			f.submit();
		}
		
		function prj_save_go() {
			f.action="prj_save_go.do";
			f.submit();
		}
	
		function prj_regi_ok(f) {
			f.action="prj_regi_ok.do";
			f.submit();
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="../main_header.jsp" />
		<div id="prj_title">
			<h1>프로젝트 등록</h1>
		</div>
	</header>
	
	<form method="get">
		<table border="1">
			<tbody>
				<tr>
					<td width="30%">신청자</td>
					<td>김나누미</td>
					<td width="30%">대표이미지</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>나누미 모집</td>
					<td rowspan="5" style="height: 300px; overflow: hidden;">
						<div style="padding: 0px; margin: 0px; height: 300px;">
							<span style="display: none;">
								<input id="prj_thumbnail_image_start" type="file" accept="image/*" onchange="prj_thumbnail_image_name(this);">
							</span>
							<img id="prj_thumbnail" onclick="image_restart()" style="width: 300px; height: 275px; border: 0px;">
							<a href="javascript:void(0);" id="prj_thumbnail_image">이미지 등록/수정</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>후원종류</td>
					<td>
						<input type="radio" name="type" value="0" checked>정기후원
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" value="1">일시후원
					</td>
				</tr>
				<tr>
					<td>프로젝트 기간</td>
					<td><input type="date" style="height: 30px; font-size: 15px;">　~　<input type="date" style="height: 30px; font-size: 15px;"></td>
				</tr>
				<tr>
					<td>목표금액</td>
					<td><input type="text" placeholder="나누미를 입력해주세요" style="height: 30px; font-size: 15px; text-align: center;"></td>
				</tr>
				<tr>
					<td>목표인원</td>
					<td><input type="text" placeholder="목표인원를 입력해주세요" style="height: 30px; font-size: 15px; text-align: center;"></td>
				</tr>
				<tr>
					<td colspan="3">내용을 입력해주세요</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea name="content" id="content" rows="50" cols="138" style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" placeholder="#태그입력(최대10개)" style="height: 40px; width: 980px; font-size: 20px; text-align: center;">
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td colspan="2">
						<span><input type="text" id="prj_img_name1" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_img_attach1">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach1" type="file" accept="image/*" onclick="prj_img_attach1_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td colspan="2">
						<span><input type="text" id="prj_img_name2" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_img_attach2">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach2" type="file" accept="image/*" onclick="prj_img_attach2_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td colspan="2">
						<span><input type="text" id="prj_img_name3" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_img_attach3">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach3" type="file" accept="image/*" onclick="prj_img_attach3_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td colspan="2">
						<span><input type="text" id="prj_img_name4" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_img_attach4">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach4" type="file" accept="image/*" onclick="prj_img_attach4_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td colspan="2">
						<span><input type="text" id="prj_img_name5" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_img_attach5">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach5" type="file" accept="image/*" onclick="prj_img_attach5_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td colspan="2">
						<span><input type="text" id="prj_paper_name1" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_paper_attach1">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach6" type="file" accept="image/*" onclick="prj_paper_attach1_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td colspan="2">
						<span><input type="text" id="prj_paper_name2" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_paper_attach2">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach7" type="file" accept="image/*" onclick="prj_paper_attach2_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td colspan="2">
						<span><input type="text" id="prj_paper_name3" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_paper_attach3">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach8" type="file" accept="image/*" onclick="prj_paper_attach3_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td colspan="2">
						<span><input type="text" id="prj_paper_name4" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_paper_attach4">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach9" type="file" accept="image/*" onclick="prj_paper_attach4_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td colspan="2">
						<span><input type="text" id="prj_paper_name5" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_paper_attach5">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach10" type="file" accept="image/*" onclick="prj_paper_attach5_url(this);">
						</span>
					</td>
				</tr>
				<tr>
					<td>신분증</td>
					<td colspan="2">
						<span><input type="text" id="prj_ID_name" class="prj_attach" disabled></span>
						<a href="javascript:void(0);" id="prj_ID_attach">
							<img src="resources/images/system/clip.png" style="width:30px; margin-right: 10px" align="right">
						</a>
						<span style="display: none;">
							<input id="prj_attach11" type="file" accept="image/*" onclick="prj_ID_attach_url(this);">
						</span>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div id="btn">
			<input id="prj_List" type="button" value="목록" onclick="prj_list_go(this.form)">
			<input id="prj_save" type="button" value="임시저장" onclick="prj_save_go(this.form)">
			<input id="prj_regi" type="button" value="신청하기" onclick="prj_regi_ok(this.form)">
		</div>
	</form>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	
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