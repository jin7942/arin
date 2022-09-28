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

	<form action="" name="form" method="get">
	<input type="hidden" name="mainKey" value="<c:out value="${vo.mainKey}"/>"/>
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">코드 관리</h1>

		<div class="row">
			<div class="col-lg-12">
				<!-- Search-area -->
				<div class="card shadow mb-4">
					<div class="card-body">
						<!-- Search Form -->
						<div class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">

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
								<option value="" disabled selected <c:if test="${vo.shOptionDate}"  >selected</c:if>>검색구분</option>
								<option value="1" <c:if test="${vo.shOptionDate eq 1}"  >selected</c:if>>등록일</option>
								<option value="2" <c:if test="${vo.shOptionDate eq 2}"  >selected</c:if>>수정일</option>
							</select>

							<input id="shStartDate" name="shStartDate" type="date" value="<c:out value="${vo.shStartDate}"/>" class="form-control bg-light border-0 small" placeholder="시작일" aria-label="Search" aria-describedby="basic-addon2" />
							<input id="shEndDate" name="shEndDate" type="date" value="<c:out value="${vo.shEndDate}"/>" class="form-control bg-light border-0 small" placeholder="종료일" aria-label="Search" aria-describedby="basic-addon2" />

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
								</select>
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
						</div>
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
									<td>#</td>
									<td>seq</td>
									<td>이름(영문)</td>
									<td>이름(한글)</td>
									<td>사용여부</td>
									<td>삭제여부</td>
									<td>그룹코드</td>
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
										<tr>
											<td>
												<input type="checkbox" class="chkbox" onclick="event.cancelBubble=true" />
											</td>
											<td></td>
											<td>
												<c:out value="${list.ifccSeq}"></c:out>
											</td>
											<td>
												<a href="javascript:goForm(<c:out value="${list.ifccSeq}"/>)" class="text-decoration-none"> 
													<c:out value="${list.ifccNameEng}"></c:out>
												</a>
											</td>
											<td>
												<c:out value="${list.ifccNameKor}"></c:out>
											</td>
											<td>
												<c:out value="${list.ifccUseNY}"></c:out>
											</td>
											<td>
												<c:out value="${list.ifccDelNY}"></c:out>
											</td>
											<td>
												<c:out value="${list.infrCodeGroup_ifcgSeq}"></c:out>
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
						<button type="button" class="btn btn-danger" style="float: left" onclick="delRow()">
							<i class="fa-solid fa-trash-can"></i>
						</button>

						<button type="button" class="btn btn-primary" style="float: right" onClick="bntGoForm()">
							<i class="fa-solid fa-plus"></i>
						</button>
						<button type="button" class="btn btn-success" style="float: right">
							<i class="fa-solid fa-file-excel"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

<!-- vo.jsp -->
<form action="" name="formVo" id="formVo">
	<%@include file="codeVo.jsp"%>
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
		location.href = "/code/codeList";
	}

	function chkAll() {
		const list = document.querySelectorAll('.chkbox');

		for (let i = 0; i < list.length; i++) {
			list[i].checked = document.getElementById('chkAll').checked ? true
					: false;
		}
	}

	var form = $("form[name=form]");
	var formVo = $("form[name=formVo]");
	var mainKey = $("input:hidden[name=mainKey]");

	var goUrlList = "/code/codeList";
	var goUrlView = "/code/codeView";

	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();

	}

	goForm = function(keyValue) {
		alert(keyValue);
		/* if(keyValue != 0) seq.val(btoa(keyValue)); */
		mainKey.val(keyValue);
		form.attr("action", goUrlView).submit();
	}

	function bntGoForm() {
		formVo.attr("action", goUrlView).submit();
	}
</script>
</body>
</html>