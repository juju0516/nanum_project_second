<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find id pw</title>
<script type="text/javascript">
	 function find_id_go(f) {
		alert("설정하신 아이디는" + ${mvo.id} + "입니다.");
	}
	function find_pw_go(f) {
		alert("패스워드가 이메일로 발송되었습니다.");
	} 
</script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link href="resources/css/find_id_pw.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<h1
		style="text-align: center; margin-top: 80px; margin-bottom: 30px; margin-left: 20px;">ID/PW
		찾기</h1>
	<div style="border-top: 2px solid gray; margin-bottom: 60px;"></div>
	<section>
		<form>
			<div id="all_find">
				<div class="id">
					<h2 style="text-align: center; margin-top: 60px;">ID 찾기</h2>
					<div class="find_id">
						<table>
							<tr>
								<td>이름:</td>
								<td><input type="text" id="user" name="i_write_id"  placeholder="이름을 입력하세요"></td>
							</tr>
							<tr>
								<td>전화번호:</td>
								<td><input type="text" id="user" name="i_write_phone" 
									placeholder="(-)를 제외하고 입력하세요"></td>
							</tr>
						</table>
					</div>
					<div>
						<tr>
							<td><a href="find_id_email.do"
								style="font-size: 12px; margin-left: 180px; color: blue; border-bottom: 1px solid blue;">e-mail로
									찾기</a></td>
						</tr>
					</div>
					<div class="next">
						<a href="next_page"><button class="next_btn"
								onclick="find_id_go(this.form)">완료</button></a>
					</div>
				</div>
				<div style="margin: 50px; border-left: 3px solid gray;"></div>
				<div class="pw">
					<h2 style="text-align: center; margin-top: 60px;">PW 찾기</h2>
					<div class="find_pw">
						<table>
							<tr>
								<td>ID:</td>
								<td><input type="text" id="user" name="p_write_id" placeholder="ID를 입력하세요"></td>
							</tr>
							<tr>
								<td>e-mail:</td>
								<td><input type="text" id="user" name="p_write_email" placeholder="e-mail 입력하세요"></td>
							</tr>
						</table>
					</div>
					<div class="next2">
						<a href="next_page2"><button class="next_btn2"
								onclick="find_pw_go(this.form)">완료</button></a>
					</div>
				</div>
			</div>
		</form>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>