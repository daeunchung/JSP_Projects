<%@page import="_05_user.UserDao"%>
<%@page import="_05_user.User"%>
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
		request.setCharacterEncoding("utf-8");
	%>

<h2>로그인처리페이지</h2>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean check = UserDao.instance.checkUserIdPw(id , pw);
	%>
	<%
		if(check){
			session.setAttribute("log", id);
			session.setMaxInactiveInterval(1*60) ; // 1min			
	%>
			<script>
				alert('로그인이 되었습니다.');
				location.href="01_main.jsp";
			</script>
	<% 
		}else {
	%>
			<script>
				alert('아이디와 패스워드를 확인해주세요.');
				location.href="04_login.jsp";
				
			</script>
	<%	} %>				
</body>
</html>