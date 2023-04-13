<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : news_list</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">

a {text-decoration: none;}

table {
    width: 1000px;
	margin: 50px auto 100px auto;
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

</style>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
	<jsp:include page="story_top.jsp" />
</header>
<section>
	<!-- 검색결과를 포함하는 내용을 테이블로 출력 -->
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
				<td style="text-align: left; padding-left: 20px;"><a href="story_news_detail.do">[프로젝트결과] '가나다라'프로젝트 결과 소식 도착!</a></td>
				<td>관리자</td>
				<td>2023-03-24</td>
				<td>23</td>
			</tr>
		
			<tr>
				<td>2</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#해당후기로">[새로오픈] '13131313' 프로젝트가 시작되었어요.</a> </td>
				<td>관리자</td>
				<td>2023-03-20</td>
				<td>23</td>
			</tr>
		
			<tr>
				<td>3</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#해당스토리로">[오픈예정 D-7] '모두모두'프로젝트가 곧 시작됩니다.</a> </td>
				<td>관리자</td>
				<td>2023-03-15</td>
				<td>23</td>
			</tr>
		
			<tr>
				<td>4</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#해당새소식으로">[프로젝트 종료] '가나다라'프로젝트가 종료되었어요</a></td>
				<td>관리자</td>
				<td>2023-03-02</td>
				<td>100</td>
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