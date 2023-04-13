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
			f.action="review_writing_go.do";
			f.submit();
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
		<tbody>
			<!-- 지금은 그냥 넣었지만, for문으로 넣어야 함. -->
			<tr>
				<td>1</td>
				<td style="text-align: left; padding-left: 20px;"><a href="review_detail.do">1번 리뷰글</a></td>
				<td>김나누미</td>
				<td>2023-03-24</td>
				<td>23</td>
			</tr>
		
			<tr>
				<td>2</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">2번 리뷰글</a> </td>
				<td>이나누미</td>
				<td>2023-03-20</td>
				<td>23</td>
			</tr>
		
			<tr>
				<td>3</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">3번 리뷰글</a> </td>
				<td>고나누미</td>
				<td>2023-03-15</td>
				<td>100</td>
			</tr>
		
			<tr>
				<td>4</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다. </a></td>
				<td>관리자</td>
				<td>2023-03-02</td>
				<td>150</td>
			</tr>
			<tr>
				<td>5</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>관리자</td>
				<td>2023-02-07</td>
				<td>160</td>
			</tr>
			<tr>
				<td>6</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>관리자</td>
				<td>2023-01-19</td>
				<td>250</td>
			</tr>
			<tr>
				<td>7</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>관리자</td>
				<td>2023-01-02</td>
				<td>270</td>
			</tr>
		
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" style="border: none; text-align: center; padding-top: 80px;">
					<ol class="paging">
						<!-- 이전 -->
						<c:choose>
							<c:when test="true">
								<li class="disable"> &lt; </li>
							</c:when>
							<c:otherwise>
								<li><a href=""> &lt; </a></li>
							</c:otherwise>
						</c:choose>
						<!-- 블록안에 들어간 페이지번호들 -->
						<c:forEach begin="1" end="4" step="1" var="k">
							<!-- 현재 페이지와 아닌 아닌 페이지(링크 걸어야) 구분 -->
							<c:choose>
								<c:when test="false">
									<li class="now">2</li>
								</c:when>
								<c:otherwise>
									<li><a href="">${k}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 다음 -->
						<c:choose>
						   	<c:when test="0">
						   		<li class="disable"> &gt;</li>
						   	</c:when>
						   	<c:otherwise>
						   		<li><a href=""> &gt;</a></li>
						   	</c:otherwise>
						</c:choose>
					</ol>
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