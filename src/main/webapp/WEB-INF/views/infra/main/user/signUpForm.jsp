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
	<!-- ======= Header ======= -->
	<header id="header" class="d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<a href="/index" class="logo mr-auto"><img src="/resources/template_imperial/assets/img/logo.png" alt="" /></a>
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
								<form name="form" method="post">
									<!-- name -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="name" placeholder="name@example.com" name="memberName" />
										<label for="name">??????</label>
										<!-- name-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="nameFeedback">2 ~ 12??? ??????, ??????, ????????? ???????????????.</div>
									</div>
									<!-- id -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="id" placeholder="ID" name="memberID" value="<c:out value="${item.id}" />" />
										<label for="id">ID</label>
										<!-- id-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="idFeedback">4 ~ 12??? ??????, ????????? ???????????????.</div>
										
										<!-- id-duplicate-feedback -->
										<div style="text-align: left; display: none; color: red" id="idDuplicateFalse">?????? ???????????? ????????? ?????????.</div>
										<div style="text-align: left; display: none; color: green" id="idDuplicateOk">??????????????? ????????? ?????????.</div>
									</div>

									<!-- pw -->
									<div class="form-floating mb-3">
										<input type="password" class="form-control" id="pw" placeholder="Password" name="memberPW" />
										<label for="pw">Password</label>
										<!-- pw-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="pwFeedback">4 ~ 12??? ??????, ????????? ???????????????.</div>
									</div>
									<div class="form-floating mb-3">
										<input type="password" class="form-control" id="chkPw" placeholder="Confirm Password"/>
										<label for="chkPw">Confirm Password</label>
										<!-- confirmPW-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="chkPwFeedback">??????????????? ?????? ?????? ????????????.</div>
									</div>

									<!-- email -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="email" placeholder="name@example.com"  />
										<label for="email">EMAIL</label>
										<!-- name-validation-feedback -->
										<div style="text-align: left; display: none; color: red" id="emailFeedback">????????? ????????? ????????? ????????????.</div>
										
										<input type="hidden" name="memberMailName" id="memberMailName" />
										<input type="hidden" name="memberMailDomain" id="memberMailDomain" />
										
									</div>

									<!-- mobile -->
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="mobile" placeholder="name@example.com" oninput="handleOnInput(this, 11)" name="memberMobile" />
										<label for="mobile" style="text-align: left">Mobile</label>
										<label for="mobile" style="text-align: right">'-' ?????? ????????? ??????</label>

										<div style="text-align: left; display: none; color: red" id="mobileFeedback">?????? ?????? ???????????????.</div>
									</div>

									<!-- dob -->
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="dob" placeholder="name@example.com" oninput="handleOnInput(this, 6)" />
										<label for="dob">???????????? 6??????</label>
									</div>

									<!-- address -->
									<div class="form-floating mb-3">
										<input type="button" class="btn btn-form-control" value="????????????" style="width: 30%; background-color: black; color: white" onclick="searchAddress()" />
										<!-- <a class="btn btn-dark btn-form-control" style="float: right" onclick="searchAddress()">?????? ??????</a> -->
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="zonecode" placeholder="name@example.com" disabled="disabled" />
										<label for="zonecode">????????????</label>

										<div style="text-align: left; display: none; color: red" id="zonecodeFeedback">?????? ?????? ???????????????.</div>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="address" placeholder="name@example.com" disabled="disabled" />
										<label for="address">??????</label>

										<div style="text-align: left; display: none; color: red" id="addressFeedback">?????? ?????? ???????????????.</div>
										
										<input type="hidden" name="memberPlace" id="memberPlace" /> 
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="detailAddress" placeholder="name@example.com" />
										<label for="detailAddress">????????????</label>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="bname" placeholder="name@example.com" disabled="disabled" />
										<label for="banme">????????????</label>
									</div>
									
									<!-- test -->
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="test1" placeholder="name@example.com" />
										<label for="banme">??????</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="test2" placeholder="name@example.com" />
										<label for="banme">??????</label>
									</div>

									<!-- checkbox -->
									<div class="form-check d-flex justify-content-start mb-4">
										<input class="form-check-input" type="checkbox" value="" id="chkbox" />
										<label class="form-check-label" for="form1Example3"> ???????????? ?????? ?????? </label>
										<div style="text-align: left; display: none; color: red" id="chkBoxFeedback">?????? ?????? ???????????????.</div>
									</div>

									<div class="text-center">
										<button type="button" class="btn btn-dark btn-lg btn-block" id="signUpBtn" onclick="onSubmit()"> Sign Up </button>
									</div>
								</form>
								
								<hr class="my-4" />

								<div class="col-md-12">
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
	
	<!-- kakao API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d83d77585dfcb78cea837606843f75b&libraries=services"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	        Kakao.init('1d83d77585dfcb78cea837606843f75b');
	        Kakao.isInitialized();
	    });
	
	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        	redirectUri: 'http://localhost:8080/login/kakao/oauth' 
	        }); // ????????? ???????????????uri ??????
	    }
	</script>
	<!-- footer -->
	<%@include file="../../common/user/includeV1/footer.jsp"%>
	<!-- End of footer -->
</body>
</html>
