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
  # 랜덤학생
  1. 10회 반복을 한다.
  2. 1~100 사이의 랜덤 숫자를 저장한다.(학생의 성적)
  3. 성적이 60점 이상이면 합격생이다.
  ---------------------------------------
  . 전교생(10명)의 총점과 평균을 출력한다.
  . 합격자 수를 출력한다.
  . 1등 학생의 번호와 성적을 출력한다.
 
</pre>
<%
Random rd = new Random(); 
int[] stuNo = new int[10];
int pass = 0; 
int total=0; 
int maxScore =0;
int maxIdx=0; 
for(int i =0; i<10;i++){
	int score = rd.nextInt(100)+1;
	 stuNo[i]=score; 
	 total+=stuNo[i];
	 if(stuNo[i] >= 60){
		 pass++; 
	 }
	 if(maxScore < stuNo[i]){
		 maxScore = stuNo[i];
		 maxIdx = i; 
	 }
	 
	 out.println( "학번 : " + (i+1) +" 학생 성적 "+ stuNo[i] + "<br>");
}

%>

<br>
<h4> 전체 학생 점수 총점 : <%=total %> 전체 평균 :  <%=(double)total/10 %> </h4>
<h4> 합격자 수 : <%=pass %></h4>
<h4> 1등 학생 번호  <%=maxIdx+1 %> 점수 : <%= maxScore%> </h4>
<button onclick="location.href='basic10.jsp'"> 재시작 </button>
</body>
</html>