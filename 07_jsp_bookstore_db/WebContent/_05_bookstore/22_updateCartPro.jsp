<%-- 25_updateCartPro.jsp --%>
<%@page import="_05_bookstore.CartDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	String cart_id = request.getParameter("cart_id");
	String buy_count = request.getParameter("buy_count");
	String book_kind = request.getParameter("book_kind");
	
	if(session.getAttribute("id") == null){
		response.sendRedirect("00.shopMain.jsp");
	}else{
		CartDAO bookDAO = CartDAO.getInstance();
		bookDAO.updateCount(Integer.parseInt(cart_id), Integer.parseInt(buy_count));
		
		response.sendRedirect("19_cartList.jsp?book_kind=" + book_kind);
	}
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>장바구니 수정하기</title>
	</head>
	<body>
	
	</body>
</html>