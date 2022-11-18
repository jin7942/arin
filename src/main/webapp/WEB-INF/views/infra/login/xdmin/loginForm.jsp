<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<jsp:useBean id="CodeServiceImpl" class="com.jinfw.infra.modules.code.CodeServiceImpl" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin Login</title>

<!-- J Query -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Custom fonts for this template-->
<link href="/resources/template_admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

<!-- Custom styles for this template-->
<link href="/resources/template_admin/css/sb-admin-2.min.css" rel="stylesheet" />

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">관리자 로그인</h1>
									</div>

									<!-- login form -->
									<form class="user" name="form">
										<div class="form-group">
											<input type="email" class="form-control form-control-user" id="memberID" aria-describedby="emailHelp" placeholder="ID" name="memberID" value="guest">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" id="memberPW" placeholder="Password" name="memberPW" value="1234">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small"></div>
										</div>
										<hr>
										<button type="button" id="btnLogin" class="btn btn-primary btn-user btn-block">Login</button>


									</form>
									<!-- End of login form -->


								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/template_admin/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/template_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/template_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/template_admin/js/sb-admin-2.min.js"></script>

	<script type="text/javascript">
		
		$("#btnLogin").on("click", function(){
			
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "loginProc"
				/* ,data : $("#formLogin").serialize() */
				,data : { "memberID" : $("#memberID").val(), "memberPW" : $("#memberPW").val()}
				,success: (res) => {
					if(res.rt == "success") {
						location.href = "/code/index"
					} else {
						alert("회원없음");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});
	
	</script>

</body>

</html>