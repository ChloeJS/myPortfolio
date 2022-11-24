<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SHOP</title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>

<!-- js파일 경로 설정 -->
<script src="<%=util.Property.contextPath%>/js/imagesloaded.pkgd.js"></script>

<!-- 카카오톡 공유하기 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 아임포트 api -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- 초기화 -->
<style>
* {
	margin: 0;
	padding: 0;
	font-family: "Malgun Gothic", sans-serif;
}

a {
	text-decoration: none;
}

img {
	border: 0;
}

li {
	list-style: none;
}

html {
	background: linear-gradient(to right, white, #f7f5f5);
	
}

</style>

<!-- 헤더 -->
<style>
#main-header {
	height: 40px;
	background: #faf7f7;
	position: relative;
}

.header-search-form {
	float: left;
}

.header-menu {
	float: right;
}

.header-title {
	position: absolute;
	width: 200px;
	height: 40px;
	left: 50%;
	margin-left: -100px;
	background: url("/img/logo.png");
	background-size: contain;
	background-repeat: no-repeat;
	text-indent: -9999px;
}
</style>

<!-- 풀다운 -->
<style>
.outer-menu {
	float: left;
	width: 100px;
	height: 20px;
	line-height: 20px;
	padding: 10px 0;
	position: relative;
	text-align: center;
	font-size: 13px;
	font-weight: bold;
	z-index: 9999;
}

.outer-menu:hover {
	background: #e1dfdf;
}

.inner-menu {
	display: none;
	background: #ffffff;
	margin-top: 10px;
	width: 100%;
	border-top: 1px solid #cccaca;
	box-shadow: 0 2px 4px rgba(34, 25, 25, 0.5);
}

.inner-menu a {
	display: block;
	padding: 5px 10px;
	z-index: 5000;
}

.inner-menu a:hover {
	background: #e1dfdf;
}
</style>

<!-- 내비게이션 메뉴 -->
<style>
#main-navigation {
	height: 30px;
	background: #faf7f7;
	border-top: 1px solid #cfcaca;
	box-shadow: 1px 3px 3px rgba(34, 25, 25, 0.4);
}

#main-navigation>ul {
	overflow: hidden;
	text-align: center;
}

#main-navigation>ul>li {
	display: inline;
	padding: 0 5px;
	line-height: 30px;
	font-size: 13px;
	color: #524d4d;
	text-shadow: 0 1px 1px white;
}

#main-navigation>ul>li:hover {
	background: #e1dfdf;
	border-radius: 2px;
}
</style>

<!-- 검색 양식 -->
<style>
.header-search-form {
	height: 26px;
	padding: 7px;
}

.input-search {
	display: block;
	float: left;
	background-color: #ffffff;
	border: 1px solid #cccccc;
	border-radius: 15px 0 0 15px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	width: 120px;
	height: 26px;
	padding: 0 0 0 10px;
	font-size: 12px;
	color: #555555;
}

.input-search:focus {
	border-color: rgba(82, 168, 236, 0.8);
	outline: 0;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}

.input-search-submit {
	display: block;
	float: left;
	width: 50px;
	height: 26px;
	border-radius: 0 15px 15px 0;
	border: 1px solid #cccccc;
	margin-left: -1px;
	vertical-align: top;
	display: inline-block;
}
</style>

<!-- 종이 스타일 -->
<style>
.paper {
	
	margin-top: 10px;
	padding: 15px 15px 0;
	font-size: 11px;
	background: #ffffff;
	box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
}

.paper-content {
	margin: 0 -15px;
	margin-top: 10px;
	padding: 10px 15px;
	background: #f2f0f0;
	overflow: hidden;
}

.paper-description {
	margin: 10px 0;
}

.paper-link {
	display: block;
	float: left;
}

.paper-text {
	float: left;
	width: 150px;
	margin-left: 10px;
}
</style>

<!-- 섹션 -->
<style>
/*미디어 쿼리를 지원하지 않는 웹 브라우저*/
#main-section {
	width: 920px;
	margin: 0 auto;
}
/*세 줄*/
@media ( max-width : 919px) {
	#main-section {
		width: 690px;
	}
}
/*네 줄*/
@media ( min-width : 930px) and (max-width: 1149px) {
	#main-section {
		width: 920px;
	}
}
/*다섯 줄*/
@media ( min-width : 1150px) and (max-width: 1379px) {
	#main-section {
		width: 1150px;
	}
}
/*여섯 줄*/
@media ( min-width : 1380px) {
	#main-section {
		width: 1380px;
	}
}
</style>

<!-- 라이트박스 -->
<style>
#darken-background {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 100%;
	display: none;
	background: rgba(0, 0, 0, 0.9);
	z-index: 10000;
	overflow-y: scroll;
}

#lightbox {
	width: 700px;
	margin: 20px auto;
	padding: 15px;
	border: 1px solid #333333;
	border-radius: 5px;
	background: white;
	box-shadow: 0 5px 5px rgba(34, 25, 25, 0.4);
	text-align: center;
}

.user-information {
	overflow: hidden;
	text-align: left;
}

.user-information-image {
	float: left;
	width: 70px;
}

.user-information-text {
	float: right;
	width: 620px;
}

.lightbox-splitter {
	margin: 10px 0;

}

#buyNow {
	text-align : center;
	font-size : 15px;
	font-family : "맑은 고딕", Lato;
	letter-spacing : 1px;
	float : right; 
	color : #191970; 
	font-weight : bold;
	vertical-align: middle;
	margin-left: 5px;
}

#cart {
	text-align : center;
	font-size : 15px;
	font-family : "맑은 고딕", Lato;
	letter-spacing : 1px;
	color : #696969; 
	vertical-align: middle;
	float: right;
	
}
/* 
.link-icon.kakao { 
	background-image: url(/pp/image/icon-kakao.png); 
	background-repeat: no-repeat; 
}
 */
</style>

<script>
      // 풀다운 메뉴
      $(function () {
        $(".outer-menu").hover(
          function () {
            $(this).find(".inner-menu").css("display", "block");
          },
          function () {
            $(this).find(".inner-menu").css("display", "none");
          }
        );
      });
      // 페이지
      $(function () {
        // 이미지 로드 확인
        $("#main-section").imagesLoaded(function () {
          //jQuery Masonry 플러그인 적용
          var grid = $("#main-section").masonry({
            itemSelector: ".paper",
            columnWidth: 230,
            isAnimated: true,
          });
          setTimeout(function() {
	        	  parent.document.getElementById('portfolio2_ifrm').height=$("#main-section").height()+200;
	        	  	//parent.calcHeight('portfolio2_ifrm')
	      }, 1000);
          
        });
        
      });
      // 라이트 박스
        function showLightBox() {
          // 라이트박스 보이게 합니다.
          $("#darken-background").show();
          $("#darken-background").css("top", $(window).scrollTop());
          // 스크롤을 못하게 합니다.
          $("body").css("overflow", "hidden");
        }
      $(function () {
       /*  function showLightBox() {
          // 라이트박스 보이게 합니다.
          $("#darken-background").show();
          $("#darken-background").css("top", $(window).scrollTop());
          // 스크롤을 못하게 합니다.
          $("body").css("overflow", "hidden");
        } */

        function hideLightBox() {
          // 라이트박스 보이지 않게 합니다.
          $("#darken-background").hide();
          // 스크롤을 하게 합니다.
          $("body").css("overflow", "");
        }

        // 라이트박스 제거 이벤트
        $("#darken-background").click(function () {
          hideLightBox();
        });
        // 클릭 이벤트 연결
       $(".paper").click(function () {
    	   showLightBox();
    	   
      	}); 
        
        // 라이트박스 제거 이벤트 보조
        $("#lightbox").click(function (event) {
          event.stopPropagation();
        });
      });
    </script>

<script>

//삭제
function goDelete(gallery_no) {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "delete.do?gallery_no=" + gallery_no;
	}
}
//수정
function goEdit(gallery_no) {
	if (confirm("수정하시겠습니까?")) {
		location.href = "edit.do?gallery_no=" + gallery_no;
	}
}
//주문및결제 (수정필요)


</script>


<!-- <script>
//카카오톡 공유 api 
Kakao.init('43a2e6d597833c625e1a93c4708fbe82'); // 앱 키
$(function shareKakao() {
Kakao.Share.createDefaultButton({
			container : '#btnKakao',
			objectType : 'feed',
			content : {
				title : '[${result.gallery_title }]',
				description : '클릭 후 이동 시 내용 확인 가능합니다.',
				imageUrl : 'http://localhost:8080/pp/image/icon-kakao.png',
				link : { 
					mobileWebUrl : 'http://localhost:8080/pp/portfolio/gallery/index.do',
					webUrl : 'http://localhost:8080/pp/portfolio/gallery/index.do'
				}
			}
		})
	})

</script> -->

<!-- 아임포트 api 적용 -->
<script>

function goOrder(price, gallery_title){ 
if (confirm("주문결제창으로 이동합니다.")){
	console.log(price);

	var con = true;
	var IMP = window.IMP;      
	IMP.init('imp75427113'); // 발급받은 "가맹점 식별코드"를 사용합니다.                
	IMP.request_pay({            
		pg: 'html5_inicis', // PG사 선택
		pay_method: 'card', // 지불 수단
		merchant_uid: 'merchant_' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
		name: gallery_title,  // 상품명
		amount: price// 가격
		//buyer_email: "${loginInfo.guest_email}",//로그인 세션에 저장되어있는 이메일
		//buyer_name: "${loginInfo.guest_name}",//로그인 세션에 저장되어있는 이름
		//buyer_tel: "${loginInfo.guest_hp}",//로그인 세션에 저장되어있는 전화번호
		//buyer_addr: "${loginInfo.guest_addr1}",//로그인 세션에 저장되어있는 주소
		},function (rsp) { // callback
			console.log(rsp)
					    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
					    $.ajax({ 
					           url: "reserveinsert.do", // 데이터베이스에 등록
					           type : "POST",
					           async : false,
					           data : {
					            imp_uid : rsp.imp_uid,
					        	total_price : 123,
					        	gallery_no :1
					           }
					       }).done(function (data) {
					    	   if(data ==0){ // 0은 중복예약 체크
						          alert("결제 완료");
						          location.href="/hotel/reserve/index.do";
						    	   }
					    	   else{
					    		  alert("이미 예약완료된 객실입니다.\n 결제가 취소됩니다.");
					    		  $.ajax({
								   		url : "/hotel/cancel/cancel.do",
								   		type: "post",
								   		data : {imp_uid : rsp.imp_uid,
								   				guest_no : 1
								   		},
								   		success : function(res){
								   		}
								   	});
					    		   }
					       })
					     } else {
					       alert("결제에 실패하였습니다. 다시 시도해주세요");
					       window.location.reload();
					      con =false;
					  } 
			});
}
}  

</script>


<!-- 갤러리 상세 ajax 구현 시작 -->
<script>
	// 특정 게시물의 내용(파일) 출력
    function send(gallery_no ){
    	$.ajax({
    		url : "/pp/portfolio/gallery/view.do",
    		type :  "GET",
    		data : {
    			gallery_no : gallery_no 
    		},
    		success : function(result){
    			console.log(result.filename_org);
    			console.log(result.gallery_title);
    	
    			
    			var info = '';
    				info += '<div  class="user-information-text">';
    				info += '	<h3> user_name <input type="button" value="삭제" onclick="goDelete('+ result.gallery_no+');" style="float:right;margin-left: 5px;"></a>'
    				info += '   	<input type="button" value="수정" onclick="goEdit('+ result.gallery_no+');" style="float:right;"></a></h3>'; 
    				info += '	<p>  ' + result.gallery_regdate + '</p>';
    				info += '	<br>'
    				info += '	<h1 style="display:inline-block; width:100%; vertical-align:middle;"><b style="display:block;">' + result.gallery_title + '</b><span style="font-size:20px;"> ￦ ' + result.price.toLocaleString('ko-KR') + '원 </span>'; 
    				info += '	<span style="float:right; margin-block:15px">';
    				info += ' 	<input type = "button" id = "buyNow" value ="  BUY NOW  " onclick = "goOrder(\''+ result.price +'\' , \'' + result.gallery_title + '\');">';
    				info += ' 	<input type="button" id="cart" value="  ADD TO CART  " onclick="goCart('+ result.gallery_no+');"> </span></h1>';
    				info += '	<div>';
    				info += '		<hr class="lightbox-splitter"/>';
    				info += '		<div style="width:620px; height:750px; overflow:auto;">';
    				info += '			<p>' + result.gallery_content + '</p>';
    				info += '			<br>'
    				info += '			<p> <img src="/pp/upload/' + result.filename_real + '" target="_blank"> </a><br/>';
    				info += '		</div>';
    				info += '	</div>';
    				info += '</div>'; 
    		 
    			
    				$("#info").html(info)  
    	    		showLightBox(); 
    			}
    	})
    }
    
</script>
<!-- 갤러리 상세 ajax 구현 끝-->

<!-- 11/08 계획: 회원이면 수정, 삭제버튼 안보이고 주문/결제 버튼만 뜬다. -->
<!-- 11/08 계획: 관리자이면 수정, 삭제버튼만 뜬다. -->

</head>
<body>
	<div id="boardWrap" class="bbs" style="margin:30px 0; position:relative; width:100%;">
	<div class="pageTitle" style="border-bottom:1px solid #161f2c; position:relative; overflow:hidden; padding-bottom:8px; margin-bottom:20px; bold">
		<h2><b>SHOP__BeMyMuse</b></h2>
		<h4 style="float:right">갤러리게시판</h4>
	</div>
	<div class="top_search" style="border-box:2px;">
	<fieldset style="border: none; width: 150px; display:block; margin-inline-start:2px; margin-inline-end:2px; padding-block-start:0.35em; padding-inline-start: 0.75em; padding-inline-end: 0.75em;     padding-block-end: 0.625em; min-inline-size: min-content; ">
		<!-- <label>검색 |</label> -->
			<input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="search" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text" style="border: 0; height: 25px; line-height: 25px; margin-right: 3px; width: 100px; background: none; border-bottom: 1px solid #bcbcbc;" />
			<img src="/pp/img/btn.png" alt="search" /><button onclick="SEARCH_BANNER.submitSearchBanner(this); return false;" style="border-bottom: 1px solid #bcbcbc;     position: absolute;">
			
		</button>
	</fieldset>
	</div>
	</div>
	<div class="btnSet">
		<div class="right">
			<a href="write.do" class="btn" style="float:center">작성</a>
		</div>
	</div>
	<!-- 본문 영역 -->
	<section id="main-section">
		<c:forEach items="${lists }" var="list">
			<div class="paper" onclick="send(${list.gallery_no});">
				<div class="paper-holder">
					<a> <img width="190" src="/pp/upload/${list.filename_real}" /></a>
				</div>
				<p class="paper-description" >${list.gallery_title } 
					<span style="float:right" class="price">￦<fmt:formatNumber value="${list.price }" pattern="#,###" />원</span>
				</p>
				<div class="paper-content">
					<a class="paper-link"> <img src="https://placekitten.com/30/30" />
						user_name<!-- ${list.user_name } -->
					</a>
				</div>
			</div>
		</c:forEach>
	</section>
	<!-- 본문 영역 끝 -->


	<!-- 라이트박스 -->
		<div id="darken-background">
			<div id="lightbox">
				<div class="user-information">
					<a class="user-information-image"> 
					<img src="" /> <!-- 유저프로필 사진!! -->
					</a>
					<div id="info">
						
					</div>
				</div>
			</div>
		</div>
</body>
</html>