<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입폼</h2>
    
  <form method="post" action="02_insertPro.jsp">
      아이디: <input type="text" name="id" maxlength="50"><br>
      패스워드: <input type="password" name="passwd" maxlength="16"><br>
      이름: <input type="text" name="name" maxlength="10"><br>
      <input type="submit" value="회원가입">
      <input type="reset" value="다시입력">
  </form>
</body>
</html>