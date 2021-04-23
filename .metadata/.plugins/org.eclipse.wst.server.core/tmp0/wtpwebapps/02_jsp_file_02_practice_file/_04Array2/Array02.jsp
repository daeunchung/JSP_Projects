<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<pre>
이차원 반복문 with 테이블 

for(int i=0; i<4; i++) {
			for(int j=0; j<3; j++) {
				System.out.println("[i] = " + i + " [j] = " + j);
			}
		}
		
		문제) 구구단 출력
		
		  === 2단 ===
		  2 X 1 = 2
		  2 X 2 = 4
		  2 X 3 = 6
		  2 X 4 = 8
		  2 X 5 = 10
		  2 X 6 = 12
		  2 X 7 = 14
		  2 X 8 = 16
		  2 X 9 = 18
		  === 3단 ===
		  3 X 1 = 3
		  3 X 2 = 6
		  ...
		  ...

</pre>
<table>
<tr>
<%
for(int i=2; i<=9; i++) {
	%><td>=== <%=i %>단 ===
	<%
	for(int j=1; j<=9; j++) {	 
%>
	<br>
     <%=i %>  X  <%=j %> =  <%=i*j %>
<%
	}
	%>
	</td>
	<%	
}

%>
</tr>
</table>

</body>
</html>