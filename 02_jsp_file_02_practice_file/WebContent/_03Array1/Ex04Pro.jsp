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
<% 
int[] seat;
int count =0;
 if(session.getAttribute("count")==null){
	  seat = new int[7];
	 
 }else{
  seat = (int[])session.getAttribute("seat"); 
  count = (int)session.getAttribute("count");
  }
 
  int seatNum = Integer.parseInt(request.getParameter("seatNum")); 
     seatNum--;
   if(seat[seatNum]==0){
	   seat[seatNum]=1;
	   seatNum++;
	   count++;
	   session.setAttribute("seat", seat);
	   session.setAttribute("count", count);
	   %>
	   <script>
	   alert(<%=seatNum%> +'번 좌석이 예매되었습니다 ');
	   location.href='Ex04.jsp';
	   </script>
	   <%
	      
   }else{
	   %>
	   <script>
	   alert('이미 애매된 좌석입니다 다시 선택해주세요 ');
	   location.href='Ex04.jsp';
	   </script>
	   
	   <%
   }

%>

</body>
</html>