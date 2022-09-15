<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">

<!-- topbar s -->
<%@include file="../../common/xdmin/includeV1/topbar.jsp"%>
<!-- topbar e -->

<!-- Content Wrapper -->

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">코드그룹 관리</h1>

	<div class="row">
		<div class="col-lg-12">
			<!-- Search-area -->
			<div class="card shadow mb-4">
				<div class="card-body">
					<!-- Search Form -->
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" method="GET" action="/codegroup/codeGroupList">
						<select id="shOptionDelNY" name="shOptionDelNY" class="select btn btn-secondary dropdown-toggle">
							<option value="0" selected <c:if test="${empty vo.shOptionDelNY}"  >selected</c:if>>삭제여부</option>
							<option value="0" <c:if test="${vo.shOptionDelNY eq 0}"  >selected</c:if>>N</option>
							<option value="1" <c:if test="${vo.shOptionDelNY eq 1}"  >selected</c:if>>Y</option>
						</select> <select id="shOptionSort" name="shOptionSort" class="select btn btn-secondary dropdown-toggle">
							<option value="1" selected <c:if test="${empty vo.shOptionSort}"  >selected</c:if>>정렬구분</option>
							<option value="1" <c:if test="${vo.shOptionSort eq 1}"  >selected</c:if>>시퀀스</option>
							<option value="2" <c:if test="${vo.shOptionSort eq 2}"  >selected</c:if>>등록일</option>
							<option value="3" <c:if test="${vo.shOptionSort eq 3}"  >selected</c:if>>수정일</option>
						</select> <select id="shOptionDate" name="shOptionDate" class="select btn btn-secondary dropdown-toggle">
							<option value="" disabled selected <c:if test="${vo.shOptionDate eq null}"  >selected</c:if>>검색구분</option>
							<option value="1" <c:if test="${vo.shOptionDate eq 1}"  >selected</c:if>>등록일</option>
							<option value="2" <c:if test="${vo.shOptionDate eq 2}"  >selected</c:if>>수정일</option>
						</select> <input id="shStartDate" name="shStartDate" type="date" value="<c:out value="${vo.shStartDate}"/>" class="form-control bg-light border-0 small" placeholder="시작일" aria-label="Search" aria-describedby="basic-addon2" /> <input id="shEndDate" name="shEndDate" type="date" value="<c:out value="${vo.shEndDate}"/>" class="form-control bg-light border-0 small" placeholder="종료일" aria-label="Search" aria-describedby="basic-addon2" />

						<!-- rows -->
						<select id="shOptionRows" name="shOptionRows" class="select btn btn-secondary dropdown-toggle">
							<option value="">10</option>
							<option value="2" <c:if test="${vo.shOptionRows eq 2}"  >selected</c:if>>20</option>
							<option value="3" <c:if test="${vo.shOptionRows eq 3}"  >selected</c:if>>30</option>
						</select> <br /> <br />

						<div class="input-group">
							<!-- TODO : 검색 조건 추가 -->
							<select id="shOptionValue" name="shOptionValue" class="select btn btn-secondary dropdown-toggle">
								<option value="" <c:if test="${empty vo.shOptionValue}"  >selected</c:if>>검색구분</option>
								<option value="1" <c:if test="${vo.shOptionValue eq 1}"  >selected</c:if>>이름</option>
							</select> <input id="shValue" name="shValue" value="<c:out value="${vo.shValue}"/>" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
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
					<h6 class="m-0 font-weight-bold text-primary">total : <c:out value="${totalCnt}"></c:out> </h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<!-- table-caption -->
						<caption style="caption-side: top; text-align: right"></caption>
						<!-- table-header -->

						<thead class="table-dark">
							<tr>
								<td><input type="checkbox" name="" id="" /></td>
								<td>#</td>
								<td>seq</td>
								<td>이름(영문)</td>
								<td>이름(한글)</td>
								<td>코드개수</td>
								<td>사용여부</td>
								<td>삭제여부</td>
								<td>등록일</td>
								<td>수정일</td>
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
									<tr onclick="location.href='/codegroup/codeGroupView?ifcgSeq=${list.ifcgSeq}'">
										<td><input type="checkbox" name="" id="" /></td>
										<td>
											<%-- <c:out value="${vo.totalRows +((vo.thispage) * vo.rowNumToShow + status.index) + 1 }"></c:out> --%>
										</td>
										<td><c:out value="${list.ifcgSeq}"></c:out></td>
										<td><c:out value="${list.ifcgNameEng}"></c:out></td>
										<td><c:out value="${list.ifcgNameKor}"></c:out></td>
										<td><c:out value="${list.codeCnt}"></c:out></td>
										<td><c:out value="${list.ifcgUseNY}"></c:out></td>
										<td><c:out value="${list.ifcgDelNY}"></c:out></td>
										<td><c:out value="${list.ifcgRegDatetime}"></c:out></td>
										<td><c:out value="${list.ifcgModDatetime}"></c:out></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<!-- End of Table -->

					<!-- pagination s -->
					<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
					<!-- pagination e -->

					<button type="button" class="btn btn-danger" style="float: left" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<i class="fa-solid fa-trash-can"></i>
					</button>

					<button type="button " class="btn btn-primary" style="float: right" onclick="location.href='/codegroup/codeGroupForm'">
						<i class="fa-solid fa-plus"></i>
					</button>
					<button type="button" class="btn btn-success" style="float: right">
						<i class="fa-solid fa-file-excel"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

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

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
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

<!-- fontawesome-icon -->
<script src="https://kit.fontawesome.com/287e3e129e.js" crossorigin="anonymous"></script>

<!-- temp -->
<script type="text/javascript">
        	function refresh() {
        		location.href="/codegroup/codeGroupList";
			}
        </script>

</body>
</html>