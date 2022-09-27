<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<!-- header -->
<%@include file="../../common/user/includeV1/header.jsp"%>
<!-- End of header -->

        <main id="main">
            <div class="container" style="margin-top: 10%; margin-bottom: 20%; width: 85%" data-aos="fade-up">
                <div class="row" style="text-align: center">
                    <div class="col">
                        <table class="table table-borderless">
                            <!-- table-caption -->
                            <caption class="h2" style="caption-side: top; text-align: center">
                                나의 정보
                            </caption>
                            <caption style="caption-side: top; text-align: right">
                                <i class="fa-solid fa-pen fa-xl" style="cursor: pointer"></i>
                            </caption>

                            <tr>
                                <td rowspan="4">
                                    <img src="/resources/template_imperial/assets/img/sample.jpg" class="img-thumbnail" alt="..." />
                                </td>
                                <td>이름</td>
                                <td><c:out value="${item.memberName}" /></td>
                            </tr>
                            <tr>
                                <td>ID</td>
                                <td><c:out value="${item.memberID}" /></td>
                            </tr>
                            <tr>
                                <td>EMAIL</td>
                                <td><c:out value="${item.memberMailName}" />@<c:out value="${item.memberMailDomain}" /></td>
                            </tr>
                            <tr>
                                <td>MOBILE</td>
                                <td><c:out value="${item.memberMobile}" /></td>
                            </tr>
                            <tr>
                                <td><a href="" style="color: black">프로필 사진 변경</a></td>
                                <td>주소</td>
                                <td><c:out value="${item.memberPlace}" /></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="row" style="text-align: center; margin-top: 20px">
                    <div class="col">
                        <table class="table table-borderless">
                            <tr>
                                <td><i class="fa-solid fa-envelope-open fa-2x" style="cursor: pointer"></i></td>
                                <td>
                                	<i class="fa-brands fa-shopify fa-2x" style="cursor: pointer" onclick="location.href='/user/history'"></i>
                                </td>
                                <td>
                                	<i class="fa-solid fa-cart-plus fa-2x" style="cursor: pointer" onclick="location.href='./cart.html'"></i>
                                </td>
                                <td><i class="fa-solid fa-circle-check fa-2x" style="cursor: pointer"></i></td>
                            </tr>
                            <tr>
                                <td>나의 거래 후기</td>
                                <td>구매내역</td>
                                <td>장바구니</td>
                                <td>내가 등록한 상품</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <!-- End #main -->

        <!-- footer -->
		<%@include file="../../common/user/includeV1/footer.jsp"%>
		<!-- End of footer -->
    </body>
</html>
