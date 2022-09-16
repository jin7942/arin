<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">

<%-- <input type="hidden" name="shDelNy" value="<c:out value="${vo.shDelNy}"/>"/> --%>
<%-- <input type="hidden" name="shOptionDate" value="<c:out value="${vo.shOptionDate}"/>"/> --%>

<input type="hidden" name="shStartDate" value="<c:out value="${vo.shStartDate}"/>"/>
<input type="hidden" name="shEndDate" value="<c:out value="${vo.shEndDate}"/>"/>

<input type="hidden" name="shOptionValue" value="<c:out value="${vo.shOptionValue}"/>"/>
<input type="hidden" name="shValue" value="<c:out value="${vo.shValue}"/>"/>

<input type="hidden" name="mainKey" value="<c:out value="${vo.mainKey}"/>"/>