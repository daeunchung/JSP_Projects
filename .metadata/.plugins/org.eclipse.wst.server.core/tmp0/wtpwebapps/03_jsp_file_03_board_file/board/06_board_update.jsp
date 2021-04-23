<%@page import="board.Board"%>
<%@page import="board.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>06_board_update.jsp</title>
	</head>
	<body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			Board board = BoardDAO.getInstance().getOneUpdateBoard(num);
		%>
		<div align="center">
			<h2>게시글 수정</h2>
			<form method="post" action="07_board_updatePro.jsp" >
				<table border="1">
					<tr height="40">
						<td width="120" align="center">작성자</td>
						<td width="180" align="center"><%= board.getWriter() %></td>
						<td width="120" align="center">작성일</td>
						<td width="180" align="center"><%= board.getRegDate() %></td>
					</tr>
					<tr height="40">
						<td width="120" align="center">제목</td>
						<td width="480" colspan="3">
							<input type="text" name="subject" value="<%= board.getSubject() %>" size="60" />
						</td>
					</tr>
					<tr height="40">
						<td width="120" align="center">패스워드</td>
						<td width="480" colspan="3">
							<input type="password" name="password" value="<%= board.getPassword() %>" />
						</td>
					</tr>
					<tr height="40">
						<td width="120" align="center">글내용</td>
						<td width="480" colspan="3"><textarea name="content" rows="10" cols="60"><%= board.getContent() %></textarea></td>
					</tr>
					<tr height="40">
						<td colspan="4" align="center">
							<input type="hidden" name="num" value="<%= num %>" />
							<input type="hidden" name="ref" value="<%= board.getRef() %>" />
							<input type="hidden" name="reStep" value="<%= board.getReStep() %>" />
							<input type="hidden" name="reLevel" value="<%= board.getReLevel() %>" />
							<input type="submit" value="글수정" /> &nbsp;&nbsp;
							<input type="button" value="목록보기" onclick="location.href='04_board_list.jsp'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>