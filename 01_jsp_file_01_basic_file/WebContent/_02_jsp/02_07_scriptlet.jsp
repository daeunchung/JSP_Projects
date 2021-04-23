

<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import 속성</title>
</head>
<body>
	 <h2>반복문</h2>
	 <%
		   String strArray[] = {"JAVA","JSP","Android","HTML5"};
		 
		   for(int i=0; i<strArray.length;i++){ %>
		  		 <%=strArray[i] + "<br>" %>    
	<% }%>
  	 
</body>
</html>