<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list}" var="list" varStatus="status">
	<c:out value="${list.ctime}"/>
	<c:out value="${list.location}"/>
	<c:out value="${list.charge}"/>
	<c:out value="${list.target}"/>
	<hr />
</c:forEach>
</body>
</html>