<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<c:forEach items="${list}" var="list" varStatus="status">
	<div class="col" style="cursor: pointer">
		<div class="card">
			<img src="<c:out value="${list.path}" /><c:out value="${list.uuidName}" />" class="card-img-top" alt="..." />
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