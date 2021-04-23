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
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int score = 0;
		int count = 0;
		if (session.getAttribute("count") != null) {
			count = (int) session.getAttribute("count");
			score=(int)session.getAttribute("score");
		}

		int answer = Integer.parseInt(request.getParameter("answer"));
		String result = "";
		if (answer == (num1 * num2)) {
			score++;
			result = "정답";
		} else {
			result = "오답";
		}

		count++;

		session.setAttribute("count", count);
		session.setAttribute("score", score);
	%>
	<h2><%=result%></h2>
	<button onclick="location.href='Ex02.jsp'">뒤로가기</button>

</body>
</html>