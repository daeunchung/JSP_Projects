<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<h2></h2>
<pre>구구단 게임[1단계]
1. 구구단 문제를 출제하기 위해, 숫자 2개를 입력받는다.
2. 입력받은 숫자의 정답을 정답 칸에 적는다 
3. 문제에 해당하는 정답을 입력받는다.
4. 모든 값을 Ex05pro.jsp 에서 처리하고 
      정답을 비교 "정답" 또는 "땡"을 출력한다.

</pre>

<form action="Ex05pro.jsp">
	<table>
		<tr>
			<td colspan="3">숫자 1 * 숫자 2 = 정답</td>
		</tr>
		<tr>
			<td><input type="number" name="num1"></td>
			<td>&nbsp;&nbsp; * &nbsp;&nbsp;</td>
			<td><input type="number" name="num2"></td>
			<td>&nbsp;&nbsp; = &nbsp; <input type="text" name="answer">

			</td>
		</tr>
	</table>
	<input type="submit" value="확인">


</form>
</body>
</html>