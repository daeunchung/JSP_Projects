<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 코어 태그를 사용하기 위한 선언문 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- # 변수 선언 
		아래 문장은 request.setAttribute("num", 4);와 같은 문장이다.
	--%>
	<c:set var="num" value="4" />
	
	<c:if test="${num > 3 }">
		실행됨! <br />
	</c:if>
	<c:forEach var="i" begin="1" end="10" step="${ i = i + 1 }">
		점심시간입니다. <br />
	</c:forEach>
	
	
	
	 <h3>문제1. 1~10 출력</h3>
	 <c:forEach var="i" begin="1" end="10">
	 	${ i } &nbsp;
	 </c:forEach>
	 <br>
	 
	  <h3>문제2. 1~10 사이의 짝수만 출력</h3>
	 <c:forEach var="i" begin="1" end="10">
	 	<c:if test="${ i % 2 == 0 }">
	 		${ i } &nbsp;
	 	</c:if>
	 </c:forEach>
	 <br>
	
	 <h3>문제3. 1~10의 합 출력</h3>
	 <c:forEach var="i" begin="1" end="10">
		 <c:set var="sum" value="${ sum = sum + i }" />
	 </c:forEach>
	 ${ sum }
	 <br>
	 
	 <h3>문제4. 1~10의 홀수의 개수 출력</h3>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${ i % 2 == 1 }">
			<c:set var="cnt" value="${ cnt = cnt + 1 }" />
		</c:if>
	</c:forEach>
	${ cnt }
	<br>
</body>
</html>