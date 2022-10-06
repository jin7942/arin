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
	<div class="container" style="margin-top: 10%; margin-bottom: 20%; width: 85%" data-aos="fade-up">
		<div class="row" style="text-align: center">
			<div class="col">
				<form action="/user/updt" class="form" id="form">
					<table class="table table-borderless">
						<!-- table-caption -->
						<caption class="h2" style="caption-side: top; text-align: center">나의 정보</caption>

						<tr>
							<td rowspan="4">
								<img src="/resources/template_imperial/assets/img/sample.jpg" class="img-thumbnail" alt="..." />
							</td>
							<td>이름</td>
							<td>
								<input type="text" class="form-control" name="memberName" value="<c:out value="${item.memberName}" />" />
							</td>
						</tr>
						<tr>
							<td>EMAIL</td>
							<td>
								<input type="text" class="form-control" name="memberMailName" value="<c:out value="${item.memberMailName}" />" />
								<input type="hidden" class="form-control" name="memberMailDomain" value="<c:out value="${item.memberMailDomain}" />" />
							</td>
						</tr>
						<tr>
							<td>MOBILE</td>
							<td>
								<input type="text" class="form-control" name="memberMobile" value="<c:out value="${item.memberMobile}" />" />
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td>
								<a href="" style="color: black">프로필 사진 변경</a>
							</td>
							<td>주소</td>
							<td>
								<input type="text" class="form-control" name="memberPlace" value="<c:out value="${item.memberPlace}" />" />
							</td>
						</tr>
					</table>
				</form>
				
				<button class="btn btn-dark" onClick="onSubmit()">수정</button>
				
			</div>
		</div>
	</div>
</main>
<!-- End #main -->

<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->

<script>
	function onSubmit() {
		document.getElementById("form").submit();
	}
</script>
</body>
</html>
