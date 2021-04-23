<%@page import="board.Board"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>05_board_info.jsp</title>
	</head>
	<body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			Board board = BoardDAO.getInstance().getOneBoard(num);
		%>
		<div align="center">
			<h2>게시글 보기</h2>
			<table border="1">
				<tr height="40">
					<td align="center" width="120">글번호</td>
					<td align="center" width="180"><%= board.getNum() %></td>
					<td align="center" width="120">조회수</td>
					<td align="center" width="180"><%= board.getReadcount() %></td>
				</tr>
				<tr height="40">
					<td align="center" width="120">작성자</td>
					<td align="center" width="180"><%= board.getWriter() %></td>
					<td align="center" width="120">작성일</td>
					<td align="center" width="180"><%= board.getRegDate() %></td>
				</tr>
				<tr height="40">
					<td align="center" width="120">이메일</td>
					<td align="center" colspan="3"><%= board.getEmail() %></td>
				</tr>
				<tr height="40">
					<td align="center" width="120">제목</td>
					<td align="center" colspan="3"><%= board.getSubject() %></td>
				</tr>
				<tr height="40">
					<td align="center" width="120">글 내용</td>
					<td align="center" colspan="3"><%= board.getContent() %></td>
				</tr>
				<tr height="40">
					<td align="center" colspan="4">
						<input type="button" value="답글쓰기" onclick="location.href='10_board_reWrite.jsp?num=<%= num %>'" />
						<input type="button" value="수정하기" onclick="location.href='06_board_update.jsp?num=<%= num %>'" />
						<input type="button" value="삭제하기" onclick="location.href='08_board_delete.jsp?num=<%= num %>'" />
						<input type="button" value="목록보기" onclick="location.href='04_board_list.jsp'" />
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>











