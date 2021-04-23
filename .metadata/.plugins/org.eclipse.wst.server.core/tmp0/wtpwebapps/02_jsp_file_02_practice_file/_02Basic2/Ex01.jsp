<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%--
			문제 1) 1부터 10까지 반복해 5~9 출력
			정답 1) 5, 6, 7, 8, 9
		 --%>
		 <%
		 	for(int i=1; i<=10; i++){
		 		if(5 <= i && i <= 9){
		 %>
		 		<%= i %>
		<%		 			
		 		}
		 	}
		%> 
		<br />
		
		<%--
			문제 2) 10부터 1까지 반복해 6~3 거꾸로 출력
			정답 2) 6, 5, 4, 3
		 --%>
		<%
			for(int i=10; i>=1; i--){
				if(3 <= i && i <= 6){
		%>
				<%= i %>
		<%		
				}
			}
		%>
		<br />
		
		<%--
			문제 3) 1부터 10까지 반복해 짝수만 출력
			정답 3) 2, 4, 6, 8, 10
		 --%>
		<%
			for(int i=1; i<=10; i++){
				if(i % 2 == 0){
		%> 
				<%= i %>
		<%					
				}
			}
		%>
		<br />
		 <%--
		 	문제 4) 1부터 5까지의 합 출력
		 	정답 4) 15
		  --%>
		<%
			int tot = 0;
			for(int i=1; i<=5; i++){
				tot += i;
			}
		%>
		<%= tot %>
		<br />
		  
		 <%--
		 	문제 5) 1부터 10까지 반복해 3미만 7이상만 출력
		 	정답 5) 1, 2, 7, 8, 9, 10
		  --%>
		<%
			for(int i=1; i<=10; i++){
				if(7 <= i || i < 3){
		%> 
					<%= i %>
		<%					
				}
			}
		%>
		<br />
		
		 <%--
		 	문제 6) 문제 5번의 조건에 맞는 수들의 합 출력
		 	정답 6) 37
		  --%>
		<%
			tot = 0;
			for(int i=1; i<=10; i++){
				if(7 <= i || i < 3){
					tot += i;
				}
			}
		%>
		<%= tot %>
		<br />
		
		 <%--
		 	문제 7) 문제 5번의 조건에 맞는 수들의 개수 출력
		 	정답 7) 6
		  --%>
		<%
			int cnt = 0;
			for(int i=1; i<=10; i++){
				if(7 <= i || i < 3){
					cnt += 1;				
				}
			}
		%>		  
		<%= cnt %>
		<br />
		
		 <%--
		 	문제 8) 구구단 세로로 출력
		  --%>
		<%
			for(int i=2; i<=9; i++){
				for(int j=1; j<=9; j++){
		%>
					<%= i %> x <%= j %> = <%= i * j %>	<br />
		<%					
				}
		 %>
		 		<br />
		 <%
			}
		 %>
</body>
</html>