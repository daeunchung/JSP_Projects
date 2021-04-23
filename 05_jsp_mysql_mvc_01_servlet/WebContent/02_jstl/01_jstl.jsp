<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>JSTL core 태그예제 - set, out, remove</h3>
<p>browser변수값 설정
<c:set var="browser" value="${header['User-Agent']}"/><br>
<c:out value="${browser}"/><p>

<p>browser변수값 제거 후
<c:remove var="browser"/>
<c:out value="${browser}"/>