<%@page import="_05_user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%		
		String id= request.getParameter("id");
		String passwd= request.getParameter("passwd");
		boolean check = UserDao.instance.checkUserIdPw(id, passwd);
		System.out.println(check);
		if(check == true){
			UserDao.instance.deleteUserId(id);
			session.removeAttribute("log");
			%>
			<script>
				alert("탈퇴되었습니다. ");			
				location.href="01_main.jsp";
			</script>
			<% 
		}else{
			%>
			<script>
				alert("아이디나 비밀번호를 확인하세요. ");
			</script>
			<% 
		}
	%>
</body>
</html>