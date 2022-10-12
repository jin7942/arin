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
	<div class="container" style="margin-top: 10%; margin-bottom: 10%; width: 85%" data-aos="fade-up" id="cartList">
		<div class="row" style="text-align: center">
			<div class="col">
				<h2>찜한 목록</h2>
			</div>
		</div>
		<form action="/main/view" id="form" name="form">
		<input type="hidden" name="mainKey" />
			<!-- item -->
			<c:choose>
				<c:when test="${fn:length(list) eq 0 }">
					<p>No Data..</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="list" varStatus="status">


						<div class="card mb-3 item" style="max-width: 80%; margin: 0 auto" data-aos="fade-up" data-aos-delay="200" id="<c:out value="${list.itemSeq}"/>">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="<c:out value="${list.path}" /><c:out value="${list.uuidName}" />" class="img-fluid rounded-start" alt="..." />
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">
											<c:out value="${list.itemHeader}" />
											<a class="btn btn-danger" style="float: right" href="javascript:deleteRow(<c:out value="${list.itemSeq}" />)">X</a>
										</h5>
										<p class="card-text">
											<fmt:formatNumber value="${list.itemPrice}" pattern="#,###,###" />
											원
										</p>
										<p class="card-text" style="text-align: right">
											<a class="btn btn-dark" href="javascript:goView(<c:out value="${list.itemSeq}" />)">구매하기</a>
										</p>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
</main>
<!-- ======= End of Main ======= -->

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->

<script>
	const mainKey = $("input[name=mainKey]");
	
	function goView(keyValue) {
   		mainKey.val(keyValue);
   		form.submit();
	}
	
	function deleteRow(keyValue) {
		 $.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "./deleteCartItem"
			,data : {"itemSeq" : keyValue}
			,success: (res) => {
				if(res.rt == "success") {
					const list = document.querySelectorAll(".item");
					
					for (let i = 0; i < list.length; i++) {
						if (list[i].id == keyValue) {
							list[i].remove();
						}
					}
					
				} else {
					// by pass
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		}); 
	}
</script>

</body>
</html>
