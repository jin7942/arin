<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<!-- topbar s -->
<%@include file="../../common/xdmin/includeV1/topbar.jsp"%>
<!-- topbar e -->

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">회원 관리</h1>

	<div class="row">
		<div class="col-lg-12">
			<!-- Search-area -->
			<div class="card shadow mb-4">
				<div class="card-body">


					<form method="POST" action="" id="form" name="form">
						<div style="display: flex">
							<div class="col-6">
								<input type="hidden" id="mainKey" name="mainKey" value="<c:out value="${vo.mainKey}"/>" />
								<input type="hidden" name="seq" id="seq" value="<c:out value="${item.seq}"/>" />

								<!-- 이름 -->
								<label for="memberName" class="form-label">
									회원 이름 <b>*</b>
								</label>
								<input type="text" id="memberName" name="memberName" class="form-control" placeholder="이름" value="<c:out value="${item.memberName}"/>" />

								<!-- 삭제 여부 -->
								<label for="memberDelNY" class="form-label">
									삭제여부 <b>*</b>
								</label>

								<select class="form-control" id="memberDelNY" name="memberDelNY">
									<option value="0" <c:if test="${item.memberDelNY eq '0'}"  >checked="checked"</c:if>>N</option>
									<option value="1" <c:if test="${item.memberDelNY eq '1'}"  >checked="checked"</c:if>>Y</option>
								</select>

								<!-- 타입 -->
								<label for="type" class="form-label">
									타입
								</label>
								
								<c:set var="type" value="${item.type}" />
								<c:choose>
									<c:when test="${type eq '3'}">
										<p class="form-control">네이버</p>
									</c:when>
									<c:when test="${type eq '1'}">
										<p class="form-control">카카오</p>
									</c:when>
									<c:otherwise>
										<p class="form-control">일반</p>
									</c:otherwise>
								</c:choose>

								<br />

								<!-- toggle -->
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" role="switch" id="btnRegHistory">
									<label class="form-check-label" for="btnregHistory">등록한 상품 보기</label>
								</div>
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" role="switch" id="btnBuyHistory">
									<label class="form-check-label" for="btnBuyHistory">구매한 상품 보기</label>
								</div>

								<!-- 등록한 상품 -->
								<div id="regHistory" style="display: none">
									<!-- Table -->
									<table class="table table-hover">
										<!-- table-caption -->
										<caption style="caption-side: top; text-align: left">등록 상품</caption>
										<!-- table-header -->

										<!-- table-body -->
										<c:choose>
											<c:when test="${fn:length(regHistory) eq 0 }">
												<tr>
													<td colspan="5">No Data..</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${regHistory}" var="regHistory" varStatus="status">
													<tr onclick="goView(<c:out value="${regHistory.itemSeq}"/>)">
														<td>#</td>
														<td>
															<c:out value="${regHistory.itemRegDatetime}" />
														</td>
														<td>
															<c:out value="${regHistory.itemHeader}" />
														</td>
														<td>
															<fmt:formatNumber value="${regHistory.itemPrice}" pattern="#,###,###" />
															원
														</td>

														<c:set var="itemSaleNY" value="${regHistory.itemSaleNY}" />
														<c:choose>
															<c:when test="${itemSaleNY eq '0'}">
																<td>판매중</td>
															</c:when>
															<c:otherwise>
																<td>판매완료</td>
															</c:otherwise>
														</c:choose>

														<%-- <td><c:out value="${list.itemSaleNY}" /></td> --%>

													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>
									<!-- End of Table -->
								</div>

								<!-- 구매 내역 -->
								<div id="buyHistory" style="display: none">
									<!-- Table -->
									<table class="table table-hover">
										<!-- table-caption -->
										<caption style="caption-side: top; text-align: left">구매 내역</caption>
										<!-- table-header -->

										<!-- table-body -->
										<c:choose>
											<c:when test="${fn:length(buyList) eq 0 }">
												<tr>
													<td colspan="5">No Data..</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${buyList}" var="buyList" varStatus="status">
													<tr onclick="goView(<c:out value="${buyList.itemSeq}"/>)">
														<td>#</td>
														<td>
															<c:out value="${buyList.itemRegDatetime}" />
														</td>
														<td>
															<c:out value="${buyList.itemHeader}" />
														</td>
														<td>
															<fmt:formatNumber value="${buyList.itemPrice}" pattern="#,###,###" />
															원
														</td>

														<c:set var="itemSaleNY" value="${buyList.itemSaleNY}" />
														<c:choose>
															<c:when test="${itemSaleNY eq '0'}">
																<td>판매중</td>
															</c:when>
															<c:otherwise>
																<td>판매완료</td>
															</c:otherwise>
														</c:choose>

														<%-- <td><c:out value="${buyList.itemSaleNY}" /></td> --%>

													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>
									<!-- End of Table -->
								</div>
							</div>

							<div class="col-6">

								<!-- ID -->
								<label for="memberID" class="form-label">
									아이디<b>*</b>
								</label>
								<input type="text" id="memberID" class="form-control" name="memberID" placeholder="ID" value="<c:out value="${item.memberID}"/>" />

								<!-- PW -->
								<label for="memberPW" class="form-label">
									비밀번호 <b>*</b>
								</label>
								<input type="password" id="memberPW" name="memberPW" class="form-control" placeholder="비밀번호" value="<c:out value="${item.memberPW}"/>" readonly />

								<!-- Mobile -->
								<label for="memberMobile" class="form-label">연락처</label>
								<input type="text" id="memberMobile" class="form-control" placeholder="연락처" value="<c:out value="${item.memberMobile}"/>" />

								<!-- Email -->
								<label for="email" class="form-label">
									이메일 <b>*</b>
								</label>
								<input type="text" class="form-control" id="email" placeholder="name@example.com" value="<c:out value="${item.memberMailName}@${item.memberMailDomain}"/>" />

								<input type="hidden" name="memberMailName" id="memberMailName" />
								<input type="hidden" name="memberMailDomain" id="memberMailDomain" />

								<br />

								<p class="form-control">
									등록일 :
									<c:out value="${item.memberSignDatetime}" />
								</p>
								<p class="form-control">
									수정일 :
									<c:out value="${item.memberModDatetime}" />
								</p>
								<div>
									<button type="button" class="btn btn-primary" id="btnList">목록</button>
<!-- 									<button type="button" class="btn btn-primary" id="btnSave">저장</button>
									<button type="button" class="btn btn-danger" id="btnUelete">삭제</button> -->
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

<!-- vo.jsp -->
<form action="" method="POST" name="formVo" id="formVo">
	<%@include file="memberVo.jsp"%>
</form>

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; Your Website 2020</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->

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

<!-- My Js File -->
<script src="/resources/js/validation/validationInst.js"></script>

<script type="text/javascript">
	const goUrlList = "/member/memberList"; /* #-> */
	const goUrlInst = "/member/memberInst"; /* #-> */
	const goUrlUpdt = "/member/memberUpdt"; /* #-> */
	const goUrlUele = "/member/memberUele"; /* #-> */
	const goUrlDele = "/member/memberDele"; /* #-> */

	const seq = $("input:hidden[name=seq]"); /* #-> */

	const form = $("form[name=form]");
	const formVo = $("form[name=formVo]");

	const nameEng = $("input[name=ifccNameEng]");
	const nameKor = $("input[name=ifccNameKor]");
	const useNY = $("select[name=useNY]");
	const delNY = $("select[name=delNY]");

	$("#btnList").on("click", function() {
		formVo.attr("action", goUrlList).submit();
	})

	$("#btnSave").on("click", function() {
		if (seq.val() == "0" || seq.val() == "") {
			// insert
			form.attr("action", goUrlInst).submit();
		} else {
			// update
			form.attr("action", goUrlUpdt).submit();
		}
	});
	
	$("#btnRegHistory").on("click", (e) => {
		if (e.target.checked) {
			document.getElementById("regHistory").style.display = 'block';
		} else {
			document.getElementById("regHistory").style.display = 'none';
		}
	})
	$("#btnBuyHistory").on("click", (e) => {
		if (e.target.checked) {
			document.getElementById("buyHistory").style.display = 'block';
		} else {
			document.getElementById("buyHistory").style.display = 'none';
		}
	})
	
	$("#memberPW").on("click", (e) => {
		if (!alert("비밀번호를 수정하시겠습니까?")) {
			$("#memberPW").attr("readonly", false);
			$("#memberPW").on("focusout", (e) => {
				$("#memberPW").attr("readonly", true)
			})
		} else {
			$("#memberPW").attr("readonly", false)
		}
	})
</script>
</body>
</html>

