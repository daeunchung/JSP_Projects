<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2> 과락 </h2>
<pre> 문제 
3과목의 평균이 60점 이상이면, 합격 출력 
 단, 어느 한 과목이라도 50점 미만이면, 불합격 출력 
</pre>
<%
int kor = 100;
int eng = 87;
int math = 41;

int total  = kor + eng + math; 
double avg = total / 3.0;
String pass="";
boolean check = avg >= 60 && kor >= 50 && eng >= 50 && math >= 50;

if(check){
	pass = "합격입니다";
}else{
	pass = "불합격입니다";
}

%>

<h2> 결과는 <%=pass %> </h2>

</body>
</html>