<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<pre> 문제 
  # 가위 바위 보 게임[1단계]
  1. com은 '바위' 만 낼 수 있다.
  2. me에게 가위 바위 보 중 한개의 값을 입력받는다.
           그리고 그 값을 Ex03pro.jsp 파일로 넘겨서 
  3. com과 me를 비교해,
   	1) 비겼다.
    2) 내가 이겼다.
	3) 내가 졌다.	
        를  Ex03pro.jsp에서 출력한다. 
</pre>
	<%
		String com = "바위";
	%>
	<form action="Ex03pro.jsp">
		가위 바위 보 중에 한개의 값을 입력 : 
		<input type="text" name="input" /> 
		<input type="hidden" name="com" value="<%=com %>" /> 
		<input type="submit" value="확인" />
	</form>

</body>
</html>