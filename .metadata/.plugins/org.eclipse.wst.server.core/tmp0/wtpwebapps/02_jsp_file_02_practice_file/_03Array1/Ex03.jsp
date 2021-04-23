<%@page import="java.util.Random"%>
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
 # OMR카드
1. 배열 answer는 시험문제의 정답지이다.
2. 배열 hgd에 1~5 사이의 랜덤 숫자 5개를 저장한다.
3. answer와 hgd 값을 비교해 정오표를 출력한다.
4. 한 문제당 20점이다.
예)
answer = {1, 3, 4, 2, 5}
hgd    = {1, 1, 4, 4, 3}
정오표     = {O, X, O, X, X}
성적        = 40점
</pre>
	<%
		int[] answer = { 1, 3, 4, 2, 5 };
		int[] hgd = new int[5];
		String[] result = new String[hgd.length];
		int score = 0;
		//2번 
         out.println("answer = ");
		for(int i =0; i < 5; i++){
			out.print(answer[i] + " ");
		}

		Random rd = new Random();
      out.println("<br>"+"hgd =&nbsp; &nbsp; &nbsp;"); 
		for (int i = 0; i < hgd.length; i++) {
			int rdnum = rd.nextInt(5) + 1;
			hgd[i] = rdnum;
			out.print(hgd[i] + " ");
		}
		//3번 
		for (int i = 0; i < hgd.length; i++) {
			if (answer[i] == hgd[i]) {
				result[i] = "O";
				//4번 
				score += 20;
			} else {
				result[i] = "X";
			}
		}

		out.println("<br>"+ " 정오표=");

		for (int i = 0; i < hgd.length; i++) {
			
			out.print(result[i] + " ");
		}
		
	%>
<br>
    <h2> 총점은 <%=score %> 점 입니다. </h2>
</body>
</html>