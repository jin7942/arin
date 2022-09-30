<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<!-- header -->
<%@include file="../../common/user/includeV1/header.jsp"%>
<!-- End of header -->

<main id="main">
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
								<!-- id-validation-feedback -->
								<div style="text-align: left; display: none; color: red" id="idFeedback">4 ~ 12자 영문, 숫자만 가능합니다.</div>

								<!-- id-duplicate-feedback -->
								<div style="text-align: left; display: none; color: red" id="idDuplicateFalse">이미 존재하는 아이디 입니다.</div>
								<div style="text-align: left; display: none; color: green" id="idDuplicateOk">사용가능한 아이디 입니다.</div>
							</div>

							<!-- pw -->
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="pw" placeholder="Password" name="memberPW" />
								<label for="pw">Password</label>
								<!-- pw-validation-feedback -->
								<div style="text-align: left; display: none; color: red" id="pwFeedback">4 ~ 12자 영문, 숫자만 가능합니다.</div>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="chkPw" placeholder="Confirm Password" />
								<label for="chkPw">Confirm Password</label>
								<!-- confirmPW-validation-feedback -->
								<div style="text-align: left; display: none; color: red" id="chkPwFeedback">비밀번호가 일치 하지 않습니다.</div>
							</div>

							<!-- email -->
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="email" placeholder="name@example.com" />
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
							</div>

							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="zonecode" placeholder="name@example.com" disabled="disabled" />
								<label for="zonecode">우편번호</label>

								<div style="text-align: left; display: none; color: red" id="zonecodeFeedback">필수 입력 항목입니다.</div>
							</div>

							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="address" placeholder="name@example.com" name="memberPlace" disabled="disabled" />
								<label for="address">주소</label>

								<div style="text-align: left; display: none; color: red" id="addressFeedback">필수 입력 항목입니다.</div>
							</div>

							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="detailAddress" placeholder="name@example.com" />
								<label for="detailAddress">상세주소</label>
							</div>

							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="bname" placeholder="name@example.com" disabled="disabled" />
								<label for="banme">참고항목</label>
							</div>

							<!-- test -->
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="test1" placeholder="name@example.com" />
								<label for="banme">위도</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="test2" placeholder="name@example.com" />
								<label for="banme">경도</label>
							</div>

							<div class="text-center">
								<a class="btn btn-dark btn-lg btn-block" id="signUpBtn" onclick="onSubmit()"> 수정 </a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Sign Up -->
</main>
<!-- End #main -->

<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->
</body>
</html>
