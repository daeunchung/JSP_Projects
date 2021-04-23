<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>main</h2>
    
	<%
	  String log = (String)session.getAttribute("log");	
	  System.out.println(log);
	  try{
		Cookie[] cookies = request.getCookies();
		if(cookies!= null){
		   for(int i=0; i<cookies.length; i++){
	          if(cookies[i].getName().equals("id"))
	        	  log = cookies[i].getValue();	          	
		   }
		   
		}
		if(log == null){
			System.out.println(log);
			response.sendRedirect("03_login.jsp");
		}
	
	  }catch(Exception e){}
	%>
	<b><%= log %></b>님이 로그인 하셨습니다.
	<form method="post" action="05_logout.jsp">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>