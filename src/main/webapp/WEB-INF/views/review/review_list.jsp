<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 메인</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
	<style type="text/css">
		a {text-decoration: none;}
		
		table {
		    width: 1000px;
			margin: 50px auto 150px auto;
			border-spacing: 0;
			font-family: 'NanumSquareNeo';
		}
		
		th {
			font-family: 'NanumSquareNeoBold';
			font-size: 17px;
			text-align: center;
			padding: 15px;
			background-color: #eaeaea;
			border-bottom: 1px solid #d4d4d4;
			border-top: 1px solid #d4d4d4;
		}
		
		tr {
			font-size: 15px;
			text-align: center;
			padding: 10px;
		}
		
		td	{
			padding: 20px;
		    border-bottom: 1px solid #d4d4d4;
		    margin: 5px;
		}
	
		#review_title{
			text-align: center;
			font-size: 20px;
			font-family: 'NanumSquareNeoBold'; 
			margin-top: 50px;
		}
		
		.review_search_field {
			display: flex;
		    justify-content: center;
		    margin-left: 645px;
		    margin-bottom: -20px;
		}
		
		input.review_search_keyword {
		    width: 200px;
		    height: 50px;
		    border-radius: 5px;
		    font-family: 'NanumBarunGothicLight'; 
		    font-size: 20px;
		    padding-left: 10px;
		}
		
		.review_search_field img {
		    width: 63px;
		    vertical-align: -30px;
		    margin-left: -66px; /* 검색창 안에 이미지 넣기 위해 간격 조정함.*/
		    margin-top: 22px;
		    z-index: 1;
		}
		
		#review_writing{
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
	</style>
	<script type="text/javascript">
		function review_writing_go(f) {
 			if ("${login}" != "ok") {
				alert('로그인이 필요합니다.');
				f.action="login_login.do";
				f.submit();
			} else {
				f.action="review_writing_go.do";
				f.submit();
			}
		}
	</script>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
	<div id="review_title">
		<h1>후기</h1>
	</div>
</header>
<section>
	<!-- 검색결과를 포함하는 내용을 테이블로 출력 -->
	<div class="review_search_field">
		<form method="get">
			<input class="review_search_keyword" type="text">
			<a href="review_search_result.do"><img src="resources/images/system/search.png"></a>
			<input id="review_writing" type="button" value="글쓰기" onclick="review_writing_go(this.form)">
		</form>
	</div>
	<%-- <span class="result">"검색어 ${''}" 검색결과 총 10 "${''}" 건</span> --%>
	<table>
		<thead>
			<tr>
				<th style="width: 10%">No.</th>
				<th>제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 150px">날짜</th>
				<th style="width: 80px">hit</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty review_list}">
				<tr>
					<td colspan="5" style="border: none;">
						<h1 style="font-size: 30px;"> 후기글이 존재하지 않습니다.</h1>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${review_list}" varStatus="vs">
					<tbody>
						<tr>
							<td>${paging.totalRecord - ((paging.nowPage - 1) * paging.numPerPage + vs.index)}</td>
							<td><a href="review_detail.do?review_idx=${k.review_idx}&cPage=${paging.nowPage}">${k.re_title}</a></td>
							<td>${k.id}</td>
							<td>${k.re_date.substring(0,10)}</td>
							<td>${k.re_hit}</td>
						</tr>
					</tbody>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tfoot>
			<tr>
				<td colspan="5" style="border: none;">
					   <%-- 이전 --%>
					    <c:choose>
					    	<c:when test="${paging.beginBlock > paging.pagePerBlock }">
					    		<a href="review_list.do?cPage=${paging.beginBlock-paging.pagePerBlock}">이전으로</a>
					    	</c:when>
					    </c:choose>
						    
					    <!-- 블록안에 들어간 페이지번호들 -->
						<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
							<%-- 현재 페이지는 링크X, 나머지는 해당 페이지로 링크 처리 --%>
							<c:if test="${k==paging.nowPage}">
								${k}
							</c:if>
							<c:if test="${k!=paging.nowPage}">
								<a href="review_list.do?cPage=${k}">${k}</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음 -->
						<c:choose>
					    	<c:when test="${paging.endBlock < paging.totalPage }">
					    		<a href="review_list.do?cPage=${paging.beginBlock+paging.pagePerBlock}">다음으로</a>
					    	</c:when>
					    </c:choose>
					</td>
				</tr>
		</tfoot> 
	</table>
</section>
<footer>
	<jsp:include page="../footer.jsp" />
</footer>
</body>
</html>