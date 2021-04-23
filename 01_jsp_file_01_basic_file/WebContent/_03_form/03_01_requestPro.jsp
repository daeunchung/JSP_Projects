<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");%>
	<%
	  String name = request.getParameter("name");
	  int age = Integer.parseInt(request.getParameter("age"));	  
	  if (age >= 20){ //나이가 20세 이상일 경우
		out.println("<b>"+ name + " </b> 님의 나이는 20세 이상입니다.");
	  }else{//나이가 20세 미만일 경우
		out.println("<b>"+ name + " </b> 님은 미성년입니다.");
	  }
	%>
</body>
</html>