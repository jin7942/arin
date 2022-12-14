<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page session="true" %>
<% pageContext.setAttribute("br", "\n"); %>

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
					alert("????????????");
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
					<li><a class="nav-link scrollto" href="/user/info"><b><c:out value="${sessName }"/></b>???</a></li>
					<li><a class="nav-link scrollto" href="/user/cart"> ???????????? 
					<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cartCount">
						<!-- count -->
					<span class="visually-hidden">unread messages</span>
						</span>
					</a></li>
					<li><a class="nav-link scrollto" href="#"><i class="fa-solid fa-location-dot fa-lg"></i><c:out value="${sessPlace}" /></a></li>
					<li><a class="nav-link scrollto" onclick="logout()">????????????</a></li>
					<li><a class="nav-link scrollto" href="/code/index">??????????????????</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->