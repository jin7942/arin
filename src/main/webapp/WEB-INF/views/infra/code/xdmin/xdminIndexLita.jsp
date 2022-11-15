<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<table class='small table table-hover'>

	<tr>
		<td>이름</td>
		<td>ID</td>
		<td>IP</td>
		<td>시간</td>
	</tr>

	<c:choose>
		<c:when test="${fn:length(visitList) eq 0 }">
			<tr>
				<td colspan="4">No Data..</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${visitList}" var="visitList" varStatus="status">
				<tr>
					<td>
						<c:out value="${visitList.memberName }" />
					</td>
					<td>
						<c:out value="${visitList.memberID }" />
					</td>
					<td>
						<c:out value="${visitList.loginLogIp }" />
					</td>
					<td>
						<c:out value="${visitList.loginLogDatetime }" />
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</table>
<!-- pagination s -->
<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
<!-- pagination e -->