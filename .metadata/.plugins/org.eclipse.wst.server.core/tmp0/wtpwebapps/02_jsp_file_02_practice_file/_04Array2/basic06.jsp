<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<pre>
 # 당첨복권[1단계] 30%의 당첨확률의 당첨 복권을 만드세요 
</pre>
<%
  Random rd = new Random(); 
  String result =request.getParameter("result");
  if(result!=null){
  int rdNum = rd.nextInt(10);
  if(rdNum < 3) {
	result="당첨";
    }
   if(rdNum >= 3) {
	result="꽝";
     }
   
    out.println("복권 결과 = " + result);
  }else{
%>
  <button onclick="location.href='basic06.jsp?result=<%=result%>'"> 당첨 확인 </button>

<%} %>
</body>
</html>