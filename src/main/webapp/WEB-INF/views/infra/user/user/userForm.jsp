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
				<form action="" class="form">
					<table class="table table-borderless">
						<!-- table-caption -->
						<caption class="h2" style="caption-side: top; text-align: center">나의 정보</caption>
						<caption style="caption-side: top; text-align: right">
							<i class="fa-solid fa-pen fa-xl" style="cursor: pointer"></i>
						</caption>

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
							<td>ID</td>
							<td>
								<c:out value="${item.memberID}" />
							</td>
						</tr>
						<tr>
							<td>EMAIL</td>
							<td>
								<input type="text" class="form-control" name="memberMailName" value="<c:out value="${item.memberMailName}" />" />
								@
								<input type="text" class="form-control" name="memberMailDomain" value="<c:out value="${item.memberMailDomain}" />" />
							</td>
						</tr>
						<tr>
							<td>MOBILE</td>
							<c:set var="numberPhone" value="${item.memberMobile}" />
							<td>
								<c:out value="${fn:substring(numberPhone,0,3)}" />
								-
								<c:out value="${fn:substring(numberPhone,3,7)}" />
								-
								<c:out value="${fn:substring(numberPhone,7,11)}" />
							</td>
						</tr>
						<tr>
							<td>
								<a href="" style="color: black">프로필 사진 변경</a>
							</td>
							<td>주소</td>
							<td>
								<c:out value="${item.memberPlace}" />
							</td>
						</tr>
					</table>
				</form>
				
			</div>
		</div>
	</div>
</main>
<!-- End #main -->

<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->
</body>
</html>
