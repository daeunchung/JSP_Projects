<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>쿠키 사용 로그인 폼</h2>
    
  <form method="post" action="04_loginPro.jsp">
      아이디: <input type="text" name="id" maxlength="50"><br>
      패스워드: <input type="password" name="passwd" maxlength="16"><br>
      <input type="checkbox" name="saveid">자동로그인<br>
      <input type="submit" value="로그인">
      <input type="button" value="회원가입" 
            onclick="location.href='01_insert.jsp'">
  </form>
</body>
</html>