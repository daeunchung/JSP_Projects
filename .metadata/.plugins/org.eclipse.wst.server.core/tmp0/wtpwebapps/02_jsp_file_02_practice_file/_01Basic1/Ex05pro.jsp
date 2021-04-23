<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
int num1 = Integer.parseInt(request.getParameter("num1")); 
int num2 = Integer.parseInt(request.getParameter("num2"));
int myAnswer = Integer.parseInt(request.getParameter("answer"));
int answer= num1 * num2;
String result =""; 
if (answer == myAnswer) {
	 result="정답!";
}
if (answer != myAnswer) {
	 result="땡!";
}
if(result.equals("")){ result="오류 ";}

%>
<h2> <%=num1 %> X  <%=num2 %> =  <%=myAnswer %>  </h2>
<h2> 결과  <%=result %> </h2> 
</body>
</html>