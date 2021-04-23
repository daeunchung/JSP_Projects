<%@page import="_02_login.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="_02_login.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
 <jsp:useBean id="member" class="_02_login.Member">
     <jsp:setProperty name="member" property="*"/>
 </jsp:useBean>
 <%
 	// member.setReg_date(new Timestamp(System.currentTimeMillis()));
  	MemberDao.getInstance().insertMember(member);  // 중복아이디체크 만들어볼것
%>
 <jsp:getProperty name="member" property="id" />님 회원가입을 축하합니다.
 <a href="00_cookieMain.jsp">돌아가기 </a>
</body>
</html>