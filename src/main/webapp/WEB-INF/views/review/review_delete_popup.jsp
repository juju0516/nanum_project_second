<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<style type="text/css">
		#review_delete_group{
			text-align: center;
			margin-top: 15%;
		}
	
		#review_delete_cancel{
			border-radius: 5px;
			width: 100px; 
			height: 40px; 
			color: white; 
			border-color: rgb(0, 87, 146); 
			background-color: rgb(0, 87, 146); 
			font-size: 19px;
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
			margin-right: 40px;
		}
		
		#review_delete_ok{
			border-radius: 5px;
			width: 100px; 
			height: 40px; 
			color: white; 
			border-color: rgb(253, 95, 0); 
			background-color: rgb(253, 95, 0); 
			font-size: 19px; 
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
		}
		
		
	</style>
	<script type="text/javascript">
		function review_delete(f) {
			// 부모창 review_delete(f) 함수 실행
			// opener.parent.review_delete(this.form);
			// opener.parent.location.reload();
			// parent.document.getElementById("deletebtn").click();
			// parent.review_delete();
			// f.action="review_delete.do?cPage=${cPage}&review_idx=${review_idx}";
			// f.submit();
			window.opener.review_delete(this.form);
			self.close();
		}
	</script>
</head>
<body>
	<div id="review_delete_group">
		<div style="font-family: 'NanumSquareNeoBold'; font-size: 25px; margin-bottom: 40px;">후기글을 삭제하시겠습니까?</div>
		<form action="post">
			<input id="review_delete_cancel" type="button" value="취소" onclick="self.close();">
			<input id="review_delete_ok" type="button" value="삭제" onclick="review_delete(this.form)">
		</form>
	</div>
</body>
</html>