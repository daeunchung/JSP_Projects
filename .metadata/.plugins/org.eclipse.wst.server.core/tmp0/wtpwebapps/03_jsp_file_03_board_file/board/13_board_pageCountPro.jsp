<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>13_board_pageCountPro.jsp</title>
	</head>
	<body>
		<%
			String pageSize = request.getParameter("pageSize");
		
			session.setAttribute("pageSize", pageSize);
		
			response.sendRedirect("04_board_list.jsp");
		%>
	</body>
</html>