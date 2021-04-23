<%@page import="_05_user.User"%>
<%@page import="_05_user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

  <h2>user테이블의 레코드 수정</h2>
  <% 
    	String log = (String)session.getAttribute("log");
  		User  user = UserDao.instance.getUserId(log);
  		
   %>
   <h3> 회원정보</h3>
   <%=user.id %><br>
   <%=user.name %>
   <br>
   <br>
  <form method="post" action="08_updatePro.jsp">
     
      패스워드: <input type="password" name="passwd" maxlength="16"><br><br>
      변경할 이름: <input type="text" name="name" maxlength="10"><br><br>
      <input type="hidden" value=<%= user.id %> name="id">
      <input type="submit" value="입력완료">
  </form>
</body>
</html>