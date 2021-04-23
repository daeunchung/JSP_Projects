<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2> 게시글 쓰기 </h2>
		<form action="BoardWriteAction" method="post">
			<table border="1">
				<tr height="40">
					<td align="center" width="150"> 작성자 </td>
					<td width="450"> <input type="text" name="writer" size="60" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150"> 제목 </td>
					<td width="450"> <input type="text" name="subject" size="60" /></td>
				</tr>
				<tr height\="40">
					<td align="center" width="150"> 이메일 </td>
					<td width="450"> <input type="email" name="email" size="60" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150"> 비밀번호 </td>
					<td width="450"> <input type="password" name="password" size="60" /></td>
				</tr>
				<tr height="40">
					<td align="center" width="150"> 글내용 </td>
					<td width="450"> <textarea rows="10" cols="50" name="content"></textarea> </td>
				</tr>
				<tr height="40">
					<td align="center" colspan="2">
						<input type="submit" value="글쓰기" /> &nbsp;&nbsp;
						<input type="reset" value="다시작성" /> &nbsp;&nbsp;
						
					</td>				
				</tr>
			</table>
		</form>
		<p></p>
		<button onclick="location.href='BoardListAction'"> 전체 게시글 보기</button>
	</div>
</body>
</html>

<%--

<Resource 
auth="Container" 
driverClassName="com.mysql.cj.jdbc.Driver" 
maxWait="5000" 
name="jdbc/pool" 
password="root" 
type="javax.sql.DataSource"
url="jdbc:mysql://localhost:3306/boardmvcdb05?serverTimezone=UTC" 
username="root"/>




create table board(
	num int(10),
    writer varchar(20),
    email varchar(20),
    subject varchar(50),
    password varchar(20),
    reg_date date,
    ref int(10),
    re_step int(10),
    re_level int(10),
    readcount int(10),
    content varchar(20)
);
select * from board;

 --%>

