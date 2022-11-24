<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<!-- topbar s -->
<%@include file="../../common/xdmin/includeV1/topbar.jsp"%>
<!-- topbar e -->

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Content Row -->
	<div class="row">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">가입자 수</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<c:out value="${item.memberCnt }" /> 명
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">판매완료</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<c:out value="${item.itemCnt }" />
								개
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">판매중</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<c:out value="${item.itemCntSaleTrue }" />
								개
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">일 방문자 수</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<c:out value="${item.visitCnt }" /> 명
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Content Row -->

	<div class="row">
		<!-- Content Column -->
		<div class="col-lg-6 mb-4">
			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">최근 등록 아이템</h6>
				</div>
				<div class="card-body">
					<c:choose>
						<c:when test="${fn:length(itemList) eq 0 }">
							<h4>No Data..</h4>
						</c:when>
						<c:otherwise>
							<c:forEach items="${itemList}" var="itemList" varStatus="status">
								<h4 class="small font-weight-bold">
									<c:out value="${itemList.itemHeader}" />
									<span style="float: right"><c:out value="${itemList.itemRegDatetime}" /></span>
								</h4>
								<hr />
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- Color System -->
			<div class="row">
				<div class="col-lg-6 mb-4">
					<div class="card bg-primary text-white shadow">
						<div class="card-body">
							Primary
							<div class="text-white-50 small">#4e73df</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-success text-white shadow">
						<div class="card-body">
							Success
							<div class="text-white-50 small">#1cc88a</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-info text-white shadow">
						<div class="card-body">
							Info
							<div class="text-white-50 small">#36b9cc</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-warning text-white shadow">
						<div class="card-body">
							Warning
							<div class="text-white-50 small">#f6c23e</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-danger text-white shadow">
						<div class="card-body">
							Danger
							<div class="text-white-50 small">#e74a3b</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-secondary text-white shadow">
						<div class="card-body">
							Secondary
							<div class="text-white-50 small">#858796</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-light text-black shadow">
						<div class="card-body">
							Light
							<div class="text-black-50 small">#f8f9fc</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-dark text-white shadow">
						<div class="card-body">
							Dark
							<div class="text-white-50 small">#5a5c69</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-6 mb-4">
			<!-- Illustrations -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">금일 방문자</h6>
				</div>
				<form id="form" name="form">
				<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>" />
					<div class="card-body">
						<!-- List Data -->
						<div id="lita"></div>
						<!-- End Of List Data -->
					</div>
				</form>
			</div>


		</div>
	</div>
</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
</a>

<!-- logout modal -->
<%@include file="../../common/xdmin/includeV1/logoutModal.jsp"%>
<!-- End of logout modal -->

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

<script>
	$(document).ready(function() {
		setLita();
	});

	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		setLita();
	}

	function setLita() {
		$.ajax({
			async : true,
			cache : false,
			type : "post"
			/* ,dataType:"json" */
			,
			url : "/code/indexAjaxLita",
			data : $("#form").serialize()
			/* ,data : {  } */
			,
			success : function(response) {
				$("#lita").empty();
				$("#lita").append(response);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("ajaxUpdate " + jqXHR.textStatus + " : "
						+ jqXHR.errorThrown);
			}
		});
	}
</script>

<!-- Bootstrap core JavaScript-->
<script src="/resources/template_admin/vendor/jquery/jquery.min.js"></script>
<script src="/resources/template_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/template_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/template_admin/js/sb-admin-2.min.js"></script>

<!-- fontawesome-icon -->
<script src="https://kit.fontawesome.com/287e3e129e.js" crossorigin="anonymous"></script>

<!-- Page level plugins -->
<script src="/resources/template_admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/template_admin/js/demo/chart-area-demo.js"></script>
<script src="/resources/template_admin/js/demo/chart-pie-demo.js"></script>

<!-- My Js File -->
<script src="/resources/js/validation/validationInst.js"></script>
</body>
</html>