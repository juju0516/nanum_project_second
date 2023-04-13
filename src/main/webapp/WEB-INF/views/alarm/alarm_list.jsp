<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람있음</title>
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
		
		.alarm_delete{
			cursor: pointer;
			width: 30px;
		}
	</style>
	<script type="text/javascript">
	   /* $('#alarm_delete').click(function(event){  //버튼을 클릭 했을시 show_pay_Popup 함수 출력 
	        console.log('click');
	        alarm_delete_Popup();
	    }); */

	    function alarm_delete(){
	        var url= "alarm_delete.do";    //팝업창에 출력될 페이지 URL
	        var name = "alarm_delete_pop";
	        
	     	// 팝업창 크기
	        var popupWidth = 500;
	        var popupHeigth = 250;

	        // 팝업창 가운데 정렬
	        var popupX = window.screenLeft + window.innerWidth/2 - (popupWidth / 2);
	        var popupY= window.screenTop + window.outerHeight/2 - (popupHeigth / 2);

	        var option="width=" + popupWidth + ",height=" + popupHeigth +
	                   ",left=" + popupX + ",top=" + popupY + 
	                   ",location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
	        
	        window.open(url, name, option); //이동할주소, 이름, 팝업옵션
	    }
	</script>
</head>
<body>
<header>
	<jsp:include page="../main_header.jsp" />
	<jsp:include page="alram_top.jsp" />
</header>
<section>
	<!-- 검색결과를 포함하는 내용을 테이블로 출력 -->
	<table>
		<thead>
			<tr>
				<th style="width: 10%">No.</th>
				<th>제목</th>
				<th style="width: 150px">받은날짜</th>
				<th style="width: 80px">삭제</th>
			</tr>
		</thead>
		<tbody>
			<!-- 지금은 그냥 넣었지만, for문으로 넣어야 함. -->
			<tr>
				<td>1</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>2023-03-24</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" onclick="javascript:alarm_delete();"></td>
			</tr>
		
			<tr>
				<td>2</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a> </td>
				<td>2023-03-20</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" style="width:30px"></td>
			</tr>
		
			<tr>
				<td>3</td>
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a> </td>
				<td>2023-03-15</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" style="width:30px"></td>
			</tr>
		
			<tr>
				<td>4</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다. </a></td>
				<td>2023-03-02</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" style="width:30px"></td>
			</tr>
			<tr>
				<td>5</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>2023-02-07</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" style="width:30px"></td>
			</tr>
			<tr>
				<td>6</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>2023-01-19</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" style="width:30px"></td>
			</tr>
			<tr>
				<td>7</td>
				<!-- 제목 td에만 왼쪽정렬 주었음.  -->
				<td style="text-align: left; padding-left: 20px;"><a href="#">공지글입니다.</a></td>
				<td>2023-01-02</td>
				<td><img class="alarm_delete" src="resources/images/system/trash.png" style="width:30px"></td>
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