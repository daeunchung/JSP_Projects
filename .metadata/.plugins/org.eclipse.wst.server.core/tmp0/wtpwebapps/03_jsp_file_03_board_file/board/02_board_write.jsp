<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>02_board_write.jsp</title>
	</head>
	<body>
		<div align="center">
			<h2>게시글 쓰기</h2>
			<form method="post" action="03_board_writePro.jsp">
				<table border="1">
					<tr height="40">
						<td align="center" width="150">작성자</td>
						<td width="450"><input type="text" name="writer" value="[본문]" size="60" /></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">제목</td>
						<td width="450"><input type="text" name="subject" size="60" /></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">이메일</td>
						<td width="450"><input type="email" name="email" size="60" /></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">비밀번호</td>
						<td width="450"><input type="password" name="password" size="60" /></td>
					</tr>
					<tr height="40">
						<td align="center" width="150">글내용</td>
						<td width="450"><textarea name="content" rows="10" cols="50"></textarea></td>
					</tr>
					<tr height="40">
						<td align="center" width="150" colspan="2">
							<input type="submit" value="글쓰기" /> &nbsp;&nbsp;
							<input type="reset" value="다시작성" /> &nbsp;&nbsp;
							<input type="button" value="전체게시글보기" onclick="location.href='04_board_list.jsp'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>