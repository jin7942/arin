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

<style>
li {
	list-style: none;
}

img {
	width: 200px;
	height: 200px;
}

.upload {
	width: 200px;
	height: 200px;
}

.image-preview {
	width: 1300px;
	height: 200px;
	display: flex;
	gap: 20px;
}

.image-preview2 {
	width: 1300px;
	height: 200px;
	display: flex;
	gap: 20px;
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
					<li><a class="nav-link scrollto" href="/user/info"><b>김진범</b>님</a></li>
					<li><a class="nav-link scrollto" href=""> 장바구니 <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"> 0 <span class="visually-hidden">unread messages</span>
						</span>
					</a></li>
					<li><a class="nav-link scrollto" href="#"><i class="fa-solid fa-location-dot fa-lg"></i>수원시 팔달구 인계동</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<div class="container" style="margin-top: 10%; margin-bottom: 10%; width: 85%" data-aos="fade-up">
			<div class="row">
				<div class="col"></div>
				<!-- img form -->
				<div class="col-7">
					<h2>상품 등록</h2>
					<form action="" name="imgForm" id="imgForm">
						<ul class="list-inline image-preview"></ul>
						<ul class="list-inline image-preview2"></ul>
						<input type="file" id="imgInput" class="real-upload" accept="image/*" name="imgInput" required multiple />
						<button type="button" id="deleteBtn" class="btn btn-danger" onclick="deleteList()">삭제</button>
					</form>
				</div>
				<!-- End of img form -->
				<div class="col"></div>
			</div>
			<div class="row" style="margin-top: 20px" margin="0 auto">
				<div class="col"></div>
				<div class="col-7">
					<!-- item reg form -->
					<form action="/main/itemInst" name="itemForm">
						<input type="hidden" name="seq" id="seq" value="<c:out value="${vo.mainKey}"/>"/>
						
						<div class="mb-3">
							<label for="itemHeader" class="form-label">상품 제목</label>
							<input type="text" class="form-control" id="itemHeader" name="itemHeader" value="" />
						</div>
						<div class="mb-3">
							<label for="itemPrice" class="form-label">가격</label>
							<input type="text" class="form-control text-end" id="itemPrice" name="itemPrice" placeholder="(원)" />
						</div>
						<div class="form-group">
							<label for="itemDescription">상품설명</label>
							<textarea class="form-control" id="itemDescription" name="itemDescription" value="" rows="10"> </textarea>
						</div>

						<div class="btnGroup" style="margin-top: 20px">
							<button type="button" class="btn btn-dark" onclick="onSubmit()">Submit</button>
							<button type="button" class="btn btn-dark">임시저장</button>
						</div>
					</form>
					<!-- End of item reg form -->
				</div>
				<div class="col"></div>
			</div>
		</div>

	</main>
	<!-- End #main -->

	<!-- footer -->
	<%@include file="../../common/user/includeV1/footer.jsp"%>
	<!-- End of footer -->

	<!-- My Js File -->
	<script type="text/javascript" src="/resources/js/helper/imgUploader.js"></script>
	
	<script type="text/javascript">
		
		function onSubmit() {
			const goUrlItemInst = "/main/itemInst";
			
			/* itemForm.attr("action", goUrlItemInst).submit(); */
			
			const imgData = $('#imgInput');
			const img = imgData[0].files;
			const formData = new FormData();
			
			for (let i = 0; i < img.length; i++) {
				formData.append("files", img[i]);
			}
			
  			$.ajax({
			   async:false,
			   type:"POST",
			   enctype: "multipart/form-data",
			   url: "/sample/upload",
			   data: formData,
			   contentType: false,
		       processData: false,
			   success: function(res){
				   if (res.rt == "success") {
					   alert("업로드 성공 !");
					   itemForm.attr("action", goUrlItemInst).submit();
				   } else {
						alert(res.rt);
				   }
			   },
			   err: function(err){
			     console.log("err:", err)
			   }
			 });
			 

			
		}
	
	</script>
</body>
</html>
