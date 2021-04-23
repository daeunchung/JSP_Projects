<%@page import="_02_login.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");%>
	<%
	    String id = request.getParameter("id");
		String passwd  = request.getParameter("passwd");
		String saveid = request.getParameter("saveid");
		
		int check= MemberDao.getInstance().userCheck(id,passwd);
		if(check==1){
			session.setAttribute("log" , id);
			session.setMaxInactiveInterval(5) ; // 1min	
			
		if(saveid!=null &&  saveid.equals("on")){
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(20*60);
			response.addCookie(cookie);
		}else{
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		response.sendRedirect("00_cookieMain.jsp");
	}else if(check==0){%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
	<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
	<%}	%>

</body>
</html>