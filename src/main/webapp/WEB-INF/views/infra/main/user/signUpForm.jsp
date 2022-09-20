<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>My</title>

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
	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="/index/" class="logo mr-auto"><img src="/resources/template_imperial/assets/img/logo.png" alt="" /></a>
			<!-- Uncomment below if you prefer to use a text logo -->
			<!-- <h1 class="logo mr-auto"><a href="index.html">Imperial</a></h1> -->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="/index/">Home</a></li>
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
		<section id="signUp">
			<div class="container" data-aos="fade-up">
				<div class="row" style="margin-top: 5%">
					<div class="col-md-12">
						<h3 class="section-title">SignUp</h3>
						<div class="section-title-divider"></div>
					</div>
				</div>
			</div>
			<div class="container about-container" data-aos="fade-up" data-aos-delay="200">
				<div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5" style="margin-bottom: 5%">
						<div class="card shadow-2-strong" style="border-radius: 1rem">
							<div class="card-body p-5">
								<!-- signUpForm -->
								<form action="/main/userInst" id="loginForm" method="get">
									<!-- name -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="name" placeholder="name@example.com" name="memberName" />
										<label for="name">이름</label>
										<!-- name-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="nameFeedback">2 ~ 12자 한글, 숫자, 영어만 가능합니다.</div>
									</div>

									<!-- id -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="id" placeholder="ID" name="memberID" />
										<label for="id">ID</label>
										<!-- name-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="idFeedback">4 ~ 12자 영문, 숫자만 가능합니다.</div>
									</div>

									<!-- pw -->
									<div class="form-floating mb-3">
										<input type="password" class="form-control" id="pw" placeholder="Password" name="memberPW" />
										<label for="pw">Password</label>
										<!-- name-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="pwFeedback">4 ~ 12자 영문, 숫자만 가능합니다.</div>
									</div>
									<div class="form-floating mb-3">
										<input type="password" class="form-control" id="chkPw" placeholder="Confirm Password"/>
										<label for="chkPw">Confirm Password</label>
										<!-- confirmPW-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="chkPwFeedback">비밀번호가 일치 하지 않습니다.</div>
									</div>

									<!-- email -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="email" placeholder="name@example.com"  />
										<label for="email">EMAIL</label>
										<!-- name-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="emailFeedback">올바른 이메일 형식이 아닙니다.</div>
									</div>

									<!-- mobile -->
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="mobile" placeholder="name@example.com" oninput="handleOnInput(this, 11)" name="memberMobile" />
										<label for="mobile" style="text-align: left">Mobile</label>
										<label for="mobile" style="text-align: right">'-' 제외 숫자만 입력</label>

										<div style="text-align: left; display: none; color: red" id="mobileFeedback">필수 입력 항목입니다.</div>
									</div>

									<!-- dob -->
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="dob" placeholder="name@example.com" oninput="handleOnInput(this, 6)" />
										<label for="dob">생년월일 6자리</label>
									</div>

									<!-- address -->
									<div class="form-floating mb-3">
										<input type="button" class="btn btn-form-control" value="주소찾기" style="width: 30%; background-color: black; color: white" onclick="searchAddress()" />
										<!-- <a class="btn btn-dark btn-form-control" style="float: right" onclick="searchAddress()">주소 찾기</a> -->
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="zonecode" placeholder="name@example.com" />
										<label for="zonecode">우편번호</label>

										<div style="text-align: left; display: none; color: red" id="zonecodeFeedback">필수 입력 항목입니다.</div>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="address" placeholder="name@example.com" name="memberPlace" />
										<label for="address">주소</label>

										<div style="text-align: left; display: none; color: red" id="addressFeedback">필수 입력 항목입니다.</div>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="detailAddress" placeholder="name@example.com" />
										<label for="detailAddress">상세주소</label>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="bname" placeholder="name@example.com" />
										<label for="banme">참고항목</label>
									</div>

									<!-- checkbox -->
									<div class="form-check d-flex justify-content-start mb-4">
										<input class="form-check-input" type="checkbox" value="" id="chkbox" />
										<label class="form-check-label" for="form1Example3"> 개인정보 이용 동의 </label>
										<div style="text-align: left; display: none; color: red" id="chkBoxFeedback">필수 입력 항목입니다.</div>
									</div>

									<div class="text-center">
										<a class="btn btn-dark btn-lg btn-block" id="signUpBtn" onclick="onSubmit()"> Sign Up </a>
									</div>
								</form>
								<hr class="my-4" />

								<div class="col-md-12">
									<button class="btn btn-lg btn-block" style="width: 100%; background-color: #f7e600; margin-top: 10px">Kakao</button>
									<button class="btn btn-lg btn-block" style="width: 100%; background-color: #eb4435; margin-top: 10px">Google</button>
									<button class="btn btn-lg btn-block" style="width: 100%; background-color: #1ec800; margin-top: 10px; color: white">Naver</button>
									<button class="btn btn-lg btn-block" style="width: 100%; background-color: #3b5998; margin-top: 10px; color: white">Facebook</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Sign Up -->
	</main>
	<!-- End #main -->

	<!-- My Js File -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/form/signUpForm.js"></script>
	<!-- My Js File -->

	<!-- footer -->
	<%@include file="../../common/user/includeV1/footer.jsp"%>
	<!-- End of footer -->
</body>
</html>
