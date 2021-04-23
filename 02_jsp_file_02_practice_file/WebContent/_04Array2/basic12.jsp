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
  # 최대값 구하기[3단계]
  1. 가장 큰 값을 찾아 입력한다.
  2. 정답이면 해당 값을 0으로 변경한다.
  3. arr배열의 모든 값이 0으로 변경되면 프로그램은 종료된다.
  예)
  11, 87, 42, 100, 24
  입력 : 100
  
  11, 87, 42, 0, 24
  입력 : 87
  
 11, 0, 42, 0, 24
 
</pre>

<%
int[] arr = {11, 87, 42, 100, 24};
int idx;
if(request.getParameter("idx")!=null){
	idx= Integer.parseInt(request.getParameter("idx"));
	arr = (int[])session.getAttribute("arr");
	int maxIdx=0;
	for(int i =0; i< arr.length;i++){
	  if(arr[maxIdx] < arr[i]){
		  maxIdx = i;
	  }
	}
	if(idx == maxIdx){
		arr[idx] = 0; 
		session.setAttribute("arr", arr);
	}else{
		%>
		<script>
		alert("최대값이 아닙니다 ");
		history.go(-1);
		</script>
		<%
	}
	
}else{
	session.setAttribute("arr", arr);
	
}
out.println("<h2> 최대 값을 구하시오 </h2>");
for(int i =0; i< arr.length;i++){
	if(arr[i]!=0){	
%>
<button onclick="location.href='basic12.jsp?idx=<%=i%>'"> <%=arr[i]%> </button>
<%
	}
}
%>


</body>
</html>