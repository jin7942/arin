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
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">코드 관리</h1>

	<div class="row">
		<div class="col-lg-12">
			<!-- Search-area -->
			<div class="card shadow mb-4">
				<div class="card-body">


					<form method="GET" action="" id="form" name="form">
						<div style="display: flex">
							<div class="col-6">
								<input type="hidden" id="infrCodeGroup_ifcgSeq" name="infrCodeGroup_ifcgSeq" value="<c:out value="${item.infrCodeGroup_ifcgSeq}"/>" />
								<input type="hidden" id="mainKey" name="mainKey" value="<c:out value="${vo.mainKey}"/>" />

								<label for="ifcgSeq" class="form-label">
									코드그룹 <b>*</b>
								</label>
								
								<select class="form-control" id="ifcgSeq" name="ifcgSeq">
									<option value="0">선택하세요</option>
									<c:forEach items="${list}" var="list" varStatus="status">
										<option value="<c:out value="${list.ifcgSeq}"/>">
											<c:out value="${list.ifcgNameKor}" />
										</option>
									</c:forEach>
								</select>
								<!--                                                 
                                                    <label for="input1" class="form-label">코드그룹 코드</label>
                                                    <input type="text" id="input1" class="form-control" placeholder="영문(대소문자),숫자" />
 -->
								<label for="ifcgNameKor" class="form-label">
									코드그룹 이름(한글) <b>*</b>
								</label>
								<input type="text" id="ifccNameKor" name="ifccNameKor" class="form-control" placeholder="한글, 숫자" value="<c:out value="${item.ifccNameKor}"/>" />

								<label for="ifccUseNY" class="form-label">
									사용여부 <b>*</b>
								</label>
								<select class="form-control" id="ifccUseNY" name="ifccUseNY">
									<option value="0" <c:if test="${item.ifccUseNY eq 0}"  >selected</c:if>>N</option>
									<option value="1" <c:if test="${item.ifccUseNY eq 1}"  >selected</c:if>>Y</option>
								</select>

								<label for="ifccDescription" class="form-label">설명</label>
								<textarea class="form-control" name="ifccDescription" id="ifccDescription" cols="10" rows="2" style="text-align: left;"><c:out value="${item.ifccDescription}" /></textarea>


								<label for="input5" class="form-label">예비1 (varchar type)</label>
								<input type="text" id="input5" class="form-control" placeholder="영문(대소문자),숫자" />

								<label for="input6" class="form-label">예비3 (varchar type)</label>
								<input type="text" id="input6" class="form-control" placeholder="영문(대소문자),숫자" />

								<label for="input7" class="form-label">예비1 (int type)</label>
								<input type="text" id="input7" class="form-control" placeholder="숫자" />

								<label for="input8" class="form-label">예비3 (int type)</label>
								<input type="text" id="input8" class="form-control" placeholder="숫자" />
							</div>

							<div class="col-6">
								<label for="input9" class="form-label">코드그룹 코드 (Another)</label>
								<input type="text" id="input9" class="form-control" placeholder="영문(대소문자),숫자" />

								<label for="ifccNameEng" class="form-label">
									코드그룹 이름 (영문) <b>*</b>
								</label>
								<input type="text" id="ifccNameEng" name="ifccNameEng" class="form-control" placeholder="영문(대소문자),숫자" value="<c:out value="${item.ifccNameEng}"/>" />

								<label for="input11" class="form-label">숫자</label>
								<input type="text" id="input11" class="form-control" placeholder="숫자" />

								<label for="ifccDelNY" class="form-label">
									삭제여부 <b>*</b>
								</label>
								<select class="form-control" id="ifccDelNY" name="ifccDelNY">
									<option value="0" <c:if test="${item.ifccDelNY eq 0}"  >selected</c:if>>N</option>
									<option value="1" <c:if test="${item.ifccDelNY eq 1}"  >selected</c:if>>Y</option>
								</select>

								<label for="input13" class="form-label">예비2 (varchar type)</label>
								<input type="text" id="input13" class="form-control" placeholder="영문(대소문자),숫자" />

								<label for="input14" class="form-label">예비1 (int type)</label>
								<input type="text" id="input14" class="form-control" placeholder="숫자" />

								<br />

								<p class="form-control">
									등록일 :
									<c:out value="${item.ifccRegDatetime }" />
								</p>
								<p class="form-control">
									수정일 :
									<c:out value="${item.ifccModDatetime }" />
								</p>
								<div>
									<button type="button" class="btn btn-primary" id="btnList">목록</button>
									<button type="button" class="btn btn-primary" id="btnSave">등록</button>
									<button type="button" class="btn btn-danger" id="btnUelete">삭제</button>
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
	var goUrlList = "/code/codeList"; /* #-> */
	var goUrlInst = "/code/codeInst"; /* #-> */
	var goUrlUpdt = "/code/codeUpdt"; /* #-> */
	var goUrlUele = "/code/codeUele"; /* #-> */
	var goUrlDele = "/code/codeDele"; /* #-> */

	var seq = $("input:hidden[name=infrCodeGroup_ifcgSeq]"); /* #-> */

	var form = $("form[name=form]");
	var formVo = $("form[name=formVo]");

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
			if (validationInst(nameEng, nameKor, useNY, delNY) == false)
				return false;
			form.attr("action", goUrlInst).submit();
		} else {
			// update
			/* keyName.val(atob(keyName.val())); */
			/* if (validationUpdt() == false) return false; */
			form.attr("action", goUrlUpdt).submit();
		}
	});

	$("#btnUelete").on("click", function() {
		if (seq.val() == "0" || seq.val() == "") {
			// insert
			/* if (validationInst() == false) return false; */
			alert("tset");
			return false;
		} else {
			form.attr("action", goUrlUele).submit();
		}
	});
</script>
</body>
</html>

