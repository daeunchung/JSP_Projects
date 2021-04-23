<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
			<c:if test="${ null ne id }">
				${ id }님, 환영합니다.<br><br>
				<a href="logout.do">로그아웃</a><br><br>
				<a href="update.do">회원정보수정</a><br><br>
				<a href="delete.do">탈퇴</a><br><br>
			</c:if>
			
			<c:if test="${ null eq id }">
				<a href="join.do">회원가입</a><br><br>
				<a href="login.do">로그인</a>
			</c:if>
		</div>	
		
		<hr>
		<br><br><br>
		
		<div align="center">
				<a href="apply.do"><img alt="입사지원하기" src="img/applyonline.png"></a>
			</div> 
</body>
</html>
<%--
	---------------------------------------------------------------------------
1. 파일 추가 
2. db생성 
3. server.xml 내용변경
---------------------------------------------------------------------------
commons-collections4-4.1.jar
commons-dbcp2-2.2.0.jar
commons-pool2-2.5.0.jar
jstl-1.2.jar
mysql-connector-java-8.0.15.jar
---------------------------------------------------------------------------


<Resource 
	auth="Container" 
	driverClassName="com.mysql.cj.jdbc.Driver"
	loginTimeout="10" 
	maxWait="5000" 
	name="jdbc/pool" 
	username="root"
	password="root" 
	type="javax.sql.DataSource"
	url="jdbc:mysql://localhost:3306/joinmvcdb04?serverTimezone=UTC" 
	
/>
---------------------------------------------------------------------------
CREATE DATABASE joinmvcdb04;
use joinmvcdb04;

CREATE TABLE member(
    id VARCHAR(20),
    pw VARCHAR(20),
    name VARCHAR(20),
    tel VARCHAR(20),
    email VARCHAR(30),
    field VARCHAR(20),        -- 지원분야
    skill VARCHAR(20),        -- 기술능력
    major VARCHAR(20)        -- 전공분야
);

 --%>

