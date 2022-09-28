<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
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

<!-- =======================================================
  * Template Name: Imperial - v5.8.0
  * Template URL: https://bootstrapmade.com/imperial-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div data-aos="fade-in">
				<div class="hero-logo">
					<img class="" src="/resources/template_imperial/assets/img/logo.png" alt="sample" />
				</div>

				<h1>Welcome to my web site</h1>
				<h2>
					We create <span class="typed" data-typed-items="beautiful graphics, functional websites, working mobile apps"></span>
				</h2>
				<div class="actions">
					<a href="#about" class="btn-get-started">Login</a> <a href="/main/signUp" class="btn-services">Sign Up</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="/index/" class="logo mr-auto"><img src="/resources/template_imperial/assets/img/logo.png" alt="" /></a>
			<!-- Uncomment below if you prefer to use a text logo -->
			<!-- <h1 class="logo mr-auto"><a href="index.html">Imperial</a></h1> -->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="/index/#hero">Home</a></li>
					<li><a class="nav-link scrollto" href="/index/#about">Login</a></li>
					<li><a class="nav-link scrollto" href="/main/signUp">SignUp</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<!-- ======= About Section ======= -->
		<section id="about">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-md-12">
						<h3 class="section-title">Login</h3>
						<div class="section-title-divider"></div>
					</div>
				</div>
			</div>
			<div class="container about-container" data-aos="fade-up" data-aos-delay="200">
				<div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						<div class="card shadow-2-strong" style="border-radius: 1rem">
							<div class="card-body p-5">

								<!-- ========== Login Form ========== -->
								<form action="">
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="memberID" placeholder="temp@gmail.com" name="memberID" />
										<label for="floatingInput">ID</label>
									</div>
									<div class="form-floating">
										<input type="password" class="form-control" id="memberPW" placeholder="temp@gmail.com" name="memberPW" />
										<label for="floatingPassword">Password</label>
									</div>

									<div class="form-check d-flex justify-content-start mb-4">
										<input class="form-check-input" type="checkbox" value="" id="" />
										<label class="form-check-label" for="form1Example3"> Remember password </label>
									</div>

									<div class="text-center">
										<button class="btn btn-dark btn-lg btn-block" type="button" onclick="login()">Login</button>
									</div>
									<a href="" style="color: black">ID 및 PW 찾기</a>

									<hr class="my-4" />

									<div class="col-md-12">
										<button class="btn btn-lg btn-block" style="width: 100%; background-color: #f7e600; margin-top: 10px">Kakao</button>
										<button class="btn btn-lg btn-block" style="width: 100%; background-color: #eb4435; margin-top: 10px">Google</button>
										<button class="btn btn-lg btn-block" style="width: 100%; background-color: #1ec800; margin-top: 10px; color: white">Naver</button>
										<button class="btn btn-lg btn-block" style="width: 100%; background-color: #3b5998; margin-top: 10px; color: white">Facebook</button>
									</div>
								</form>
								<!-- ========== End Login Form ========== -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<script type="text/javascript">
		function login() {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/loginProc"
				/* ,data : $("#formLogin").serialize() */
				,data : {"memberID" : $("#memberID").val(), "memberPW" : $("#memberPW").val()}
				,success: (res) => {
					if(res.rt == "success") {
						location.href = "/main/"
					} else {
						alert("회원없음");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
	</script>

	<!-- footer -->
	<%@include file="./infra/common/user/includeV1/footer.jsp"%>
	<!-- End of footer -->
</body>
</html>
