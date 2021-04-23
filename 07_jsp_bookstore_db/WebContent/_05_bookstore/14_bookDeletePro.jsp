<%-- 11_bookDeletePro --%>
<%@page import="_05_bookstore.BookDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	int book_id = Integer.parseInt(request.getParameter("book_id"));
	String book_kind = request.getParameter("book_kind");
	
	BookDAO dao = BookDAO.getInstance();
	dao.deleteBook(book_id);

	response.sendRedirect("10_bookList.jsp?book_kind=" + book_kind);
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>관리자 책 삭제</title>
	</head>
	<body>
	
	</body>
</html>