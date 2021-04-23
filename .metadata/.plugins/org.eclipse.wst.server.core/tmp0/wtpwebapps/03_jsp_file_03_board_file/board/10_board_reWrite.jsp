<%@page import="board.BoardDAO"%>
<%@page import="board.Board"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>10_board_reWrite.jsp</title>
	</head>
	<body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
		
			Board board = BoardDAO.getInstance().getOneUpdateBoard(num);
			
			int ref = board.getRef();
			int reStep = board.getReStep();
			int reLevel = board.getReLevel();
		%>
		<div align="center">
			<h2>답변글 입력하기</h2>
			<form method="post" action="11_board_reWritePro.jsp">
				<table border="1">
					<tr height="40">
						<td width="150" align="center">작성자</td>
						<td width="450">
							<input type="text" name="writer" size="60" />
						</td>
					</tr>
					<tr height="40">
						<td width="150" align="center">제목</td>
						<td width="450">
							<input type="text" name="subject" value="[답변]" size="60">
						</td>
					</tr>
					<tr height="40">
						<td width="150" align="center">이메일</td>
						<td width="450">
							<input type="email" name="email" size="60">
						</td>
					</tr>
					<tr height="40">
						<td width="150" align="center">비밀번호</td>
						<td width="450">
							<input type="password" name="password" size="60">
						</td>
					</tr>
					<tr height="40">
						<td width="150" align="center">글내용</td>
						<td width="450"><textarea rows="10" cols="60" name="content"></textarea></td>
					</tr>
					<tr height="40">
						<td align="center" colspan="2">
							<input type="hidden" name="num" value="<%= num %>" />
							<input type="hidden" name="ref" value="<%= ref %>" />
							<input type="hidden" name="reStep" value="<%= reStep %>" />
							<input type="hidden" name="reLevel" value="<%= reLevel %>" />
							<input type="submit" value="답글쓰기완료" />&nbsp;&nbsp;
							<input type="reset" value="취소" />
							<input type="button" value="목록보기" onclick="location.href='04_board_list.jsp'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>











