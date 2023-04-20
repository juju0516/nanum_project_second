<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANUM Manager : 프로젝트 수정 </title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/mngr_list.css?after" type="text/css" rel="stylesheet">
<link href="resources/css/mngr_detail.css?after" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
.new-width {
	width:70%; 
}
.btn-len {
	width: 140px;
}
.text-title {
	width: 90%;
	font-family: 'NanumSquareNeoLight';
}
.t-detail {
	text-align: left;
	text-indent: 10px;
	margin-left: 0;
}
.it-gap {
	margin: 0px;
	width: 90%;
}
.td-padding {
	padding-left: 50px;
}
.span-gap {
	padding-left: 30px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#category').val('${vo.prj_category}').prop("selected", true);
		$('#dnt_yn').val('${vo.dnt_flag}').prop("selected", true);
		$('#rglr_yn').val('${vo.regular}').prop("selected", true);
		$('#onetime_yn').val('${vo.onetime}').prop("selected", true);
		$('#vlt_yn').val('${vo.vlt_flag}').prop("selected", true);
	});
	
	function project_update_exec(f) {
		var category = $('#category option:selected').val();
		var dnt = $('#dnt_yn option:selected').val();
		var rglr = $('#rglr_yn option:selected').val();
		var onetime = $('#onetime_yn option:selected').val();
		var vlt = $('#vlt_yn option:selected').val();
		
		f.action ="mngr_prj_update_exec.do?category="+category+"&dnt="+dnt+
				  "&rglr="+rglr+"&onetime="+onetime+"&vlt="+vlt+
				  "&project_idx=${project_idx}&cPage=${cPage}";
		f.submit();
	}

	function project_update_cancel(f) {
		f.action ="mngr_prj_detail.do?project_idx=${project_idx}&cPage=${cPage}";
		f.submit();
	}
	
	function project_list(f) {
		f.action ="mngr_prj_list.do?project_idx=${project_idx}&cPage=${cPage}";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="mngr_header_menu.jsp" />
<section>
<form method="post" encType="multipart/form-data">
	<div class="title"> 프로젝트 수정 </div>
	<div class="only-btn-wrap new-width"></div>
	<div class="admin-loc"><span class="admin-text">관리자 : ${vo.manager_id }</span></div>
	
	<div class="tb-detail-wrap">
	<table class="tb-detail">
		<thead>
			<tr><th><div><span class="text-category">
					<c:choose>
					<c:when test="${vo.prj_category == '내림'}">
						${vo.prj_category }
					</c:when>
					<c:otherwise>
						<select id="category">
							<option value="진행중"> 진행중 </option>
							<option value="새로 시작된"> 새로 시작된 </option>
							<option value="오픈 예정"> 오픈 예정 </option>
							<option value="완료"> 완료 </option>
					</select>
					</c:otherwise>
					</c:choose>
					</span></div></th>
				<th><div class="title-view-wrap">
					<div class="text-title">
						<input class="input-title it-gap" type="text" name="prj_title" value="${vo.prj_title}"></div>
					<div class="text-view">${vo.prj_hit} views</div>
				</div></th>
			</tr>
		</thead>
		<tbody>			
			<tr><td width=13%>ID</td><td class="td-padding"><input class="input-text t-detail" type="text" name="id" value="${vo.id}"></td></tr>
			<tr><td>닉네임</td><td class="td-padding"><input class="input-text t-detail" type="text" name="nickname" value="${vo.nickname}"></td></tr>
			<tr><td>승인 날짜</td><td class="td-padding">${vo.aprv_date }</td></tr>
			<tr><td>시작 날짜</td><td class="td-padding"><input class="input-date" type="date" name="prj_begin_date" value="${vo.prj_begin_date.substring(0,10)}"></td></tr>
			<tr><td>종료 날짜</td><td class="td-padding"><input class="input-date" type="date" name="prj_end_date" value="${vo.prj_end_date.substring(0,10)}"></td></tr>
			<tr><td>후원 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" id="dnt_yn">
						<option value="Y"> Y </option>
						<option value="N"> N </option>
					</select></td>
				<td class="td-padding">현재 ${vo.cur_point + vo.r_cur_point} 나누미 / 
									목표 	<input class="input-text" type="number" name="goal_point" value="${vo.goal_point}"> 나누미</td>
			</tr>
			<tr><td></td>
				<td class="td-padding">정기 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" id="rglr_yn">
						<option value="Y"> Y </option>
						<option value="N"> N </option>
					</select>
					<span class="span-gap"> ${vo.r_cur_point} 나누미 (${vo.r_dnt_count} 회 후원, 후원자 ${vo.r_p_count} 명)</span>
				</td>
			</tr>
			<tr><td></td>
				<td class="td-padding">일시 &nbsp;&nbsp;&nbsp;  
					<select class="select-s" id="onetime_yn">
						<option value="Y"> Y </option>
						<option value="N"> N </option>
					</select><span class="span-gap"> ${vo.cur_point} 나누미 (${vo.dnt_count} 회 후원)</span>
				</td>
			</tr>
			<tr><td>지원 &nbsp;&nbsp;&nbsp; 
					<select class="select-s" id="vlt_yn">
						<option value="Y"> Y </option>
						<option value="N"> N </option>
					</select></td>	 
				<td class="td-padding">현재 ${vo.cur_num_people} 명 /
					 목표 <input class="input-text" type="number" name="goal_num_people" value="${vo.goal_num_people}"> 명</td></tr>
			<tr><td>태그</td><td class="td-padding tag-padding">
					<textarea class="ta" style="width: 90%" rows="3" name="tag"><c:out value="${vo.tag}" />
					</textarea></td></tr>
			<tr><td><b>내  용 </b></td><td></td></tr>
			<tr><td colspan="2"><textarea id="content" rows="10" name="prj_content">
								<c:out value="${vo.prj_content }" /></textarea></td></tr>
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color">
				<td><b>이미지 파일</b></td>
				<td  class="td-padding" style="text-indent: 0">
				<img src="resources/upload/system/attach/${vo.prj_main_img}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.prj_main_img} </span><br>
					<input class="input-file" type="file" name="f_main">
				<br>
				<c:if test="${vo.f_name1 ne null}">	
				<img src="resources/upload/system/attach/${vo.f_name1}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name1} </span><br></c:if>
					<input class="input-file" type="file" name="f_name1">
				<br>
				<c:if test="${vo.f_name2 ne null}">	
				<img src="resources/upload/system/attach/${vo.f_name2}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name2} </span><br></c:if>
					<input class="input-file" type="file" name="f_name2">
				<br>
				<c:if test="${vo.f_name3 ne null}">		
				<img src="resources/upload/system/attach/${vo.f_name3}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name3} </span><br></c:if>
					<input class="input-file" type="file" name="f_name3">
				<br>
				<c:if test="${vo.f_name4 ne null}">	
				<img src="resources/upload/system/attach/${vo.f_name4}" class="img-attached">
					<span style="vertical-align:17px;"> ${vo.f_name4} </span><br></c:if>
					<input class="input-file" type="file" name="f_name4"><br>
				</td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
			
			<tr><td></td></tr>
			<tr class="tr-color"><td></td><td></td></tr>
			<tr class="tr-color"><td><b>프로젝트 결과</b></td><td></td></tr>
			<tr class="tr-color">
				<td colspan="2" class="result-padding">
					<textarea class="ta" rows="5" name="prj_result">
						<c:out value="${vo.prj_result }" /></textarea></td>				
			</tr>
			<tr class="tr-color"><td></td><td></td></tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	<div class="btn-wrap-btm">
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_list(this.form)">목 록</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_update_cancel(this.form)">취 소</button></div>
		<div class="btn-btm-loc"><button class="btn-detail-l" onclick="project_update_exec(this.form)">저 장</button></div>
	</div> 
</form>	
</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"> </script>
	<script src="resources/js/lang/summernote-ko-KR.js"> </script>
	<script type="text/javascript">
		$(function(){
			$("#content").summernote({	
				toolbar: [
					// [groupName, [list of button]]
					['fontname', ['fontname']],
					['fontsize', ['fontsize']],
					['style', ['bold', 'italic', 'underline', /*'strikethrough', 'clear'*/]],
					['color', [/*'forecolor',*/'color']],
					['table', ['table']],
					//['para', ['ul', 'ol', 'paragraph']],
					['height', ['height']],
					['insert',['picture','link'/*,'video'*/]],
					//['view', [/*'fullscreen',*/'help']]
				],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				
				height: 300,
				/*maxHeight:400,
				minHeight:200, */
				lang:"ko-KR",
				/* focus:true, */
				
				callbacks:{
					onImageUpload:function(files, editor) {
						for(var i=0; i < files.length; i++) {
							sendImage(files[i], editor)
						}
					}
				}
			});
			$("#content").summernote("lineHeight", .7);
		});	
		
		function sendImage(file, editor) {
			// 서버로 이미지 파일을 보내기 위해 폼 객체 준비
			var frm = new FormData(); // <form></form>
			
			// 폼에 파라미터 값이 등록 (폼 객체 안에 upload라는 이름으로 파일이 등록된다.)
			frm.append("s_file", file);
			
			// 비동기식 통신
			$.ajax({
				url  :"saveImage.do", // 전달하고자하는 서버 위치
				data : frm,            // 전달하고자하는 파라미터
				type : "post",         // 전송 방식
				contentType: false,
				processData: false,
				cache: false,
				dataType: "json"
			}).done(function(data) {
				var path = data.path;    // 이미지가 저장된 경로
				var fname = data.fname; // 파일명
				// 이미지가 서버의 upload 폴더에 저장 성공시
				// 이미지 경로가 data에 저장되어 넘어온다.
				// 이것을 에디터에 넣어주면 된다.
				$("#content").summernote("editor.insertImage", path+"/"+fname);
			});
		}
	</script>
</body>
</html>