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
  # 가운데 숫자 맞추기 게임
  1. 150~250 사이의 랜덤 숫자 저장
  2. 랜덤 숫자의 가운데 숫자를 맞추는 게임이다.
  예)
		249		: 4

  3. 정답을 맞추면 다시 새로운 랜덤 숫자로 맞추는 게임 
</pre>

<%
  Random rd = new Random(); 
 int game;
  if(request.getParameter("num")!=null){
	  game= Integer.parseInt(request.getParameter("game"));
	  int answer = game%100/10;
	  int num = Integer.parseInt(request.getParameter("num"));
	  
	  if(answer==num){
		  out.print("<h2> 퀴즈 "+ game +" 정답 맞췄다! </h2>");
		  game = rd.nextInt(101)+150;
	  }else{
		  out.print("<h2> 퀴즈 "+ game +" 틀렸다! 정답은 : "+ answer + " </h2>"); 
	  }
	  
  }else{
	  game = rd.nextInt(101)+150;
	  
  }
  out.println("<h2>" + game + " 의 가운데 숫자는?</h2>");
  for(int i =0; i< 10; i++){
%>


<button onclick="location.href='basic07.jsp?game=<%=game%>&num=<%=i%>'"> <%=i %></button> &nbsp;&nbsp;
<%} %>
</body>
</html>