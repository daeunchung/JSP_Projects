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
[학생성적관리 프로그램]

1. arr배열에 1~100점 사이의 정수를 5개 저장
예   1) 87, 11, 92, 14, 47
		
2. 전교생의 총점과 평균 출력
예   2) 총점(251) 평균(50.2)
		
3. 성적이 60점 이상이면 합격. 합격생 수 출력
예   3) 2명

4. 성적이 제일 높은 점수 출력 
예 4) 92 
</pre>
<h4> 문제 1 번 </h4>
<%
int[] arr = new int[5];
Random rd = new Random(); 

int score = 0;

for(int i =0; i<arr.length;i++){
	int rdNum = rd.nextInt(100)+1; 
	arr[i]= rdNum;
	out.print(arr[i] + " ");
}

%>
<h4> 문제 2 번 </h4>
<%
for(int i =0; i<arr.length;i++){
	score+=arr[i];
}

double avg =(double)score / arr.length; 
out.println(" 총점은 " + score + "  평균은 " + avg );
%>
<h4> 문제 3 번 </h4>
<%
int cnt = 0;
for(int i=0; i<5; i++) {
	if(arr[i] >= 60) {
		cnt = cnt + 1;
	}
}
out.println("합격생 수 = " + cnt + "명");

%>
<h4> 문제 4 번 </h4>
<%
int maxScore = 0;
for(int i=0; i<arr.length; i++) {
	if(maxScore < arr[i]) {
		maxScore =arr[i];
	}
}
out.println("최고 점수는 = " + maxScore + "점");

%>
</body>
</html>