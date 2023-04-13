<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : story top</title>
<style type="text/css">
#wrap {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

ul.story_menu {
	display: flex;
	flex-direction: row;
	padding-inline-start: 0;
	list-style-type: none;
	font-size: 19px;
	font-family: 'NanumSquareNeoBold'; 
}

ul.story_menu a {
	margin: 0px 20px 0px 20px;
	padding-top: 20px;
	background-color: white;
	color: black;
	text-decoration: none;
	border-right: 3px solid white;
}
	
ul.story_menu a:hover{
	color: black;
	font-weight: bold;
	font-size: 20px;
	border-bottom: 2px solid black;
}

</style>
</head>
<body>
	<div id="wrap">	
		<ul class="story_menu">
			<li class="introduce"><a href="story_introduce.do">소개</a></li>
			<li class="story"><a href="story_list.do">스토리</a></li>
			<li class="notice"><a href="story_notice.do">공지사항</a></li>
			<li class="news"><a href="story_news.do">새소식</a></li>
		</ul>
	</div>
</body>
</html>