<%@page import="_03_board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_bWritePro</title>
</head>
<body>
	
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="board" class="_03_board.Board">		
		<jsp:setProperty name="board" property="*"/>
	</jsp:useBean>
	<% 
		
		BoardDao.getInstance().insertBoard(board);
		response.sendRedirect("04_bList.jsp");
	%>
</body>
</html>