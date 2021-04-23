
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import 속성</title>
</head>
<body>
	 <h2>import 속성</h2>
	 <%
	 	Random ran = new Random();
	    //배열의 초기화 블럭을 사용하면 배열의 선언, 메모리할당,초기값 설정을 한 번에 할 수 있다.
	    String[] str = {"JSP","JAVA","Android","HTML5"};
	    int i = ran.nextInt(4);
	  %>	
	<br><br>	
	<%=str[i] %> 가(이) 재미있다. <%=str[i] %> 가(이) 재미있다.
</body>
</html>