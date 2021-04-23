<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<pre>
구구단 3단계
	문제 (힌트 랜덤 함수 사용)
    1. 구구단 게임을 5회만 반복한다. 
	2. 한문제의 정답을 맞추면 20점이다.
    3. 게임 종료 후, 성적을 출력한다.
    4. restart 버튼을 만든다. 
    
    세션을 사용해서 점수와 횟수를 저장한다. 
</pre>

	<%
		int count = 0;
		int score = 0;
		if (session.getAttribute("count") == null) {
			out.println("게임 시작 ");
			count = 1;
			score = 0;

		} else {
			count = (int) session.getAttribute("count");
			score = (int) session.getAttribute("score");
		}

		Random rd = new Random();
		int num1 = rd.nextInt(8) + 2;
		int num2 = rd.nextInt(9) + 1;

		out.println("반복한 횟수 : " + count);
		out.println("점수는 : " + (score * 20));

		if (count < 5) {
	%>

	<form action="Ex02Pro.jsp">
		<br>
		<h2>
			<%=num1%>
			*
			<%=num2%>
			= ?
		</h2>

		정답을 입력하세요. <br> <input type="hidden" name="num1" value=<%=num1%>>
		<input type="hidden" name="num2" value=<%=num2%>> <input
			type="number" name="answer"> <br>
		<br> <input type="submit" value="확인">
	</form>

	<%
		} else if (count >= 5) {
			session.invalidate();
			out.println("<h2> 당신의 최종 점수는 " + (score * 20) + "</h2>");
	%>
	<button onclick="location.href='Ex02.jsp'">다시시작하기</button>
	<%
		}
	%>

</body>
</html>