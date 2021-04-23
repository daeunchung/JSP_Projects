<%@page import="_05_user.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<%
		User user = new User();
		user.id = request.getParameter("id");
		user.pw = request.getParameter("pw");
		user.name = request.getParameter("name");
		Date d = new Date();
		//String str = d.toString();
		//System.out.println("현재날짜 : " + str);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
		//System.out.println("포맷후 현재날짜 : " + sdf.format(d));
		user.reg_date = sdf.format(d);		
		boolean idCheck = UserDao.instance.checkUserId(user);
		
		if(idCheck == true){
			%>
			<script>
				alert("중복아이디입니다. ");
				location.href="02_join.jsp";
			</script>
			<% 
		}else{					
			UserDao.instance.insertUser(user);
		}
	%>
	<script>
		alert("회원가입을 축하합니다.");
		location.href="01_main.jsp";
	</script>
</body>
</html>