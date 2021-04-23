<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>01_board_main.jsp</title>
	</head>
	<body>
		<%
			// 웹 어플리케이션 루트에 대한 로컬상의 실제 경로를 얻는다.
			String path = application.getRealPath("/");
			BoardDAO.getInstance().filePath = path;
			System.out.println("메모장의 실제 위치 = " + path);
			
			BoardDAO.getInstance().loadData();
			BoardDAO.getInstance().sortBoard();
		%>
	
		<h2>메인 페이지</h2>
		<p><a href="02_board_write.jsp">게시판 글쓰기</a></p>
		<p><a href="04_board_list.jsp">전체 게시판 보기</a></p>
	</body>
</html>