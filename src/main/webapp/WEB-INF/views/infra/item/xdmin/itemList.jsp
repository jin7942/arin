<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">

<!-- topbar s -->
<%@include file="../../common/xdmin/includeV1/topbar.jsp"%>
<!-- topbar e -->

<!-- Content Wrapper -->

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">상품 관리</h1>

	<div class="row">
		<div class="col-lg-12">
			<!-- Search-area -->
			<div class="card shadow mb-4">
				<div class="card-body">

					<!-- Search Form -->
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" method="POST" action="/code/itemList">
						<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
						<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}" />">

						<select id="shOptionDelNY" name="shOptionDelNY" class="select btn btn-secondary dropdown-toggle">
							<option value=""  <c:if test="${empty vo.shOptionDelNY}"  >checked="checked"</c:if>>판매여부</option>
							<option value="0" <c:if test="${vo.shOptionDelNY eq '0'}"  >checked="checked"</c:if>>판매중</option>
							<option value="1" <c:if test="${vo.shOptionDelNY eq '1'}"  >checked="checked"</c:if>>판매완료</option>
						</select>
						<select id="shOptionSort" name="shOptionSort" class="select btn btn-secondary dropdown-toggle">
							<option value="" selected <c:if test="${empty vo.shOptionSort}"  >checked="checked"</c:if>>정렬구분</option>
							<option value="1" <c:if test="${vo.shOptionSort eq '1'}"  >checked="checked"</c:if>>시퀀스</option>
							<option value="2" <c:if test="${vo.shOptionSort eq '2'}"  >checked="checked"</c:if>>등록일</option>
							<option value="3" <c:if test="${vo.shOptionSort eq '3'}"  >checked="checked"</c:if>>수정일</option>
						</select>
						<select id="shOptionDate" name="shOptionDate" class="select btn btn-secondary dropdown-toggle">
							<option value="" disabled selected <c:if test="${vo.shOptionDate eq null}"  >checked="checked"</c:if>>검색구분</option>
							<option value="1" <c:if test="${vo.shOptionDate eq '1'}"  >checked="checked"</c:if>>등록일</option>
							<option value="2" <c:if test="${vo.shOptionDate eq '2'}"  >checked="checked"</c:if>>수정일</option>
						</select>
						<input id="shStartDate" name="shStartDate" type="date" value="<c:out value="${vo.shStartDate}"/>" class="form-control bg-light border-0 small" placeholder="시작일" aria-label="Search" aria-describedby="basic-addon2" />
						<input id="shEndDate" name="shEndDate" type="date" value="<c:out value="${vo.shEndDate}"/>" class="form-control bg-light border-0 small" placeholder="종료일" aria-label="Search" aria-describedby="basic-addon2" />
						<br /> <br />
						<div class="input-group">
							<!-- TODO : 검색 조건 추가 -->
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
						</div>

					</form>
					<!-- End Of Search Form -->
				</div>
			</div>

			<!-- End of Search area -->

			<!-- Table area -->

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">
						total :
						<c:out value="${totalCnt}"></c:out>
					</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover" id="table">
						<!-- table-caption -->
						<caption style="caption-side: top; text-align: right"></caption>
						<!-- table-header -->

						<thead class="table-dark">
							<tr>
								<td>
									<input type="checkbox" id="chkAll" onclick="chkAll()" />
								</td>
								<td></td>
								<td>seq</td>
								<td>상품이름</td>
								<td>가격</td>
								<td>등록일</td>
								<td>수정일</td>
								<td>장소</td>
								<td>삭제여부</td>
								<td>판매여부</td>
								<td>판매자</td>
							</tr>
						</thead>

						<!-- table-body -->
						<c:choose>
							<c:when test="${fn:length(list) eq 0 }">
								<tr>
									<td colspan="10">No Data..</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<tr onclick="goForm(<c:out value="${list.itemSeq}"/>)">
										<td>
											<input type="checkbox" class="chkbox" onclick="event.cancelBubble=true" />
										</td>
										<td></td>
										<td>
											<c:out value="${list.itemSeq}"></c:out>
										</td>
										<td>
											<a href="javascript:goForm(<c:out value="${list.itemSeq}"/>)" class="text-decoration-none"> <c:out value="${list.itemHeader}"></c:out>
											</a>
										</td>
										<td>
											<c:out value="${list.itemPrice}"></c:out>
										</td>
										<td>
											<c:out value="${list.itemRegDatetime}"></c:out>
										</td>
										<td>
											<c:out value="${list.itemModDatetime}"></c:out>
										</td>
										<td>
											<c:out value="${list.itemPlace}"></c:out>
										</td>
										<td>
											<c:out value="${list.itemDelNY}"></c:out>
										</td>
										<td>
											<c:out value="${list.itemSaleNY}"></c:out>
										</td>
										<td>
											<c:out value="${list.seller}"></c:out>
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
	</div>
</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<form action="POST" name="form">
	<input type="hidden" name="thisPage" />
</form>

<!-- vo.jsp -->
<form action="" method="POST"  name="formVo" id="formVo">
	<%@include file="itemVo.jsp"%>
</form>
<!-- vo.jsp -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; Your Website 2020</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->
</div>
<!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
</a>

<!-- logout modal -->
<%@include file="../../common/xdmin/includeV1/logoutModal.jsp"%>
<!-- End of logout modal -->

<!-- Bootstrap core JavaScript-->
<script src="/resources/template_admin/vendor/jquery/jquery.min.js"></script>
<script src="/resources/template_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/template_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/template_admin/js/sb-admin-2.min.js"></script>

<!-- fontawesome-icon -->
<script src="https://kit.fontawesome.com/287e3e129e.js" crossorigin="anonymous"></script>

<!-- temp -->
<script type="text/javascript">
	function refresh() {
		location.href = "/code/itemList";
	}

	const form = $("form[name=form]");
	const formVo = $("form[name=formVo]");

	const goUrlList = "/code/itemList";
	const goUrlView = "/code/itemView";
	const goUrlForm = "/code/itemForm"

	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	const goForm = (keyValue) => {
		$("input[name=mainKey]").val(keyValue);
		formVo.attr("action", goUrlForm).submit();
	}
</script>

</body>
</html>