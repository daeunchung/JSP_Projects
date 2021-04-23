<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>JSTL core 태그예제 - if </h3>
<c:set var="country" value="${'Korea'}"/>
<c:if test="${country != null}">
  국가명: <c:out value="${country}"/><br>
</c:if>


<p><c:out value="${country}"/>의 겨울은 춥다.


