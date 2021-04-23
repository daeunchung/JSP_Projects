<%-- 23_cartListDel.jsp --%>
<%@page import="_05_bookstore.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	String list = request.getParameter("list");
	String buyer = (String)session.getAttribute("id");
	String book_kind = request.getParameter("book_kind");
	
	if(buyer == null){
		response.sendRedirect("00_shopMain.jsp");
	}else{
		CartDAO bookDAO = CartDAO.getInstance();
		
		if(list.equals("all")){
			bookDAO.deleteAll(buyer);
		}else{
			bookDAO.deleteList(Integer.parseInt(list));
		}
		
		response.sendRedirect("19_cartList.jsp?book_kind=" + book_kind);
	}
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>장바구니 비우기</title>
	</head>
	<body>
	
	</body>
</html>