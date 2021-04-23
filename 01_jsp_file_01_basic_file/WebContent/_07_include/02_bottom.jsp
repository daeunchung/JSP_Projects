<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  String name = request.getParameter("name");
%>
포함되는 페이지 includedTest.jsp 입니다.<p>
<b><%=name%></b> 님 오셨구려..
<hr>