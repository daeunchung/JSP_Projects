<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Response내장객체- 리다이렉트 예제</h2>
	
	     현재 페이지는 <b>response.jsp</b> 페이지입니다.
	
	  <%
	    response.sendRedirect("07_sendRedirect.jsp");
	  %>
</body>
</html>