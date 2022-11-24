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
	<h1 class="h3 mb-4 text-gray-800">상품 관리</h1>

	<div class="row">
		<div class="col-lg-12">
			<!-- Search-area -->
			<div class="card shadow mb-4">
				<div class="card-body">


					<form method="POST" action="" id="form" name="form">
						<div style="display: flex">
							<div class="col-6">
								<input type="hidden" name="seq" id="seq" value="<c:out value="${item.seq}"/>" />

<!-- 
								상품 이미지
								<label for="" class="form-label">
									상품 사진 <b>*</b>
								</label>
								<input type="text" id="" name="" class="form-control" placeholder="이름" value="" />

 -->
								<!-- 상품 이름 -->
								<label for="itemHeader" class="form-label">
									상품 이름 <b>*</b>
								</label>
								<input type="text" id="itemHeader" class="form-control" name="itemHeader" placeholder="상품이름" value="<c:out value="${item.itemHeader}"/>" />

								<!-- 상품 가격 -->
								<label for="itemPrice" class="form-label"> 가격 <b>*</b> </label>
								<input type="text" id="itemPrice" class="form-control" name="itemPrice" placeholder="가격" value="<c:out value="${item.itemPrice}"/>" />

								<!-- 상품 설명 -->
								<label for="itemDescription">상품설명 <b>*</b> </label>
								<textarea class="form-control" id="itemDescription" name="itemDescription" value="" rows="10">
									<c:out value="${fn:replace(item.itemDescription, br, '<br/>')}" escapeXml="false" />
								</textarea>

							</div>

							<div class="col-6">

								<!-- 등록 장소 -->
								<label for="itemPlace" class="form-label"> 등록장소 </label>
								<input type="text" id="itemPlace" class="form-control" name="itemPlace" placeholder="등록장소" value="<c:out value="${item.itemPlace}"/>" />

								<!-- 삭제여부 -->
								<label for="itemDelNY" class="form-label">
									삭제여부 <b>*</b>
								</label>
								<select class="form-control" id="itemDelNY" name="itemDelNY">
									<option value="0" <c:if test="${item.itemDelNY eq '0'}"  >checked="checked"</c:if>>N</option>
									<option value="1" <c:if test="${item.itemDelNY eq '1'}"  >checked="checked"</c:if>>Y</option>
								</select>

								<!-- 판매 여부 -->
								<label for="itemSaleNY" class="form-label">
									상태 <b>*</b>
								</label>
								<select class="form-control" id="itemSaleNY" name="itemSaleNY">
									<option value="0" <c:if test="${item.itemSaleNY eq '0'}"  >checked="checked"</c:if>>판매중</option>
									<option value="1" <c:if test="${item.itemSaleNY eq '1'}"  >checked="checked"</c:if>>판매완료</option>
								</select>

								<!-- 판매자 -->
								<label for="seller" class="form-label">판매자</label>
								<input type="text" id="seller" class="form-control" name="seller" placeholder="" value="<c:out value="${item.seller}"/>" readonly/>
								<input type="hidden" name="member_seq" value="<c:out value="${item.member_seq}"/>" />
								
								<!-- 구매자 -->
								<label for="buyer" class="form-label">
									구매자
								</label>
								<input type="text" class="form-control" id="buyer" name="buyer" placeholder="" value="<c:out value="${item.buyer}"/>" readonly/>
								<input type="hidden" name="member_seq1" value="<c:out value="${item.member_seq1}"/>" />

								<br />

								<p class="form-control">
									등록일 :
									<c:out value="${item.itemRegDatetime}" />
								</p>
								<p class="form-control">
									수정일 :
									<c:out value="${item.itemModDatetime}" />
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
	<%@include file="itemVo.jsp"%>
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
	const goUrlList = "/code/itemList"; /* #-> */
	const goUrlInst = "/code/itemInst"; /* #-> */
	const goUrlUpdt = "/code/itemUpdt"; /* #-> */
	const goUrlUele = "/code/itemUele"; /* #-> */
	const goUrlDele = "/code/itemDele"; /* #-> */

	const goUrlForm = "/member/memberForm"; /* #-> */

	const seq = $("input:hidden[name=seq]"); /* #-> */

	const form = $("form[name=form]");
	const formVo = $("form[name=formVo]");

	const nameEng = $("input[name=ifccNameEng]");
	const nameKor = $("input[name=ifccNameKor]");
	const useNY = $("select[name=useNY]");
	const delNY = $("select[name=delNY]");
	
	const goForm = (keyValue) => {
		$("input[name=mainKey]").val(keyValue);
		formVo.attr("action", goUrlForm).submit();
	}

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
	
	$("#seller").on("click", () => {
		if(!alert("판매자 정보를 보시겠습니까?")) {
			goForm($("input[name=member_seq]").val())
		}
	})
	
	$("#buyer").on("click", () => {
		if ($("input[name=member_seq1]").val() == "") {
			// by pass
		} else if(!alert("구매자 정보를 보시겠습니까?")) {
			goForm($("input[name=member_seq1]").val())
		}
	})
	
	
</script>
</body>
</html>