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
	<div class="container" style="margin-top: 10%; margin-bottom: 10%; width: 85%" data-aos="fade-up">
		<div class="row">
			<div class="col-12">
				<div style="float: left;">

					<!-- search form -->
					<form class="d-flex" role="search" action="/main/">
						<input class="form-control me-2" id="shValue" type="search" placeholder="Search" aria-label="Search" name="shValue" value="<c:out value="${vo.shValue}" />" />
						<button class="btn btn-outline-dark" type="submit" style="display: inline-block; width: 200px; white-space: nowrap;">검색</button>
					</form>
				</div>

				<div style="float: right">
					<button type="button" class="btn btn-dark" onclick="javascript:goItemForm(<c:out value="${vo.mainKey}"/>)">상품등록</button>
				</div>
			</div>
		</div>

		<form action="" name="form" method="post">
			<input type="hidden" name="mainKey" value="<c:out value="${vo.mainKey}"/>" />
		</form>

		<!-- form -->
		<form action="" name="" method="post">
			<!-- main -->
			<div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top: 3%" id="itemList">

				<!-- item -->
				<c:forEach items="${list}" var="list" varStatus="status">
					<div class="col" style="cursor: pointer">
						<div class="card" data-aos="fade-up" data-aos-delay="200">
							<img src="<c:out value="${list.path}" /><c:out value="${list.uuidName}" />" class="img-thumbnail card-img-top" />
							<div class="card-body" onclick="goView(<c:out value="${list.itemSeq}"/>)">

								<%-- <input type="hidden" name="seq" value="<c:out value="${list.seq}" />" /> --%>

								<h5 class="card-title">
									<b><c:out value="${list.itemHeader}" /></b>
								</h5>
								<p class="card-text">
									<fmt:formatNumber value="${list.itemPrice}" pattern="#,###,###" />
									원
								</p>
								<p class="card-text" style="float: left">
									<c:out value="${list.itemRegDatetime}" />
								</p>
								<p class="card-text" style="float: right">
									<c:out value="${list.itemPlace}" />
								</p>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</form>
		<!-- End of form -->
	</div>
</main>
<!-- End #main -->

<script type="text/javascript">
       	const goUrlView = "/main/view"
       	const goUrlForm = "/main/form"
       	
       	const mainKey = $("input[name=mainKey]");
       	const form = $("form[name=form]");
       	
       	function goView(keyValue) {
       		mainKey.val(keyValue);
       		form.attr("action", goUrlView).submit();
		}
       	
       	function goItemForm(keyValue) {
       		mainKey.val(keyValue);
       		form.attr("action", goUrlForm).submit();
		}
       	

        function addComma(Obj) {
            const regexp = /\B(?=(\d{3})+(?!\d))/g;
            return Obj.toString().replace(regexp, ',');
        }

        let thisPage = 1
       	
        window.addEventListener('scroll', (e) => {
        	const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement
        	
            if (clientHeight + scrollTop >= scrollHeight) {
            	thisPage++;
            	console.log("thisPage" + thisPage)
            	
            	$.ajax({
        			async:'false',
        			url:'./getList',
        			type:'post',
        			data:{"thisPage" : thisPage},
        			success:(res) => {
        				if (res.rt == "success") {
	        				console.log(res);
	        				
	        				for (let i = 0; i < res.data.length; i++) {
	        					let listHTML = "";
	        					
	        					listHTML += '<div class="col" style="cursor: pointer">';
	        					listHTML += '	<div class="card" data-aos="fade-up" data-aos-delay="200">';
	                            listHTML += '		<div class="card-body" onclick="goView(' + res.data[i].itemSeq + ')">';
	                            listHTML += '			<img src="' + res.data[i].path + res.data[i].uuidName + '" class="card-img-top" alt="..." />';
	                            listHTML += '			<div class=' + 'card-body' + '>';
	                            listHTML += '				<h5 class="card-title"><b>' + res.data[i].itemHeader + '</b></h5>';
	                            listHTML += '				<p class="card-text">' + addComma(res.data[i].itemPrice) +'원</p>';
	                            listHTML += '				<p class="card-text" style="float: left">' + res.data[i].itemRegDatetime + '</p>';
	                            listHTML += '				<p class="card-text" style="float: right">' + res.data[i].itemPlace + '</p>';
	                            listHTML += '			</div>';
	                            listHTML += '		</div>';
	                            listHTML += '	</div>';
	                            listHTML += '</div>';
	                         	
	                            console.log(res.data[i])
	                            document.getElementById('itemList').innerHTML += listHTML;
	        				}
        				} else return false;
        			},
        			error:(jqXHR) => {
        				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
        			}
        		});
            }    
        });
       	
</script>

<!-- footer -->
<%@include file="../../common/user/includeV1/footer.jsp"%>
<!-- End of footer -->

</body>
</html>