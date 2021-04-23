<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int k = 3;
		out.println("i = " + k);
		request.setAttribute("i", k);
	%>
	
	<p>
	k = <%=k > 4%>
	<p>
	i = ${i > 4}
	
	
</body>
</html>