<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2> </h2>
   <%
   int dbId = 1234;
	int dbPw = 1111;
   %>
   
<pre> 문제 
 # 로그인[1단계]
  1. Id와 Pw를 입력받는다.
 2. id와 pw 그리고  dbId , dbPw(hidden 값으로 )의 값 모두를 Ex04pro.jsp에 값 전달한다 
 3.  Ex04pro.jsp 에서 입력받은 데이터와 기존 데이터를 비교해 로그인 처리를 진행한다. 
   예) 로그인 성공  or 로그인 실패
  dbID = 1234;
  dbPw = 1111;
   </pre>

   <h2>로그인</h2>
   <form action="Ex04pro.jsp">
     아이디 : <input type="text" name="id" />
      비밀번호 : <input type="password" name="pw" /> 
   <input type="hidden" name="dbId" value="<%=dbId %>"/>    
    <input type="hidden" name="dbPw" value="<%=dbPw %>"/>  
   <input type="submit" value="로그인" >
   </form>


</body>
</html>