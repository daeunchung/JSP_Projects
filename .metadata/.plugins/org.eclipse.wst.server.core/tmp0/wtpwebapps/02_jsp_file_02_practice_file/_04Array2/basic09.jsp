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

  # 369게임[2단계]
  1. 1~100까지 반복을 한다. 
  2. 다음을 클릭하면 숫자가 1씩 증가하여 369게임의 결과를 출력한다.
  예) 1 2 짝 4 5 짝 7 8 짝 10 11 12 짝 ...
  예) 33= 짝짝 36= 짝짝 66= 짝짝  이 출력되어야 한다 
 3. 100을 넘으면 다시 원점으로 돌아간다 
</pre>

<%
 int num =0;
 String result="";
 if(request.getParameter("num")!=null){
	
	 num = Integer.parseInt(request.getParameter("num")); 
	 if(num <100){
	 if(num > 10){
		 int n1 = num/10;
		 int n2 = num%10; 

		 if((n1%3==0 && n1>2) || n2%3==0 ){
			 result="짝";
			 if(n1%3==0 && n2%3==0 ){
				 result="짝짝";
		 }
		 }else{
			 result=""+ n1 + n2 +"";
		 }
	 }else{
		 if(num%3==0){
			 result="짝";
		 }else{
			 result="" + num ;
		 }
		 
	 }
	 
	 %>
	 <h2> 숫자 : <%=num%> 결과 <%=result %></h2>
	 <%
 }else{
	 num = 0;
 }
 }
%>
<button onclick="location.href='basic09.jsp?num=<%=num+1 %>'" > 다음 </button>

</body>
</html>