<%-- 24_buyPro.jsp --%>

<%@page import="_05_bookstore.BuyDAO"%>
<%@page import="_05_bookstore.CartDTO"%>
<%@page import="_05_bookstore.CartDAO"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String account = request.getParameter("account");
	String deliveryName = request.getParameter("deliveryName");
	String deliveryTel = request.getParameter("deliveryTel");
	String deliveryAddress = request.getParameter("deliveryAddress");
	String buyer = (String)session.getAttribute("id");
	
	CartDAO cartDAO = CartDAO.getInstance();
	List<CartDTO> cartLists = cartDAO.getCart(buyer);
	
	BuyDAO buyDAO = BuyDAO.getInstance();
	buyDAO.insertBuy(cartLists, buyer, account, deliveryName, deliveryTel, deliveryAddress); 
	
	response.sendRedirect("25_buyList.jsp");
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>도서 구매하기</title>
	</head>
	<body>
	
	</body>
</html>