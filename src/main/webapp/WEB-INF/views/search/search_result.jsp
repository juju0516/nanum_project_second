<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : search_result</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">

.result_wrap {
    max-width: 1000px;
    margin: 100px auto auto;
    position: relative;
}

.rec_wrap {
	max-width: 1000px;
    margin: 100px auto auto;
    position: relative;
}

.search_field {
	display: flex;
    justify-content: center;
    margin-top: 100px;
}

input.search_keyword {
    width: 800px;
    height: 50px;
    border-radius: 5px;
    font-family: 'NanumBarunGothicLight'; 
    font-size: 20px;
    padding-left: 10px;
}
.search_field img {
    width: 65px;
    vertical-align: -30px;
    margin-left: -66px; /* 검색창 안에 이미지 넣기 위해 간격 조정함.*/
    margin-top: 22px;
    z-index: 1;
    }
span.result {
    font-family: 'NanumSquareNeoBold';
    font-size: 35px;
    display: flex;
    justify-content: flex-start;
    margin-left: 80px;
    margin-top: 100px;
}
a {text-decoration: none;}
table {
    width: 1000px;
	margin: 50px 30px 0px 0px;
	border-spacing: 0;
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
	padding-left:30px;
    border-bottom: 1px solid #d4d4d4;
    margin: 5px;
}
</style>
</head>
<body>
<header>
	<jsp:include page="../header.jsp" />
</header>
<section>
	<div class="result_wrap">
	<!-- 검색필드부분 -->
	<div class="search_field">
		<form method="post">
			<input class="search_keyword" type="text" placeholder="검색어를 입력해주세요">
			<a href="search_result.do"><img src="resources/images/system/search.png"></a>
		</form>
	</div>
	<span class="result">"검색어 ${''}" 검색결과 총 10 "${''}" 건</span>
	
	<!-- 검색결과를 포함하는 내용을 테이블로 출력 -->
	<table>
		<thead>
			<tr>
				<th style="width: 10%">No.</th>
				<th>제목</th>
				<th style="width: 250px">날짜</th>
			</tr>
		</thead>
		<tbody>
			<!-- 지금은 그냥 넣었지만, for문으로 넣어야 함. -->
			<c:choose>
				<c:when test="">
					<tr><th class="empty_basket" colspan="3" style="text-align: center;">검색결과가 존재하지 않습니다.</th></tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>1</td>
						<td style="text-align: left; padding-left: 20px;"><a href="#해당프로젝트로">[프로젝트] '보조지구'(검색어는 진하게) 지원 프로젝트 #1</a></td>
						<td></td>
					</tr>
				</c:otherwise>
			
			</c:choose>
		<!--  
		전체검색이 어렵다면, 서브 메뉴 만들고, 각테이블을 사용하자.
		이부분은 하드코딩이 된 부분 입니다. (반복문 사용시 필요없는 부분)
		
			<tr>
				<td>2</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#해당후기로">[후기] 은영이의'보조지구' 지원 프로젝트 참여 후기</a> </td>
				<td>2022-12-30</td>
			</tr>
		
			<tr>
				<td>3</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#해당스토리로">[스토리] '보조지구' 지원 그 후 이야기</a> </td>
				<td>2023-01-05</td>
			</tr>
		
			<tr>
				<td>4</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#해당새소식으로">[새소식] '보조지구' 지원 프로젝트 결과가 도착했어요!</a> </td>
				<td>2023-02-15</td>
			</tr>
			
			<tr>
				<td>5</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">[새소식] '보조지구' 지원 프로젝트 결과가 도착했어요!</a> </td>
				<td>2023-02-22</td>
			</tr>
			<tr>
				<td>6</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">[새소식] '보조지구' 지원 프로젝트 결과가 도착했어요!</a> </td>
				<td>2023-03-01</td>
			</tr>
			<tr>
				<td>7</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">[새소식] '보조지구' 지원 프로젝트 결과가 도착했어요!</a> </td>
				<td>2023-03-29</td>
			</tr>
		-->
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" style="border: none; text-align: center; padding-top: 80px;">
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

	</div>
</section>


<footer>
	<jsp:include page="../footer.jsp" />
</footer>


</body>
</html>