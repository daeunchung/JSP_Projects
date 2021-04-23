<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<pre>
홀짝 맞추는 게임! 
컴퓨터에게 1- 10 사이의 랜덤 숫자를 받아서 그 값이 
홀수 인지 짝수인지 버튼을 만들어서 정답을 맟출때까지 반복 
정답을 맞추면 반복한 횟수를 출력 
</pre>

<%

 Random rd = new Random();
 

int count=0;
int answer=0; 
int win =0;
 if(request.getParameter("count")!=null){
	 count = Integer.parseInt(request.getParameter("count"));	 
	 answer = Integer.parseInt(request.getParameter("answer"));	;
    int myAnswer = Integer.parseInt(request.getParameter("myAnswer"));

      if(myAnswer==answer){
    	  win = 1;
      }
 }
 if(win == 0){
	  int rdNum = rd.nextInt(10)+1; 
	  count++;
	 if(rdNum%2==1){
		 answer=1;
	 }else if(rdNum%2==0){
		 answer=2;
	 }
	 %>
	 <h2> 홀수일까요? 짝수일까요? <%=rdNum %></h2>
	 <button onclick="location.href='basic02.jsp?count=<%=count %>&answer=<%=answer %>&myAnswer=1'"> 홀수  </button>
<button onclick="location.href='basic02.jsp?count=<%=count %>&answer=<%=answer %>&myAnswer=2'"> 짝수  </button>
<% 
 }else if(win == 1){
	 %>
	    <h2> 맞췄다! 게임종료 총 게임 횟수 : <%=count %></h2>
	    <button onclick="location.href='basic02.jsp'"> 리셋 </button>
	 <%
 }
%>



</body>
</html>