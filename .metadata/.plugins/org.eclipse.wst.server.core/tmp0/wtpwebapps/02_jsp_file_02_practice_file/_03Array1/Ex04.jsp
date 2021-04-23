<%@page import="javax.websocket.Session"%>
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

  # 영화관 좌석예매
  1. 사용자로부터 좌석번호(index)를 입력받아 예매하는 시스템이다.
  2. 예매가 완료되면 해당 좌석 값을 1로 변경한다.
  3. 이미 예매가 완료된 좌석은 재구매할 수 없다.
  4. 모든 좌석이 차면 예외처리와 리셋 버튼을 만든다 
  힌트 : 좌석 배열을 세션으로 만들자! 
  예)
  seat = 0 0 0 0 0 0 0
  
    좌석선택 : 1
  seat = 1 0 0 0 0 0 0
  
     좌석선택 : 3
  seat = 1 0 1 0 0 0 0
  
     좌석선택 : 3
  seat = 1 0 1 0 0 0 0
    이미 예매가 완료된 자리입니다.
  ----------------------
</pre>
<% 
	int cnt =0; 
    int[] seat;
    if(session.getAttribute("seat")==null){
     seat = new int[7];
    }else{
    	  cnt = (int)session.getAttribute("count");
    	  seat = (int[])session.getAttribute("seat"); 
    	  
    	  if(cnt >= seat.length){
    		  %>
    		  <h2> 모든 좌석이 예매되었습니다 </h2>
    		  <br>
    		  <a href="Ex04.jsp"><button onclick=<%session.invalidate();%>> 리셋 </button></a>
    		  
    		  <%
    	  }
    		
    }  
	  for(int i =0; i<seat.length;i++){
		  if(seat[i]==0){ 
		  %>
		  <font size="5" color="green">[ <%=i+1 %> ]</font> &nbsp; 
		   <%
		  }else if(seat[i]==1){
			  
			  %>		  
		 <font size="5" color="red">[  <%=i+1 %> ]</font> &nbsp; 
		   <%
		  }
	  }
	  
	  %>
	    <form action="Ex04Pro.jsp">
		   <input type="number" name="seatNum"> 
		   <input type="submit" value="예매하기">
		  </form>
	  



</body>
</html>