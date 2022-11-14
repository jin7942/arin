<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<jsp:useBean id="CodeServiceImpl" class="com.jinfw.infra.modules.code.CodeServiceImpl" />


<c:set var="listCodeCarrier" value="${CodeServiceImpl.selectListCachedCode('1')}" />
<table class="table table-hover">
	<!-- table-caption -->
	<caption style="caption-side: top; text-align: right"></caption>
	<!-- table-header -->

	<thead class="table-dark">
		<tr>
			<td>
				<input type="checkbox" name="" id="" />
			</td>
			<td>#</td>
			<td>seq</td>
			<td>ID</td>
			<td>이름</td>
			<td>연락처</td>
			<td>통신사</td>
			<td>이메일</td>
			<td>등록장소</td>
			<td>등록일</td>
			<td>수정일</td>
			<td>삭제여부</td>
		</tr>
	</thead>

	<!-- table-body -->
	<c:choose>
		<c:when test="${fn:length(list) eq 0 }">
			<tr>
				<td colspan="10">No Data..</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="list" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="" id="" />
					</td>
					<td>
						<%-- <c:out value="${vo.totalRows +((vo.thispage) * vo.rowNumToShow + status.index) + 1 }"></c:out> --%>
					</td>
					<td>
						<a><c:out value="${list.seq}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberID}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberName}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberMobile}"></c:out></a>
					</td>
					<td>
						<c:forEach items="${listCodeCarrier}" var="listCarrier" varStatus="statusCarrier">
							<c:if test="${list.memberCarrier eq listCarrier.ifccSeq}">
								<c:out value="${listCarrier.ifccNameKor }" />
							</c:if>
						</c:forEach>
					</td>
					<td>
						<a><c:out value="${list.memberMailName}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberPlace}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberSignDatetime}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberModDatetime}"></c:out></a>
					</td>
					<td>
						<a><c:out value="${list.memberDelNY}"></c:out></a>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<!-- End of Table -->

<!-- pagination s -->
<%@include file="../../common/xdmin/includeV1/pagination.jsp"%>
<!-- pagination e -->

<script>

</script>