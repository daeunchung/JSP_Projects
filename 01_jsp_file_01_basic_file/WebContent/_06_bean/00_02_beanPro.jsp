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
<jsp:useBean  id ="bean" class="_06_bean.Bean">
     <jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<h2>자바빈을 사용하는 JSP페이지</h2>

입력된 이름은  <%=bean.getName() %> 입니다.

	

</body>
</html>