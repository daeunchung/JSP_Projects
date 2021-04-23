<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>11_board_reWritePro.jsp</title>
	</head>
	<body>
		<% request.setCharacterEncoding("UTF-8"); %>
		
		<jsp:useBean id="board" class="board.Board">
			<jsp:setProperty name="board" property="*" />
		</jsp:useBean>
		
		<%
			BoardDAO.getInstance().reWriteBoard(board);
			response.sendRedirect("04_board_list.jsp");
		%>
	</body>
</html>