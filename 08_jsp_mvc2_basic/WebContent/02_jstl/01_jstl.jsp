<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- [참고사이트] https://hunit.tistory.com/203 -->
<!-- [중요]jstl-1.2.jar  파일 추가 해야한다. -->
<h3>JSTL core 태그예제 - set, out, remove</h3>
<p><p>------------data 변수저장-----------------

<c:set var="data" value="${10}"/><br>
변수 ==> <c:out value='${data}'/><p>
<br>
<br>
<p>------------data 변수값 제거 후----------

<c:remove var="data"/><br>
변수 ==> <c:out value="${data}"/>