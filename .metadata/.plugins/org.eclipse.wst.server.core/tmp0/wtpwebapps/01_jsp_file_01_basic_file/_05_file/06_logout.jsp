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
		session.removeAttribute("log");
		session.invalidate();
	%>
		<script>
			alert("로그아웃.");
			location.href="01_main.jsp";
		</script>
	
</body>
</html>