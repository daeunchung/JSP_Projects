<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// form 에서 넘어오온 값을 다시 세션에 저장해야 다른페이지에서도 정보를 사용할수있다.
	
	session.setAttribute("id", id);
	session.setAttribute("passwd", passwd);
	%>
	id 와 passwd 세션속성을 설정하였습니다.<br>
	
	id속성의 값은
	  <%=(String)session.getAttribute("id")%> 이고 <br>
	passwd 속성의 값은 
	  <%=(String)session.getAttribute("passwd")%>입니다.
	</body>
</body>
</html>