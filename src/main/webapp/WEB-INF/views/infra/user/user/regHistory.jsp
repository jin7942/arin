<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="ko">
<!-- header -->
<%@include file="../../common/user/includeV1/header.jsp"%>
<!-- End of header -->

<!-- ======= Main ======= -->
<main id="main">
	<div class="container" style="margin-top: 10%; margin-bottom: 20%; width: 85%">
		<div class="row" data-aos="fade-up">
			<div class="col-12" style="text-align: center">
				<h2>내가 등록한 상품</h2>
			</div>
		</div>

		<div class="row" data-aos="fade-up" data-aos-delay="200">
			<div class="col">
				<table class="table table-hover">
					<!-- table-caption -->
					<caption style="caption-side: top; text-align: right"></caption>
					<!-- table-header -->

					<thead class="table">
						<tr>
							<td>#</td>
							<td>날짜</td>
							<td>내역</td>
							<td>판매금액</td>
							<td>상태</td>
						</tr>
					</thead>

					<!-- table-body -->
					<c:choose>
						<c:when test="${fn:length(list) eq 0 }">
							<tr>
								<td colspan="5">No Data..</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>#</td>
									<td><c:out value="${list.itemRegDatetime}" /></td>
									<td><c:out value="${list.itemHeader}" /></td>
									<td><c:out value="${list.itemPrice}" /></td>
									
									<c:choose>
										<c:when test="${list.itemSaleNY} eq 1">
											<td>판매중</td>
										</c:when>
										<c:otherwise>
											<td>판매완료</td>
										</c:otherwise>
									</c:choose>
														
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<!-- End of Table -->

			</div>
		</div>
	</div>
</main>
<!-- End #main -->

<br /><br /><br /><br /><br /><br /><br /><br />
<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->

</body>
</html>
