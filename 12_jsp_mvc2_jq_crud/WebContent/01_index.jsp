<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="style.css"/>
<script src="jquery-1.11.0.min.js"></script>


<body>
	<div id="main_image" class="box">
	  <img class="noborder" id="logo" src="mollahalf.png"/>
	</div>
	<div id="main_auth" class="box">
		<jsp:include page="02_loginForm.jsp"/>
	</div>
</body>
<%-- 
==================================================================================
	<Resource auth="Container"
			driverClassName="com.mysql.cj.jdbc.Driver" loginTimeout="10"
			maxWait="5000" name="jdbc/pool" password="root"
			type="javax.sql.DataSource"
			url="jdbc:mysql://localhost:3306/jspjs02join?serverTimezone=UTC"
			username="root" />		
==================================================================================
create database jspjs02join;
use jspjs02join;

create table member(
	id varchar(20),
    passwd varchar(20),
    name varchar(20),
    reg_date datetime,
    address varchar(20),
    tel varchar(20)
);
select * from member;
==================================================================================
			
--%>