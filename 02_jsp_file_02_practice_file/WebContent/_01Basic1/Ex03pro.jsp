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
	 
         	String com = request.getParameter("com");
			String me = request.getParameter("input");
			String result = "";
			if (com.equals(me)) {
				result = "비겼다";
			} else if (me.equals("가위")) {
				result = "내가 졌다.";
			} else if (me.equals("보")) {
				result = "내가 이겼다";
			} else {
				result = " [오류] 잘못된 입력값입니다  ";
			}
	%>

	<%=com%>:<%=me%>
	<h2>결과는?<%=result%></h2>
	

</body>
</html>