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
	<form action="" name="goForm">
		<input type="hidden" name="itemSeq" id="itemSeq" value="<c:out value="${item.itemSeq}"/>" />
		<input type="hidden" name="member_seq" id="member_seq" value="<c:out value="${item.member_seq}"/>" />
	</form>
	
	<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 85%" data-aos="fade-up">
		<div class="row gx-4">
			<div class="col-4">
				<div class="card mb-3" style="max-width: 540px">
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">

						<div class="carousel-inner">

							<div class="carousel-item active">
								<img src="<c:out value="${item.path}" /><c:out value="${item.uuidName}" />" class="d-block w-100" alt="..." />
							</div>

							<c:forEach items="${list}" var="list" varStatus="status">
								<div class="carousel-item">
									<img src="<c:out value="${list.path}" /><c:out value="${list.uuidName}" />" class="d-block w-100" alt="..." />
								</div>
							</c:forEach>
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

			<input type="hidden" name="mainKey" id="mainKey" value="<c:out value="${vo.mainKey}"/>" />
			<input type="hidden" name="itemSeq" id="itemSeq" value="<c:out value="${item.itemSeq}"/>" />
			<input type="hidden" name="member_seq" id="member_seq" value="<c:out value="${item.member_seq}"/>" />
			<input type="hidden" name="sessSeq" id="sessSeq" value="<c:out value="${sessSeq}"/>" />
			<input type="hidden" name="sessName" id="sessName" value="<c:out value="${sessName}"/>" />

			<div class="col-4">
				<h2>
					<b> <c:out value="${item.itemHeader}" />
					</b>
				</h2>
				<h3>
					<fmt:formatNumber value="${item.itemPrice}" pattern="#,###,###" />
					원
				</h3>
				<%-- 				<p>
					<c:out value="${item.itemDescription}" />
				</p> --%>
				<p>
					<c:out value="${fn:replace(item.itemDescription, br, '<br/>')}" escapeXml="false" />
				</p>
			</div>

			<div class="col-4">
				<div>
					<i class="fa-solid fa-user fa-xl"></i><b><c:out value="${item.seller}" /></b>
				</div>
				<div style="margin-top: 20px">
					<i class="fa-sharp fa-solid fa-location-dot fa-xl"></i><b><c:out value="${item.itemPlace}" /></b>
				</div>

				<div style="text-align: center; margin-top: 20%">
					<button type="button" class="btn btn-dark btn-lg" style="width: 40%" onClick="insertItemCart()">
						<i class="fa-solid fa-cart-shopping fa-xl" id="btn-like"></i>
					</button>

					<button type="button" class="btn btn-dark btn-lg" style="width: 40%" data-bs-toggle="modal" data-bs-target="#exampleModal">구매하기</button>
				</div>

				<div style="text-align: center; margin-top: 20%">
					<%-- <a onclick="goModForm(<c:out value="${item.itemSeq}" />, <c:out value="${sessSeq}" />)" style="color: black; text-align: center; cursor: pointer">수정하기</a> --%>
				</div>
			</div>
		</div>


		<!-- 리뷰 -->
		<form action="" name="commentForm">
			<div class="row gx-5" style="margin-top: 20%; width: 100%">

				<h3>리뷰</h3>
				<hr />

				<div class="col-6">

					<div class="comment" id="comment">

						<c:forEach items="${listComment}" var="listComment" varStatus="status">
							<div id="review">
								<h5>
									<b><c:out value="${listComment.memberName}" /></b>
								</h5>
								<span style="float: right"><c:out value="${listComment.itemReviewModDatetime}" /></span>
								<p>
									<c:out value="${listComment.itemReviewComment}" />
								</p>
								<hr />
							</div>
						</c:forEach>

					</div>

					<h4>
						<a class="nav-link scrollto" href="/user/info"><b><c:out value="${sessName }" /></b>님</a>
					</h4>
					<input type="text" class="form-control" style="height: 150px" id="itemReviewComment" name="itemReviewComment" />
					<br />
					<button type="button" class="btn btn-dark" onclick="commentReject()">등록</button>

				</div>
				<div class="col-3"></div>


				<div class="col-3"></div>
			</div>
		</form>

		<!-- 추천상품 -->
		<form action="" method="post" name="form">
			<input type="hidden" name="mainKey" id="mainKey" value="<c:out value="${vo.mainKey}"/>" />
			<div class="card-group">
				<div class="row gx-5" style="margin-top: 10%; width: 100%">
					<hr />
					<h3>추천상품</h3>

					<c:forEach items="${listRecommend}" var="listRecommend" varStatus="status">
						<div class="col-4">
							<div class="card" style="cursor: pointer" onclick="goView(<c:out value="${listRecommend.itemSeq}"/>)">
								<img src="<c:out value="${listRecommend.path}" /><c:out value="${listRecommend.uuidName}" />" class="card-img-top" alt="..." />
								<div class="card-body">
									<h5 class="card-title">
										<c:out value="${listRecommend.itemHeader}" />
									</h5>
									<p class="card-text">
										<small class="text-muted"><fmt:formatNumber value="${listRecommend.itemPrice}" pattern="#,###,###" /> 원</small>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</form>
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
					<b><c:out value="${sessName }" />님</b><br />구매가 완료되었습니다.
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
	const commentReject = () => {
		const comment = document.getElementById("comment");
		let commentHTML = "";
		
		$.ajax({
			async:'false',
			url:'./regComment',
			type:'post',
			data:{"seq": $("#sessSeq").val() ,"itemReviewComment" : $("#itemReviewComment").val(), "itemSeq" : $("#itemSeq").val()  },
			success:(res) => {
				if (res.rt == "success") {

					commentHTML += '<div id="review">'
					commentHTML += '<h5><b>' + $("#sessName").val() + '</b><span style="float: right">' + 'now' + '</span></h5>'
					commentHTML += '<p>'+ $("#itemReviewComment").val() +'</p>'
					commentHTML += '<hr />'
					commentHTML += '</div>'
					comment.innerHTML += commentHTML;
				} else {
					alert("등록 실패");
				}
			},
			error:(jqXHR) => {
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
		
	}

	function goView(keyValue) {
		const goUrlView = "/main/view"
		const form = $("form[name=form]");
		const mainKey = $("input[name=mainKey]");
		
		mainKey.val(keyValue);
		form.attr("action", goUrlView).submit();
	}

	function buyItem() {
		$.ajax({
			async:'false',
			url:'./buyItem',
			type:'post',
			data:{"mainKey": $("#sessSeq").val() ,"itemSeq" : $("#itemSeq").val() },
			success:(res) => {
				if (res.rt == "success") {
					// by pass
				} else {
					alert("구매 실패");
					location.href = "/main/view";
					return false;
				}
			},
			error:(jqXHR) => {
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	}

	function insertItemCart() {
		$.ajax({
			async:'false',
			url:'./insertItemCart',
			type:'post',
			data:{"mainKey": $("#sessSeq").val() ,"itemSeq" : $("#itemSeq").val() },
			success:(res) => {
				if (res.rt == "success") {
					alert("장바구니 등록")
				} else {
					alert("이미 장바구니에 담은 상품입니다.");
					return false;
				}
			},
			error:(jqXHR) => {
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	}
	
	const goModForm = (itemSeq, seq) => {
		if ($("input[name=member_seq]").val() == seq) {
			const form = $("form[name=goForm]");
			form.attr("action", "/main/form").submit();
			
		} else {
			alert("수정할 권한이 없습니다.");
		}
	}

</script>
</body>
</html>
