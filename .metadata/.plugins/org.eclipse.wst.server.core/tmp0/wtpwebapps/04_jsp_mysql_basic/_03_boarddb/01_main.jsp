
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
	create database boardDB03;
	use boardDB03;
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

<body>
		
	<h2>메인페이지</h2>
	<p><a href="02_bWrite.jsp">게시판 글쓰기</a>
	<p><a href="04_bList.jsp">전체 게시판 보기</a>
</body>
</html>