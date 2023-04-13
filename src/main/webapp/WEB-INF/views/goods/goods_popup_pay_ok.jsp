<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 결제 확인 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<style type="text/css">
.logo {
	font-family: 'NanumSquareNeoHeavy';
	font-size: 45px;
	font-weight: bold;
	color: rgb(0, 87, 147);
	margin:30px;
}

.pay_wrap {
	text-align: center;
	margin: 30px;
	border: 2px solid #005273;
	border-radius: 5px;
	padding-top: 30px;
	padding-left: 15px;
	font-size: 30px; 
	font-family: 'NanumSquareNeoBold'; 
	padding: 50px;
}

#close_btn{
	margin-top: 50px;
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 80px; 
	height: 30px; 
	color: white; 
	font-size: 13px; 
	font-family: 'NanumSquareNeoBold'; 
	border-color: #005273;
	background-color: #005273; 
	cursor: pointer;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	// 이전 팝업창에서 "window.close();" 를 사용했다면, 함수이름이 같아야 여기에서도 적용된다.
	function cancel() {
		 window.opener.location.reload(); //부모창 reload 
	     window.opener.location.href = "goods_list.do"; 
	     window.close(); 
	}
</script>
</head>

<body>
<form method="post">
	<div class="pay_popup">
		<span class="logo">NANUM ✿</span>
		<div class="pay_wrap">
			 <span>결제가 완료되었습니다.</span>
			<div class="btn_wrap">
				<button id="close_btn" onclick="cancel()">닫기</button>
			</div>
		</div>
	</div>	
</form>
</body>
</html>



