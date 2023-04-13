<%@ page language="java"   contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project_List</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
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
		}
		
		#btn{
			text-align: center;
			margin-top: -100px;
			margin-bottom: 50px;
		}
	</style>
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
					<td colspan="2">내용을 입력해주세요</td>
				</tr>
				<tr>
					<td colspan="2">
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
						<p> 내용 </p>
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td>
						<span> 이미지 파일_1 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td>
						<span> 이미지 파일_2 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td>
						<span> 이미지 파일_3 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span> 서류 파일_1 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span> 서류 파일_2 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span> 서류 파일_3 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span> 서류 파일_4 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>증빙서류</td>
					<td>
						<span> 서류 파일_5 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
				<tr>
					<td>신분증</td>
					<td>
						<span> 신분증 파일 </span>
						<img src="resources/images/project/clip.png" style="width:30px; margin-right: 10px" align="right">
					</td>
				</tr>
			</tbody>
		</table>
		
		<div id="btn">
			<input id="prj_List" type="button" value="목록" onclick="prj_List_go(this.form)">
			<input id="prj_save" type="button" value="임시저장" onclick="prj_save_go(this.form)">
			<input id="prj_regi" type="button" value="신청하기" onclick="prj_regi_ok(this.form)">
		</div>
	</form>
	
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>