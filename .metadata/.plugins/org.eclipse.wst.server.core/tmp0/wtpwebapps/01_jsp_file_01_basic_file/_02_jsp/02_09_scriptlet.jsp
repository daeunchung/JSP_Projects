<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2차원반복문</title>
</head>
<body>
	<h2>차원반복문</h2>
	<%
		int k = 4;
	   	for(int i = 0; i < 5; i++){
	   		for(int n = k; n > 0; n--){ %>
	   			&nbsp;
	   		<% }
			for(int n = 0; n < i + 1; n++){ %>
	   			*
	   		<% } %>
			<br>
	   <% k--;
	   }%>
</body>
</html>