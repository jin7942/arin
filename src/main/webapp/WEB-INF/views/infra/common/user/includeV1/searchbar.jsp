<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!-- Search Form -->
<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" method="GET" action="" id="searchForm" name="searchForm">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}" />">

	<div class="input-group">
		<select id="shOptionDelNY" name="shOptionDelNY" class="select btn btn-secondary dropdown-toggle">
			<option value="" selected <c:if test="${empty vo.shOptionDelNY}"  >selected</c:if>>판매여부</option>
			<option value="0" <c:if test="${vo.shOptionDelNY eq '0'}"  >selected</c:if>>판매중</option>
			<option value="1" <c:if test="${vo.shOptionDelNY eq '1'}"  >selected</c:if>>판매완료</option>
		</select>
		&nbsp;

		<input id="shStartDate" name="shStartDate" type="date" value="<c:out value="${vo.shStartDate}"/>" class="form-control bg-light border-0 small" placeholder="시작일" aria-label="Search" aria-describedby="basic-addon2" />
		<input id="shEndDate" name="shEndDate" type="date" value="<c:out value="${vo.shEndDate}"/>" class="form-control bg-light border-0 small" placeholder="종료일" aria-label="Search" aria-describedby="basic-addon2" />
		<input id="shValue" name="shValue" value="<c:out value="${vo.shValue}"/>" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />

		<!-- icons -->
		<div class="input-group-append">
			<button class="btn btn-primary" type="submit">
				<i class="fas fa-search fa-sm"></i>
			</button>
			<button class="btn btn-dark" type="button" onclick="refresh()">
				<i class="fa-solid fa-arrow-rotate-right"></i>
			</button>
		</div>
		&nbsp;
		<p style="float: right">
			Total :
			<c:out value="${cnt}" />
		</p>
	</div>
</form>
<!-- End Of Search Form -->