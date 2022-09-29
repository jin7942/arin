<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<!-- header -->
<%@include file="../../common/user/includeV1/header.jsp"%>
<!-- End of header -->

<main id="main">
	<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 85%" data-aos="fade-up">
		<div class="row gx-4">
			<div class="col-4">
				<div class="card mb-3" style="max-width: 540px">
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="/resources/template_imperial/assets/img/sample.jpg" class="d-block w-100" alt="..." />
							</div>
							<div class="carousel-item">
								<img src="/resources/template_imperial/assets/img/bgimg.jpg" class="d-block w-100" alt="..." />
							</div>
							<div class="carousel-item">
								<img src="/resources/template_imperial/assets/img/sample.jpg" class="d-block w-100" alt="..." />
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>

			<input type="hidden" name="mainKey" id="mainKey" value="<c:out value="${vo.mainKey}"/>"/>
			<input type="hidden" name="itemSeq" id="itemSeq" value="<c:out value="${item.itemSeq}"/>" />
			<div class="col-4">
				<h2>
					<b> <c:out value="${item.itemHeader}" />
					</b>
				</h2>
				<h3>
					<fmt:formatNumber value="${item.itemPrice}" pattern="#,###,###"/>
					원
				</h3>
				<p>
					<c:out value="${item.itemDescription}" />
				</p>
			</div>

			<div class="col-4">
				<div>
					<i class="fa-solid fa-user fa-xl"></i><b><c:out value="${item.seller}"/></b>
				</div>
				<div style="margin-top: 20px">
					<i class="fa-sharp fa-solid fa-location-dot fa-xl"></i><b><c:out value="${item.itemPlace}"/></b>
				</div>
				
				<div style="text-align: center; margin-top: 20%">
					<button type="button" class="btn btn-dark btn-lg" style="width: 40%">
						<i class="fa-solid fa-cart-shopping fa-xl" id="btn-like"></i>
					</button>
					
					<button type="button" class="btn btn-dark btn-lg" style="width: 40%" data-bs-toggle="modal" data-bs-target="#exampleModal">구매하기</button>
				</div>

				<div style="text-align: center; margin-top: 20%">
					<a href="" style="color: black; text-align: center">부적절한 상품 신고하기</a>
				</div>
			</div>
		</div>

		<div class="card-group">
			<div class="row gx-5" style="margin-top: 10%; width: 100%">
				<hr />
				<h3>추천상품</h3>

				<div class="col-4">
					<div class="card" style="cursor: pointer">
						<img src="/resources/template_imperial/assets/img/sample.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								<small class="text-muted">360,000원</small>
							</p>
						</div>
					</div>
				</div>

				<div class="col-4">
					<div class="card" style="cursor: pointer">
						<img src="/resources/template_imperial/assets/img/sample.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								<small class="text-muted">360,000원</small>
							</p>
						</div>
					</div>
				</div>

				<div class="col-4">
					<div class="card" style="cursor: pointer">
						<img src="/resources/template_imperial/assets/img/sample.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								<small class="text-muted">360,000원</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">구매</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">구매하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-dark" data-bs-target="#exampleModal2" data-bs-toggle="modal" onclick="buyItem()">예</button>
				</div>
			</div>
		</div>
	</div>

	<!-- modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">구매확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<b>김진범님</b><br />구매가 완료되었습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" data-bs-dismiss="modal" onclick="location.href='/main/'">닫기</button>
					<button type="button" class="btn btn-dark" data-bs-dismiss="modal" onclick="location.href='/user/history'">주문내역보기</button>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- End #main -->

<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->

<script type="text/javascript">

	function buyItem() {
		$.ajax({
			async:'false',
			url:'./buyItem',
			type:'post',
			data:{"member_seq1": 1,"mainKey" : $("#mainKey").val() },
			success:(res) => {
				if (res.rt != "success") {
					alert("구매 실패");
					return;
				};
			},
			error:(jqXHR) => {
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	}

</script>
</body>
</html>
