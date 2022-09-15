<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<!-- topbar s -->
<%@include file="../../common/xdmin/includeV1/topbar.jsp"%>
<!-- topbar e -->

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">코드그룹 관리</h1>

	<div class="row">
		<div class="col-lg-12">
			<!-- Search-area -->
			<div class="card shadow mb-4">
				<div class="card-body">
					<form method="GET" id="form" name="form">
						<div style="display: flex">
							<div class="col-6">
								<input type="hidden" id="ifcgSeq" name="ifcgSeq" value="<c:out value="${dto.ifcgSeq}"/>" />
								<%--                                                 
	                                                <label for="input33" class="form-label">코드그룹</label>
	                                                <select class="form-control" id="input33">
	                                                <c:forEach items="${list}" var="list" varStatus="status">
	                                                	<option value="<c:out value="${list.ifcgSeq }"/>">
	                                                		<c:out value="${list.ifcgNameKor}"/>
	                                                	</option>
	                                                </c:forEach>
	                                                </select>
 --%>
								<label for="input1" class="form-label">코드그룹 코드</label> 
								<input type="text" id="input1" class="form-control" placeholder="영문(대소문자),숫자" /> 
								
								<label for="ifcgNameKor" class="form-label">코드그룹 이름(한글) <b>*</b></label> 
								<input type="text" id="ifcgNameKor" name="ifcgNameKor" class="form-control" placeholder="한글, 숫자" value="<c:out value="${dto.ifcgNameKor}"/>" /> 
								
								<label for="ifcgUseNY" class="form-label">사용여부 <b>*</b></label> 
								<select class="form-control" id="ifcgUseNY" name="ifcgUseNY">
									<option value="0" <c:if test="${dto.ifcgUseNY eq 0}"  >selected</c:if>>N</option>
									<option value="1" <c:if test="${dto.ifcgUseNY eq 1}"  >selected</c:if>>Y</option>
								</select>
								<%-- 
                                                    <label for="ifcgDescription" class="form-label">설명</label>
                                                    <textarea class="form-control" name="ifcgDescription" id="ifcgDescription" cols="10" rows="2" style="text-align: left;"><c:out value="${dto.ifcgDescription}"/></textarea>
                             
 --%>
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
								
								<label for="ifcgNameEng" class="form-label">코드그룹 이름 (영문) <b>*</b></label> 
								<input type="text" id="ifcgNameEng" name="ifcgNameEng" class="form-control" placeholder="영문(대소문자),숫자" value="<c:out value="${dto.ifcgNameEng}"/>" /> 
								
								<label for="input11" class="form-label">숫자</label> <input type="text" id="input11" class="form-control" placeholder="숫자" /> 
								<label for="ifcgDelNY" class="form-label">삭제여부 <b>*</b></label> <select class="form-control" id="ifcgDelNY" name="ifcgDelNY">
									<option value="0" <c:if test="${dto.ifcgDelNY eq 0}"  >selected</c:if>>N</option>
									<option value="1" <c:if test="${dto.ifcgDelNY eq 1}"  >selected</c:if>>Y</option>
								</select> <label for="input13" class="form-label">예비2 (varchar type)</label> <input type="text" id="input13" class="form-control" placeholder="영문(대소문자),숫자" /> <label for="input14" class="form-label">예비1 (int type)</label> <input type="text" id="input14" class="form-control" placeholder="숫자" />
								<div>
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

<script type="text/javascript">
	    	var goUrlList = "/codegroup/codeGroupList"; 			/* #-> */
	    	var goUrlInst = "/codegroup/codeGroupInst"; 			/* #-> */
	    	var goUrlUpdt = "/codegroup/codeGroupUpdt";				/* #-> */
	    	var goUrlUele = "/codegroup/codeGroupUele";				/* #-> */
	    	var goUrlDele = "/codegroup/codeGroupDele";				/* #-> */
	    	
	    	var seq = $("input:hidden[name=ifcgSeq]");				/* #-> */
	    	
	    	var form = $("form[name=form]");
	    	var formVo = $("form[name=formVo]");
	    	
	    	
	    	$("#btnSave").on("click", function(){
	    		if (seq.val() == "0" || seq.val() == ""){
	    	   		// insert
	    	   		/* if (validationInst() == false) return false; */
	    	   		form.attr("action", goUrlInst).submit();
	    	   	} else {
	    	   		// update
	    	   		/* keyName.val(atob(keyName.val())); */
	    	   		/* if (validationUpdt() == false) return false; */
	    	   		form.attr("action", goUrlUpdt).submit();
	    	   	}
	    	});
	    	
	    	$("#btnUelete").on("click", function(){
	    		if (seq.val() == "0" || seq.val() == ""){
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

