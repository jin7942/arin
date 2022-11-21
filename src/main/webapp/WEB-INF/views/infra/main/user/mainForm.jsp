<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>My</title>

<!-- J Query -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet" />

<!-- Vendor CSS Files -->
<link href="/resources/template_imperial/assets/vendor/aos/aos.css" rel="stylesheet" />
<link href="/resources/template_imperial/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/template_imperial/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
<link href="/resources/template_imperial/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
<link href="/resources/template_imperial/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

<!-- Template Main CSS File -->
<link href="/resources/template_imperial/assets/css/style.css" rel="stylesheet" />

<!-- fontawesome-icon -->
<script src="https://kit.fontawesome.com/287e3e129e.js" crossorigin="anonymous"></script>

<!-- =======================================================
  * Template Name: Imperial - v5.8.0
  * Template URL: https://bootstrapmade.com/imperial-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script type="text/javascript">
	function logout() {
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			/* ,dataType:"json" */
			,url: "/logoutProc"
			/* ,data : $("#formLogin").serialize() */
			,data : {}
			,success: (res) => {
				if(res.rt == "success") {
					location.href = "/index"
				} else {
					alert("회원없음");
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	}
	
	window.onload = function() {
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/user/itemCartCount"
			,data : {}
			,success: (res) => {
				document.getElementById("cartCount").innerHTML = res.cnt;
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	}
</script>

<style>
.image-preview>li {
	display: inline;
}

.image-preview>li:nth-child(3):after {
	content: '\A';
	white-space: pre;
}

span {
	cursor: pointer;
}

img {
	width: 200px;
	height: 200px;
	margin-left: 20px;
}

input[type=file]::file-selector-button {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}
</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="/main/" class="logo mr-auto"><img src="/resources/template_imperial/assets/img/logo.png" alt="" /></a>
			<!-- Uncomment below if you prefer to use a text logo -->
			<!-- <h1 class="logo mr-auto"><a href="index.html">Imperial</a></h1> -->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="/main/">Home</a></li>
					<li><a class="nav-link scrollto" href="/user/info"><b><c:out value="${sessName }" /></b>님</a></li>
					<li><a class="nav-link scrollto" href="/user/cart"> 장바구니 <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cartCount"> </span>
					</a></li>
					<li><a class="nav-link scrollto" href="#"><i class="fa-solid fa-location-dot fa-lg"></i> <c:out value="${sessPlace}" /></a></li>
					<li><a class="nav-link scrollto" onclick="logout()">로그아웃</a></li>
					<li><a class="nav-link scrollto" href="/code/codeList">관리자페이지</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<form action="" name="form" id="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="uploadData" id="uploadData" value="" />
			<div class="container" style="margin-top: 10%; margin-bottom: 10%; width: 85%" data-aos="fade-up">
				<div class="row ">
					<div class="col"></div>
					<!-- img form -->
					<div class="col-7">
						<h2>상품 등록</h2>

						<!-- img preview area -->
						<ul class="image-preview"></ul>
						<!-- End of img preview area -->

						<input type="file" id="uploadedImage" class="real-upload" accept="image/*" name="uploadedImage" required multiple />
						<button type="button" id="deleteBtn" class="btn btn-danger" onclick="removeAll()">삭제</button>
						<!-- <button type="button" class="btn btn-danger" onclick="test()">테스트</button> -->
					</div>
					<!-- End of img form -->
					<div class="col"></div>
				</div>
				<div class="row" style="margin-top: 20px" margin="0 auto">
					<div class="col"></div>
					<div class="col-7">
						<!-- item reg form -->
						<input type="hidden" name="seq" id="seq" value="<c:out value="${vo.mainKey}"/>" />
						<input type="hidden" name="itemSeq" value="<c:out value="${item.itemSeq}"/>" />

						<div class="mb-3">
							<label for="itemHeader" class="form-label">상품 제목</label>
							<input type="text" class="form-control" id="itemHeader" name="itemHeader" value="<c:out value="${item.itemHeader}"/>" />
						</div>
						<div class="mb-3">
							<label for="itemPrice" class="form-label">가격</label>
							<input type="text" class="form-control text-end" id="itemPrice" name="itemPrice" placeholder="(원)" value="<c:out value="${item.itemPrice}"/>" />
						</div>
						<div class="form-group">
							<label for="itemDescription">상품설명</label>
							<textarea class="form-control" id="itemDescription" name="itemDescription" value="" rows="10"><c:out value="${item.itemDescription}"/></textarea>
						</div>

						<div class="btnGroup" style="margin-top: 20px">
							<button type="button" class="btn btn-dark" onclick="onSubmit()">Submit</button>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</form>
		<!-- End of item reg form -->

	</main>
	<!-- End #main -->

	<!-- footer -->
	<%@include file="../../common/user/includeV1/footer.jsp"%>
	<!-- End of footer -->

	<!-- My Js File -->
	<script type="text/javascript" src="/resources/js/helper/imgUploader.js"></script>


	<script type="text/javascript">

/* 		function onSubmit() {
			$("form[name=form]").submit();
		} */
		
		function onSubmit() {
			const form = $("form[name=form]")
			const data= new FormData(form[0])
			const uploadedImage = $("input[name=uploadedImage]")
			const uploadData = $("input[name=uploadData]")
			const numberRegex = /^[0-9]{4,12}$/;
			
			const goUrlInst = "/main/itemInst";
			const goUrlUpdt = "/main/itemUpdt"
			
			/** validation **/
			if (uploadedImage.val() == '' ||uploadedImage.val() == null) {
				alert('이미지는 최소 한장 이상 반드시 포함되어야 합니다.');
				return false;
				
			} else if ($("input[name=itemHeader]").val() == '' || $("input[name=itemHeader]").val() == null) {
				alert('상품 제목은 반드시 포함되어야 합니다.');
				$("input[name=itemHeader]").focus();
				return false;
				
			} else if ($("input[name=itemPrice]").val() == '' || numberRegex.test($("input[name=itemPrice]").val()) != true) {
				alert('가격은 반드시 숫자로 명시 되어야 합니다. \n 최소 금액은 1000원 부터 가능합니다.');
				return false;
			
			} else if ($("textarea[name=itemDescription]").val() == '' || $("textarea[name=itemDescription]").val() == null) {
				alert('상품 설명을 적어주세요.')
				return false;
			}
			
			 $.ajax({
			   url: "http://arin.jin7942.co.kr:4000/api/uploadImg",
			   type: "POST",
			   data: data,
			   enctype: 'multipart/form-data',
			   processData: false,
			   contentType: false,
			   cache: false,
			   success: (res) => {
					console.log(JSON.stringify(res));
					uploadedImage.val('');
					uploadData.val(JSON.stringify(res));
					
					if ($("input[name=itemSeq]").val() == '' || $("input[name=itemSeq]").val() == null) {
						form.attr("action", goUrlInst).submit();
					} else {
 						form.attr("action", goUrlUpdt).submit();
					}
		   		},
			   error: function () {
			     // Handle upload error
			     // ...
			   }
			 });
		}
		
	</script>
</body>
</html>
