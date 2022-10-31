<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h2>구매내역</h2>

				<!-- Search Form -->
<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" method="GET" action="" id="searchForm" name="searchForm">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}" />">

	<div class="input-group">

		<input id="shStartDate" name="shStartDate" type="date" value="<c:out value="${vo.shStartDate}"/>" class="form-control bg-light border-0 small" placeholder="시작일" aria-label="Search" aria-describedby="basic-addon2" />
		<input id="shEndDate" name="shEndDate" type="date" value="<c:out value="${vo.shEndDate}"/>" class="form-control bg-light border-0 small" placeholder="종료일" aria-label="Search" aria-describedby="basic-addon2" />
		<input id="shValue" name="shValue" value="<c:out value="${vo.shValue}"/>" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />

		<!-- icons -->
		<div class="input-group-append">
			<button class="btn btn-primary" type="submit">
				<i class="fas fa-search fa-sm"></i>
			</button>
			<button class="btn btn-dark" type="button" onclick="refresh()">
				<i class="fa-solid fa-arrow-rotate-right"></i>
			</button>
		</div>
		&nbsp;
		<p style="float: right">
			Total :
			<c:out value="${cnt}" />
		</p>
	</div>
</form>
<!-- End Of Search Form -->

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
							<td>구매금액</td>
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
									<td>
										<c:out value="${list.itemBuyDatetime}" />
									</td>
									<td>
										<c:out value="${list.itemHeader}" />
									</td>
									<td>
										<fmt:formatNumber value="${list.itemPrice}" pattern="#,###,###" />
										원
									</td>
									<td>
										<c:if test="${list.itemSaleNY eq 1}">
											구매
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<!-- End of Table -->

				<!-- pagination s -->
				<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
				<!-- pagination e -->
			</div>
		</div>
	</div>
</main>
<!-- End #main -->

<script>
	function refresh() {
		location.href = '/user/history'
	}
	
	var searchForm = $("form[name=searchForm]");
	var goUrlList = "/user/history";
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		searchForm.attr("action", goUrlList).submit();
	
	}
</script>

<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->

</body>
</html>
