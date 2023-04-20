<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nanum 🌷 : goods_BASKET_ORDER(SALE)</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
<link href="resources/css/paging.css?after" type="text/css" rel="stylesheet">
<style type="text/css">
.order_title{
	text-align: center;
    font-family: 'NanumSquareNeoBold';
    font-size: 35px;
    margin-left: 0;
    display: flex;
    justify-content: center;
    margin-top: 80px;
}

table{
	width:1000px;
	padding:50px;
	border-spacing: 0; /* td간 간격 없애기*/
}
td {
	padding-left: 30px;
    padding-top: 30px;
    padding-bottom: 30px;
    border-bottom: 2px solid #005793;
    line-height: 50px; /* 행간 간격*/
}

.thumbnail { /*img로 하면 다른 아이콘들도 같이 먹혀서 class 주었음*/
	width: 150px;
	height: 150px;
}

.order_wrap {
	max-width: 1000px;
    margin: 50px auto 100px auto;
    position: relative;
    text-align: left;
    border: 1px solid rgb(0,87,147);
	border-radius: 40px;
	font-family: 'NanumSquareNeoBold';
	font-size: 15px;
 
}

.empty_basket {
	font-family: 'NanumSquareNeoBold';
    font-size: 45px;
    text-align: left;
    padding-left: 45px;
    padding-bottom: 30px;
    padding-top: 30px;
}

article {
	display: inline-block;
	width: 1000px;
}


div .address_info {
	float: left;
    margin: 30px 0px 50px 80px;
    border-right: 2px solid #005793;
    padding-right: 100px;
}
div .payment_wrap {
	margin-top: 300px;
}

/*여기부터 배송지 관련*/
.order_address{
	text-align: left;
    font-family: 'NanumSquareNeoBold';
    font-size: 30px;
    margin-left: 50px;
    margin-top: 80px;
}

.address_info {
    text-align: left;
    font-family: 'NanumSquareNeoBold';
    font-size: 20px;
    margin-left: 50px;
    margin-top: 80px;
    display: flex;
    align-content: space-around;
    flex-direction: column;
}

input.input_box {
    
    width: 300px;
    height: 30px;
    margin-left: 15px;
    border-radius: 5px;
    padding-left: 10px;
    font-size: 16px;
}

/*결제관련 오른쪽 부분*/

.payment_wrap{
 	display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    align-items: center;
}

.payment_wrap p {
    line-height: 45px; /* 행간 간격*/
    text-align: center;
}

.payment_btn{
	border-radius: 5px; /*버튼 모서리 둥글게*/
	width: 140px; 
	height: 50px; 
	color: white; 
	border-color:rgb(253, 95, 0);
	background-color: rgb(253, 95, 0); 
	font-size: 20px; 
	font-family: 'NanumSquareNeoBold'; 
	text-align: center;
}

div .address_info .info .input_box {
	height: 35px;
	width: 400px;
	border-radius: 5px;
}

.post_btn {
   	font-family: 'NanumSquareNeoBold';
    font-size: 17px;
    color: white;
	border: 2px solid rgb(0,87,147);
   	background-color: rgb(0,87,147);
    border-radius: 5px;
    padding: 7px;
    cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous" />
<script type="text/javascript">
	$('.payment_btn').click(function(event){  //버튼을 클릭 했을시 show_pay_Popup 함수 출력 
        show_pay_Popup();
    });

	function show_pay_Popup(){
		/*  		
		// 팝업 열기 전 항목 유효성 검사하기 
		if (f.name.value.trim().length <= 0) {
			alert("수령인을 입력하세요");
			f.subject.focus();
			return;
		}
		if (f.phone.value.trim().length <= 0) {
			alert("전화번호를 입력하세요");
			f.writer.focus();
			return;
		}
		if (f.postcode.value.trim().length <= 0) {
			alert("우편번호를 검색하여 주소를 입력해주세요");
			f.content.focus();
			return;
		}
		if(f.accept.checked == false) {
			alert("주문 내용 확인 및 정보 제공 등의 동의해주세요");
			return;
		}
		 */
		var url= "goods_pay_popup.do";    //팝업창에 출력될 페이지 URL
		var name = "pay_pop";
		
		/*팝업창 가운데 정렬*/
		var popupWidth = 550;
        var popupHeigth = 420;
		var popupX = window.screenLeft + window.outerWidth/2 - (popupWidth / 2);
		var popupY= window.screenTop + window.outerHeight/2 -(popupHeigth / 2);
	    var option="width=" + popupWidth + ",height=" + popupHeigth +
            ",left=" + popupX + ",top=" + popupY + 
            ",location=no,toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no"; //팝업창 옵션(optoin)
	   
	    window.open(url, name, option); //이동할주소, 이름, 팝업옵션
	}	
</script>

<script type="text/javascript">
		
		/*기본배송지 선택시 입력값 넣어주기*/
		$('#default').click(function(event){  
		var nameInfo = document.querySelector("#name").value.trim();
		var telInfo = document.querySelector("#phone").value;
		var postcodeInfo = document.querySelector("#postcode").value;
		var addrInfo = document.querySelector("#address").value;
		var detailaddrInfo = document.querySelector("#detailAddress").value;
		var memoInfo = document.querySelector("#memo").value;
		
		if(default.checked == true) { //체크되었다면
		    document.querySelector("#name").value = nameInfo; //이름을 배송정보에 복사
		    document.querySelector("#phone").value = telInfo;
		    document.querySelector("#postcode").value = postcodeInfo;
		    document.querySelector("#address").value = addrInfo;
		    document.querySelector("#detailAddress").value = detailaddrInfo;
		    document.querySelector("#memo").value = memoInfo;
		}
		else {
			document.querySelector("#name").value = ""; //이름을 배송정보에 복사
	        document.querySelector("#phone").value = "";
	        document.querySelector("#postcode").value = "";
	        document.querySelector("#address").value = "";
	        document.querySelector("#detailAddress").value = "";
	        document.querySelector("#memo").value = "";
			}
		}); 
</script> 
</head>
<body>
<form method="post" name="f">
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	
		<span class="order_title">주문/결제하기</span>
	    <div class="order_wrap">
	
			<article class="goods_wrap">
				<table>
		 			<c:choose>
						<c:when test="${empty goods_basket}">
							<tr><th class="empty_basket" colspan="3" style="text-align: center;">주문하신 상품이 없습니다.</th></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${goods_basket}">
								<tr>
									<td><img class="thumbnail" src="resources/images/system/${goods_main_img}"></td>
									<td width="57%"><span class="subject">[굿즈]${goods_name}</span><br>
										<span class="amount">수량 : &nbsp;&nbsp; 1 </span>
									 </td>
									 <td style="text-align: left;">
									 <p style="font-size:18px; font-weight: bold;" >총 20나누미</p>
								</tr>
				 		 	</c:forEach>
						</c:otherwise>
					</c:choose> 
					  
					  <tfoot>
				</table>
			</article>
			<article>
				<p><span class="order_address">배송지 정보</span></p>
					<div class="address_info">
					<div class="select_addr">
						<p><input type="radio" id="default" name="input_addr" checked 
						style="accent-color: rgb(0,87,147); zoom: 1.2;">기본배송지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="new_addr"  name="input_addr"
							style="accent-color: rgb(0,87,147); zoom: 1.2;">신규입력 </p>
						<pre>
						</pre>
					</div>
						<p class="info">수령인&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_box" type="text" id="name"  placeholder="수령인" style="margin-left:12px;" ></p>
						<p class="info">연락처&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_box" type="tel" id="phone"  placeholder="(-)를 제외한 휴대전화번호를 입력하세요" style="margin-left:12px;"></p>
						<p class="info">배송지&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_box" type="text" id="postcode"  placeholder="우편번호검색" readonly style="width: 200px; margin-left:12px;">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="post_btn" onclick="execDaumPostcode()" value="우편번호검색">
						<p class="info"><input class="input_box" type="text" id="address" style="margin-left: 90px;"></p>
						<p class="info"><input class="input_box" type="text" id="detailAddress" placeholder="상세주소를 입력하세요" style="margin-left: 90px;"></p>
						<p class="info">배송메모&nbsp;&nbsp;&nbsp;<input class="input_box" type="text" id="memo" placeholder="배송 관련 메모, 요청 사항을 입력하세요" style="margin-left: 0px;"></p>
						
						<pre>
						</pre>
						<p style="font-size: 13px;">* 총 결제 포인트에는 <span style="font-style: italic; font-weight: bold; font-size: 15px; margin-left: 0; text-decoration: underline;">기본배송비가 포함</span> 되어있습니다.  (기본 배송비 3000원,  6 나누미)</p>
						<p style="font-size: 13px;">* 도서산간 지역의 경우 추가 배송비가 과금됩니다.</p>
						<p style="font-size: 13px;">&nbsp;(도서산간 배송비 5000원, 10 나누미)</p><br>
						<p style="font-size: 17px;"><input type="checkbox" name="accept" required style="zoom:1.5; vertical-align: sub; accent-color: rgb(0,87,147);">주문 내용 확인 및 정보 제공 등의 동의합니다.</p>
					</div>
					<!-- 우편번호검색하기  -->
					<div id="post_wrap"
                    style="display:none; border: 1px solid; top: 0; width: 500px; height: 300px; top: 300px; margin: 5px 0; position: fixed;">
                    <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                        id="btnFoldWrap"
                        style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
                        onclick="foldDaumPostcode()" alt="접기 버튼">
                	</div> 
                	<!-- 우편번호-주소찾기기능 -->
	          		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 찾기 화면을 넣을 element
						function execDaumPostcode() {
							// 현재 scroll 위치를 저장해놓는다.
							var currentScroll = Math.max(document.body.scrollTop,
									document.documentElement.scrollTop);
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
											 // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
							 
							                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                    extraRoadAddr += data.bname;
							                }
							                // 건물명이 있고, 공동주택일 경우 추가한다.
							                if(data.buildingName !== '' && data.apartment === 'Y'){
							                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                }
							                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                if(extraRoadAddr !== ''){
							                    extraRoadAddr = ' (' + extraRoadAddr + ')';
							                }
							                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							                if(fullRoadAddr !== ''){
							                    fullRoadAddr += extraRoadAddr;
							                }
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
							                document.getElementById('address').value = fullRoadAddr;
							            }
							         }).open();
							     }
						</script>
					<!--우편번호 끝 -->
					
					<!-- 결제하기 div -->
					<div class="payment_wrap">
						<p style="font-size: 25px; font-weight: bold; text-align: right; margin-bottom: -30px">총 결제 포인트</p>
						<p style="font-size: 30px; font-weight: bold; color: rgb(0,87,147); text-align: right;">총 66나누미</p>
						<p><input type="button" class="payment_btn" onclick="payment_btn(this.form)" value="포인트결제"></p>
					</div>
			</article>
		</div>

	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	</form>
</body>
</html>