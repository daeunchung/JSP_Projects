<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문</title>
</head>
<body>
<h2>반복문</h2>
	<%
	   int  i = 0;	
	   while( i<10){ %>
		    <%= i %>
		    <br>
			<%  i++;
		}%>
</body>
</html>