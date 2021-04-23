<%@page import="_05_user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>메인페이지</h2>
	<% 	
		UserDao.instance.realpath = application.getRealPath("");
		UserDao.instance.loadData();		
		String log = (String)session.getAttribute("log");		
		if(log != null){%>
			<p><%=log  %> 님, 환영합니다.</p>
			<p><a href="06_logout.jsp">로그아웃</a></p> 	<br>
			<p><a href="07_update.jsp">회원정보수정</a></p> <br>
			<p><a href="09_delete.jsp">회원탈퇴</a></p> 	<br>
	<% }else if(log == null){ %>
			<p><a href="02_join.jsp">회원가입</a></p> 	<br>
			<p><a href="04_login.jsp">로그인</a></p> 	<br>
	<%} %>
</body>
</html>