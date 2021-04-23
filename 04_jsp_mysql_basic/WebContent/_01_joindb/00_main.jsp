<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
	create database joindb01;
	use joindb01;
	create table member(
		id varchar(20),
	    passwd varchar(20),
	    name varchar(20),
		joindate datetime
	);
	select * from member;
 --%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><a href="01_insert.jsp">회원가입</a></p> <br>
	<p><a href="03_delete.jsp">회원삭제</a></p> <br>
	<p><a href="05_update.jsp">회원수정</a></p> <br>
</body>
</html>