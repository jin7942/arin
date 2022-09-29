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
	                            <input 
	                            	class="form-control me-2" 
	                            	type="search" 
	                            	placeholder="Search" 
	                            	aria-label="Search" 
	                            	name="shValue" 
	                            	value="<c:out value="${vo.shValue}" />"
	                            	/>
	                            <button class="btn btn-outline-dark" type="submit" style="display: inline-block; width: 200px; white-space: nowrap;">
	                            	검색
	                            </button>
                        	</form>
                    	</div>
                    	
                        <div style="float: right">
	                            <button type="button" class="btn btn-dark" onclick="javascript:goItemForm(<c:out value="${vo.mainKey}"/>)">상품등록</button>
                        </div>
                    </div>
                </div>

				<form action="" name="form">
					<input type="hidden" name="mainKey" value="<c:out value="${vo.mainKey}"/>"/>
				</form>

               	<!-- form -->
               	<form action="" name="">
	                <!-- main -->
	                <div class="row row-cols-1 row-cols-md-3 g-4" style="margin-top: 3%">
                
	                    <!-- item -->
	                    <c:forEach items="${list}" var="list" varStatus="status">
		                    <div class="col" style="cursor: pointer" >
		                        <div class="card">
		                            <img src="/resources/template_imperial/assets/img/sample.jpg" class="card-img-top" alt="..." />
		                            <div class="card-body" onclick="goView(<c:out value="${list.itemSeq}"/>)">
		                            
		                            	<input type="hidden" name="seq" value="<c:out value="${list.seq}" />" />
		                            	
		                                <h5 class="card-title"><b> <c:out value="${list.itemHeader}" /> </b></h5>
		                                <p class="card-text"><fmt:formatNumber value="${list.itemPrice}" pattern="#,###,###"/>원</p>
		                                <p class="card-text" style="float: left"><c:out value="${list.itemRegDatetime}" /></p>
		                                <p class="card-text" style="float: right"><c:out value="${list.itemPlace}" /></p>
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
        	
        </script>
        
        <!-- footer -->
		<%@include file="../../common/user/includeV1/footer.jsp"%>
		<!-- End of footer -->

    </body>
</html>
