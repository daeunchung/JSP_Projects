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
 *  코인 게임
  1. 0 또는 1의 랜덤 숫자를 저장한다.
  2. 0은 동전의 앞면, 1은 동전의 뒷면이다.
  3. 동전의 앞뒷면을 맞추는 게임이다.
  4. 한번 할때마다  0 또는 1의 랜덤 숫자를 저장한다.
</pre>

<%
 Random rd = new Random(); 
int coin = rd.nextInt(2);
int btn = 2;
String answer="";
if(request.getParameter("btn")!=null){
	btn = Integer.parseInt(request.getParameter("btn")); 	
    coin =  Integer.parseInt(request.getParameter("coin"));
    if(coin == 0){ answer = "앞면";}else{ answer="뒷면";}
    if(btn==coin){
    	out.println("맞췄다!");
    }else{
    	out.println("틀렷다!");
    }
	 coin = rd.nextInt(2);
}else{
	out.println("<h2>동전의 앞면 뒷면을 맞춰보세요! </h2>");
}


%>


<button onclick="location.href='basic05.jsp?btn=0&coin=<%=coin%>'"> 앞면 </button>
<button onclick="location.href='basic05.jsp?btn=1&coin=<%=coin%>'"> 뒷면 </button>

</body>
</html>