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
  # 베스킨라빈스31
  1. p1과 p2가 번갈아가면서 1~3을 입력한다.
  2. br은 p1과 p2의 입력값을 누적해서 저장한다.
  3. br이 31을 넘으면 게임은 종료된다.
  4. 승리자를 출력한다.
  
 예) 
  1턴 : p1(2)	br(2)
  2턴 : p2(1)	br(3)
  3턴 : p1(3)	br(6)
</pre>
<%
int num =0; 
String player ="P1"; 
 if(request.getParameter("num")!=null){
	  num = Integer.parseInt(request.getParameter("num")); 
	  player =  request.getParameter("player"); 
	 
 }
 
 if(num > 30){

	   if(player.equals("P1")){
			 %>
			   <h2> 플레이어 [P2]가 이겼습니다 </h2>
			   <%    
	   }else{
		   %>
		   <h2> 플레이어 [P1]가 이겼습니다 </h2>
		   <%  
	   }  
	   %>
	   <button onclick="location.href='basic08.jsp'"> 리셋 </button>
	   <%
 }else{
%>
   <h2> 현재 숫자는 <%=num%> 플레이어는 <%=player %></h2>
   <% if(player.equals("P1")){
	   %>
	   <button onclick="location.href='basic08.jsp?num=<%=num+1%>&player=P2'"> 1 </button>
	   <button onclick="location.href='basic08.jsp?num=<%=num+2%>&player=P2'"> 2 </button>
	     <button onclick="location.href='basic08.jsp?num=<%=num+3%>&player=P2'"> 3 </button>
	   
 <%  }else if(player.equals("P2")) { %>
  <button onclick="location.href='basic08.jsp?num=<%=num+1%>&player=P1'"> 1 </button>
   <button onclick="location.href='basic08.jsp?num=<%=num+2%>&player=P1'"> 2 </button>
     <button onclick="location.href='basic08.jsp?num=<%=num+3%>&player=P1'"> 3 </button>
<% }
   }%>
</body>
</html>