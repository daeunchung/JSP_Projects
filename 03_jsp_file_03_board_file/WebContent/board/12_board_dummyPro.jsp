<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>12_board_dummyPro.jsp</title>
	</head>
	<body>
		<%
			int dummyCount = Integer.parseInt(request.getParameter("dummyCount"));
			
			for(int i=0; i<dummyCount; i++){
				BoardDAO.getInstance().insertDummy();
			}
			
			response.sendRedirect("04_board_list.jsp");
		%>
		
	</body>
</html>