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
		#alarm_delete_group{
			text-align: center;
			margin-top: 15%;
		}
	
		#alarm_delete_cancel{
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
		
		#alarm_delete_go{
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
		function alarm_delete_ok(f) {
			opener.parent.location.reload();
			self.close();
		}
	</script>
</head>
<body>
	<div id="alarm_delete_group">
		<div style="font-family: 'NanumSquareNeoBold'; font-size: 25px; margin-bottom: 40px;">알림 메세지를 삭제하시겠습니까?</div>
		<form action="post">
			<input id="alarm_delete_cancel" type="button" value="취소" onclick="self.close();">
			<input id="alarm_delete_go" type="button" value="삭제" onclick="alarm_delete_ok(this.form)">
		</form>
	</div>
</body>
</html>