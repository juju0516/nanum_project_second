<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌼🌺🌷🌸</title> 
<style type="text/css">
	html,body{
		height: 100%;
	
	}
	body {
		color: black;
		display: flex;
	  	flex-direction: column; 
	}
	section{
		flex: 1;
	}
	footer{
		text-align: left;
		text-decoration: none;
	}
	
	div#wrap_img a {
		color: #fff;
	}
	
	div#wrap_img img {
		border: 0;
		text-align: center;
	}
	
	div#wrap_img {
		width: 750px;
		height: 330px;
		text-align: center;
		position: relative;
		border: 1px solid white;
		margin: auto;
		overflow: hidden;
		margin-top: 100px;
	}
	
	ul#Main_imgList {
		/* !important : 속성강제 설정 */
		width: 2052px !important;
		height: 330px;
		list-style: none;
		position: absolute;
		display: inline;
		margin-left: -430px;
	}
	
	li.imgBox {
		width: 250px;
		height: 330px;
		list-style: none;
		border: 1px solid white;
		text-align: center;
		padding-bottom: 10px;
		float: left;
	}
	
	li.imgBox>span>a {
		font: 20px;
		text-decoration: none;
	
	}
	li.imgBox>a {
		display: block;
		width: 250px;
		height: 120px;
		border: 5px solid white;
	}
	
	/* 적용된 float을 해제 하라 뜻   */
	.end{
		float: none;
		clear: both;
	}
	
	div#statistics{
		text-align: center;
		margin: 50px 50px ;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="main_header.jsp" />
	</header>
	<section>
	<div id="wrap_img">
		<ul id="Main_imgList">
			<li class="imgBox">
				<a href="goods_list.do"><img src="resources/images/system/sea.jpg"></a>
				<span><a href="goods_list.do">굿즈페이지이동</a></span>
			</li>
			
			<li class="imgBox">
				<a href="story_list.do"><img src="resources/images/system/sea.jpg"></a>
				<span><a href="story_list.do">스토리이동</a></span>
			</li>
			
			<li class="imgBox">
				<a href="prj_list.do?prj_category=진행중"><img src="resources/images/system/mt.jpg"></a>
				<span><a href="prj_list.do?prj_category=진행중">진행중인프로젝트이동</a></span>
			</li>
			
			<li class="imgBox">
				<a href="sp_donator_list_go.do"><img src="resources/images/system/mt.jpg"></a>
				<span><a href="sp_donator_list_go.do">기념일후원페이지이동</a></span>
			</li>
			
			<li class="imgBox">
				<a href="prj_list.do?prj_category=오픈%20예정"><img src="resources/images/system/sea.jpg"></a>
				<span><a href="prj_list.do?prj_category=오픈%20예정">보조기구신청</a></span>
			</li>
			
			<li class="imgBox">
				<a href="goods_list.do"><img src="resources/images/system/sea.jpg"></a>
				<span><a href="goods_list.do">굿즈페이지이동</a></span>
			</li>
			
			<li class="imgBox">
				<a href="story_list.do"><img src="resources/images/system/sea.jpg"></a>
				<span><a href="story_list.do">스토리이동</a></span>
			</li>
			
			<li class="imgBox">
				<a href="prj_list.do?prj_category=진행중"><img src="resources/images/system/mt.jpg"></a>
				<span><a href="prj_list.do?prj_category=진행중">진행중인프로젝트이동</a></span>
			</li>
		</ul>
	</div>
	</section>
	
	<div id="statistics">
		<h2>총 후원금액: 0000 nanumi(000,000 원)  후원횟수 : 00회     지원자: 00명</h2>
	</div>
	
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	
	<script>
    //자동 스크롤 애니메이션
		var ul = document.querySelector('#Main_imgList')
	    var slideNumber = document.querySelector('#Main_imgList').childElementCount
	    var li = document.querySelector('#imgBox')

	    var firstItemClone = ul.firstElementChild.cloneNode(true);
	    // ul.appendChild(firstItemClone);
	    ul.style.width = ((slideNumber) * 250 + 12) + 'px';

	    function move(){
	      var i = 0;

	      setInterval(function(){
	        ul.style.transition = '0.2s';
	        ul.style.transform = 'translate3d(-'+ 252  * (i+1) + 'px, 0px, 0px)';

	        i++;

	        if (i == (slideNumber - 3)){
	          setTimeout(function(){
	            ul.style.transition = '0s';
	            ul.style.transform = "translate3d(0px, 0px, 0px)";
	          }, 1000)
	          i = 0;
	        }
	      },3000);
	    }

    document.addEventListener("DOMContentLoaded",function(){
      move();
    });
  </script>
</body>
</html>