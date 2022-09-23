<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<!-- header -->
<%@include file="../../common/user/includeV1/header.jsp"%>
<!-- End of header -->

<main id="main">
	<div class="container" style="margin-top: 10%; margin-bottom: 10%; width: 85%" data-aos="fade-up">
		<div class="row">
			<div class="col"></div>
			<!-- img form -->
			<div class="col-7">
				<h2>상품 등록</h2>
				<form action="">
					<ul class="list-inline image-preview"></ul>
					<ul class="list-inline image-preview2"></ul>
					<input type="file" id="imgInput" class="real-upload" accept="image/*" required multiple />
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
				<form action="/main/itemInst">
					<div class="mb-3">
						<label for="itemHeader" class="form-label">상품 제목</label> 
						<input type="email" class="form-control" id="itemHeader" name="itemHeader" aria-describedby="emailHelp" value="" />
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
						<button type="submit" class="btn btn-dark">Submit</button>
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
</body>
</html>
