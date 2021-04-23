<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_boardWrite</title>
</head>
<%
    String bodyback_c="#FFF0B5";
	String value_c="#FFE271";
%>
<body bgcolor="<%=bodyback_c%>"  >


<div align="center">
		<h2> 게시글 쓰기 </h2>
		<form action="03_bWritePro.jsp" method="post">
			<table border="1">
				<tr height="40">
					<td align="center" width="150" bgcolor="<%=value_c%>"> 작성자 </td>
					<td width="450"> <input type="text" name="writer" size="20" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" bgcolor="<%=value_c%>"> 제목 </td>
					<td width="450"> <input type="text" name="subject" size="60" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" bgcolor="<%=value_c%>"> 이메일 </td>
					<td width="450"> <input type="email" name="email" size="60" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" bgcolor="<%=value_c%>"> 비밀번호 </td>
					<td width="450"> <input type="password" name="password" size="10" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" bgcolor="<%=value_c%>"> 글내용 </td>
					<td width="450"> <textarea rows="10" cols="50" name="content"></textarea> </td>
				</tr>
				<tr height="40">
					<td align="center" colspan="2" bgcolor="<%=value_c%>">
						<input type="submit" value="글쓰기" /> &nbsp;&nbsp;
						<input type="reset" value="다시작성" /> &nbsp;&nbsp; 
						<input type="button"  onclick="location.href='04_bList.jsp'" value="전체게시글보기"> 
					</td>				
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>