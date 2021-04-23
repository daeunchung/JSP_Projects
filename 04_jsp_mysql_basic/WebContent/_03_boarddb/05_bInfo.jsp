<%@page import="_03_board.Board"%>
<%@page import="_03_board.BoardDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_bInfo</title>
</head>
<body>
<%
	// 공백 제거 후, 정수형으로 바꿈
	int num = Integer.parseInt(request.getParameter("num"));

	// 데이터 베이스에 접급
	BoardDao bdao = BoardDao.getInstance();
	
	// BoardBean 타입으로하나의 게시글을 리턴
	Board bean = bdao.getOneBoard(num);
	
%>

<div align="center">
	<h2> 게시글 보기 </h2>
	<table border="1">
		<tr height="40">
			<td align="center" width="120"> 글번호 </td>
			<td align="center" width="180"> <%= bean.getNum() %></td>
			<td align="center" width="120"> 조회수 </td>
			<td align="center" width="180"> <%= bean.getReadcount() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 작성자 </td>
			<td align="center" width="180"> <%= bean.getWriter() %></td>
			<td align="center" width="120"> 작성일 </td>
			<td align="center" width="180"> <%= bean.getReg_date() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 이메일 </td>
			<td align="center" colspan="3"> <%= bean.getEmail() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 제목 </td>
			<td align="center" colspan="3"> <%= bean.getSubject() %></td>
		</tr>
		<tr height="80">
			<td align="center" width="120"> 글 내용 </td>
			<td align="center" colspan="3"> <%= bean.getContent() %></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
				
				<input type="button" value="답글쓰기" onclick="location.href='10_bRe.jsp?num=<%= bean.getNum() %>'">
				<input type="button" value="수정하기" onclick="location.href='06_bUpdate.jsp?num=<%= bean.getNum() %>'" >
				<input type="button" value="삭제하기" onclick="location.href='08_bDelete.jsp?num=<%= bean.getNum() %>'" >
				<input type="button" value="목록보기" onclick="location.href='04_bList.jsp'" >
			</td>
		</tr>
	</table>
</div>


</body>
</html>