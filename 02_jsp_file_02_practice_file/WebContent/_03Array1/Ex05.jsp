<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<pre> 값교체
 
        int[] arr = {10, 20, 30, 40, 50};
		int[] hakbuns = {1001, 1002, 1003, 1004, 1005};
		int[] scores  = {  87,   11,   45,   98,   23};
		쿼리스트링을 이용해서 문제 1을 풀면 문제2고 문제2 풀면 문제 3 나오게 하기  </pre>

	<%
		int[] arr = { 10, 20, 30, 40, 50 };
		int[] hakbuns = { 1001, 1002, 1003, 1004, 1005 };
		int[] scores = { 87, 11, 45, 98, 23 };

		int question = 0;
		if (request.getParameter("question") == null) {
			question = 1;
		} else {
			question = Integer.parseInt(request.getParameter("question"));
		}
		if (question == 1) {
	%>
	<pre>
		 문제 1) 인덱스 2개를 입력받아 값 교체하기
		 예    1) 인덱스1 입력 : 1
		               인덱스2 입력 : 3
			   {10, 40, 30, 20, 50}
	
	</pre>
	<form action="Ex05Pro.jsp">
		<p>
			문제
			<%=question%>
			) 인덱스 2개를 입력받아 값 교체하기
		</p>
		<input type="hidden" name=question value="<%=question%>"> 인덱스 1
		: <input type="number" name="num1"> 인덱스 2 : <input
			type="number" name="num2"> <input type="submit"
			value="문제 <%=question%>">
	</form>
	<%
		}

		else if (question == 2) {
	%>
	<pre>
		 문제 2) 값 2개를 입력받아 값 교체하기
	 	 예    2) 값1 입력 : 40
		               값2 입력 : 20
		       {10, 20, 30, 40, 50}
		</pre>
	<form action="Ex05Pro.jsp">
		<p>
			문제
			<%=question%>
			) 값 2개를 입력받아 값 교체하기
		</p>
		<input type="hidden" name=question value="<%=question%>"> 값 1 :<input
			type="number" name="num1"> 값 2 :<input type="number"
			name="num2"> <input type="submit" value="문제  <%=question%>">
	</form>
	<%
		}

		else if (question == 3) {
	%>
	<pre> 문제 3) 학번 2개를 입력받아 성적 교체하기
		     예    3) 학번1 입력 : 1002
		                 학번2 입력 : 1003
			     {87, 45, 11, 98, 23}</pre>
	<form action="Ex05Pro.jsp">
		<p>
			문제
			<%=question%>
			) 학번 2개를 입력받아 성적 교체하기
		</p>
		<input type="hidden" name=question value="<%=question%>"> 학번 1:
		<input type="number" name="num1"> 학번 2: <input type="number"
			name="num2"> <input type="submit" value="문제 <%=question%>">
	</form>
	<%
		}
		if (question > 3) {
	%>
	<h2>모든 문제 다 풀었습니다</h2>
	<%
		}
	%>


</body>
</html>