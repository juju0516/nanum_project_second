<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세화면입니다.</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<style type="text/css">
		.active{
			font-size: 20px;
		}
		
		.wrap {
		    max-width: 1200px;
		    margin: 100px auto 100px auto;
		    position: relative;
		    text-align: center;
		}
		
		.title {
			padding-left: 100px;
		    max-width: 1000px;
		    margin-bottom: -40px;
		    display: flex;
		    justify-content: space-around; /*div 크기 안에서 좌우로 대칭*/
		    align-items: center; /*제목과 날짜 가운데(높낮이) 정렬*/
		    flex-direction: row;
		    font-family: 'NanumSquareNeoBold';
		}
		.subject {
			font-size: 30px;
			margin: 0px 20px 0px 0px;
			word-break: keep-all; /* 단어별로 줄바꿈 가능하도록 */
		    line-height: 50px; /* 행간 간격*/
		    text-align: -webkit-left;
		}
		.writer {
			font-size: 20px;
		    min-width: 140px;
		    margin: 10px -20px 10px 20px;
		}
		.date {
		    font-size: 20px;
		    min-width: 140px;
		    margin: 10px;
		}
		
		.content {
			max-width: 1200px;
		    margin-top: 100px;
		    margin: 80px 100px 50px 100px;
		    padding: 50px;
		    position: relative;
		    border: 1px solid rgb(0,87,147);
		    border-radius: 40px;
			font-size: 18px;
			font-family: 'NanumBarunGothicLight';
		}
		
		
		.list_go {
			text-align: center;
		    margin: -60px 0 60px 0;
		}
		
		#list_btn {
		 	border-radius: 5px; /*버튼 모서리 둥글게*/
			width: 100px; 
			height: 40px; 
			color: white; 
			border-color:rgb(0, 87, 147);
			background-color: rgb(0, 87, 147); 
			font-size: 17px; 
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
		}
		
		#redbtn{
			border-radius: 5px; /*버튼 모서리 둥글게*/
			width: 100px; 
			height: 40px; 
			color: white; 
			border-color: rgb(253, 95, 0);
			background-color: rgb(253, 95, 0); 
			font-size: 17px; 
			font-family: 'NanumSquareNeoBold'; 
			cursor: pointer;
		} 
		 
		#review_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold'; 
		}
		span { margin-left: 0;}
		a { margin-right: 0;}
		img { max-width: 600px; }/* border를 넘어가지 않을 정도로 이미지 최대너비값 지정*/
	</style>
	<script type="text/javascript">
		function review_list(f) {
			f.action="review_list.do";
			f.submit();
		}
		
		function review_update_page(f) {
			f.action="review_update_page.do?cPage=${cPage}&review_idx=${review_idx}";
			f.submit();
		}
		
	    function review_delete_page(f){
	        var url= "review_delete_page.do?cPage=${cPage}&review_idx=${review_idx}";    //팝업창에 출력될 페이지 URL
	        var name = "review_delete_pop";
	        
	     	// 팝업창 크기
	        var popupWidth = 500;
	        var popupHeigth = 250;

	        // 팝업창 가운데 정렬
	        var popupX = window.screenLeft + window.innerWidth/2 - (popupWidth / 2);
	        var popupY= window.screenTop + window.outerHeight/2 - (popupHeigth / 2);

	        var option="width=" + popupWidth + ",height=" + popupHeigth +
	                   ",left=" + popupX + ",top=" + popupY + 
	                   ",location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
	        
	        window.open(url, name, option); // 이동할주소, 이름, 팝업옵션
	    }
	    
	    function review_delete(f) {
			f.action="review_delete.do?cPage=${cPage}&review_idx=${review_idx}";
			f.submit();
		}
	</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
	<div id="review_title">
		<h1>후기리스트 상세</h1>
	</div>
</header>
<form method="post">
	<section>
		<div class="wrap">
			<div class="title">
				<span class="subject">${revo.re_title}</span>
				<span class="writer">${revo.id}</span>
				<span class="date">${revo.re_date.substring(0,10)}</span>
			</div>
			
			<div class="content">
				<pre>${revo.re_content}</pre>
			</div>
		</div>
		<c:choose>
			<%-- 로그인된 아이디와 글쓴 아이디를 비교 --%>
			<c:when test="${id == revo.id}">
				<div class="list_go">
					<input id="list_btn" type="button" value="목록" onclick="review_list(this.form)">
					<input id="list_btn" type="button" value="수정" onclick="review_update_page(this.form)">
					<input id="redbtn" type="button" value="삭제하기" onclick="review_delete_page(this.form)">
					<div style="display: none;">
						<input id="deletebtn" type="button" value="실제삭제" onclick="review_delete(this.form)">
					</div>
				</div>
			</c:when>
				<c:otherwise>
				<div class="list_go">
					<input id="list_btn" type="button" value="목록" onclick="review_list(this.form)">
				</div>
			</c:otherwise>
		</c:choose>
	</section>
</form>
<footer>
	<jsp:include page="../footer.jsp" />
</footer>
</body>
</html>