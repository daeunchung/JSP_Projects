<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 주석 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문</title>
</head>
<body>
	<h1>조건문</h1>
	<%
		//String name = "김철수";
		String name = "이만수";
	%>	
	
	<br><br>
	
	 <% if(name.equals("김철수")) { %>
		김철수 입니다.
	<%}else { %>
		김철수가 아닙니다.
	<%} %>
</body>
</html>