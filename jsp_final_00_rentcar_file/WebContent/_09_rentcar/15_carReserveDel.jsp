<%@page import="_09_rentcar.RentcarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String id = request.getParameter("id");
		String rday = request.getParameter("rday");
	
		// 예약삭제 메소드 호출
		RentcarDao.instance.carRemoveReserve(id, rday);
		response.sendRedirect("01_main.jsp");
	%>
</body>
</html>