<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
button {
	margin: 5px 0;
	padding: 3em 5em;
	font-size: 13px;
}
</style>
</head>
<body>
	<pre>
  # 1 to 50[2단계] : 1 to 18
  1. arr배열에 1~9 사이의 숫자를 저장한다.
  2. shuffle을 통해 숫자를 섞는다.
  3. 사용자는 1부터 순서대로 해당 위치 값을 입력한다.
  4. 정답을 맞추면 해당 값은 0으로 변경되어 모든 값이 0이되면 게임은 종료된다.
</pre>
	<%
Random rd = new Random();
int[] front;
int[] back;
int gameNum = 1;
int idx=0;
if(request.getParameter("idx")==null){
front = new int[9]; 
 back = new int[9]; 
 
 for(int i=0; i<front.length; i++) {
		front[i] = i + 1;
		back[i] = 10 + i;
	}

 for(int i=0; i<1000; i++) {
		int rdNum = rd.nextInt(front.length);
		int temp = front[0];
		front[0] = front[rdNum];
		front[rdNum] = temp;
	}
 
 for(int i=0; i<1000; i++) {
		int rdNum = rd.nextInt(front.length);
		int temp = back[0];
		back[0] = back[rdNum];
		back[rdNum] = temp;
	}

  session.setAttribute("front", front);
  session.setAttribute("back",back);
  session.setAttribute("gameNum",gameNum);
 
}else{
	
	front = (int [])session.getAttribute("front");
	back = (int [])session.getAttribute("back");	
	idx = Integer.parseInt(request.getParameter("idx"));
	gameNum = (int)session.getAttribute("gameNum");
	System.out.println("gameNum = " + gameNum +"   :  idx= " + front[idx] );
	if(gameNum < 18){
		if(front[idx] == gameNum) {
			if(1 <= gameNum && gameNum <= front.length) {
				front[idx] = back[idx];
			}else if(front.length < gameNum && gameNum <= 18) {
				front[idx] = 0;
			}
			gameNum += 1;
			  session.setAttribute("front", front);
			  session.setAttribute("back",back);
			  session.setAttribute("gameNum",gameNum);
		}else{
			%>
	<script>
			alert('오답입니다 다시 클릭해주세요');
			history.go(-1);
			</script>
	<%
		}
		}else{		
			
			%>

	<h2>게임 종료 !!</h2>
	<button
		onclick="<%session.invalidate(); %>location.href='Game1to18.jsp'">리셋</button>
	<br>
	<br>
	<%
		}
}

for(int i =0; i < front.length; i++){

	%>
	<button onclick="location.href='Game1to18.jsp?idx=<%=i%>'"
		<% if(front[i]==0 ){ %> disabled <%  } %>>
		<%=front[i] %>
	</button>
	<%
	if ((i + 1) % 3 == 0) {
	out.println("<br>");
}
	
}
%>

</body>
</html>