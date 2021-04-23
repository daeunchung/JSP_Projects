<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
  # 배열 컨트롤러[1단계] : 최종
  1) 추가
  2) 삭제
  3) 삽입
  
</pre>

	<button onclick="location.href='Array01.jsp?btn=1'">추가</button>
	<button onclick="location.href='Array01.jsp?btn=2'">삭제</button>
	<button onclick="location.href='Array01.jsp?btn=3'">삽입</button>

	<br>
	<br>
	<%
 
 int[] arr = {0,0,0,0,0};
 int count = 0;

 if(session.getAttribute("count")!=null){
 arr = (int[])(session.getAttribute("arr"));
 count = (int)(session.getAttribute("count"));
 out.println("<h2> 현재 arr 배열  </h2>");

 for( int i=0; i < count; i++ ){

out.print( arr[i]+ "  ");

}   

 }
 out.print("<br><br> ");
   if(request.getParameter("btn")==null){
	   out.println("<h2> 버튼을 클릭하세요 </h2>");
   }else{
	    int btn = Integer.parseInt(request.getParameter("btn")); 

    if(btn == 1){
    %>

	<form action="Array01Pro.jsp">
		<input type="hidden" name="btn" value=<%=btn %>> 배열에 추가할 값을
		입력하세요 <br> <input type="number" name="num"> <input
			type="submit" value="추가">
	</form>
	<% 
    }else if(btn==2){
    	   %>
	<form action="Array01Pro.jsp">
		배열에 삭제할 값을 입력하세요 <br> <input type="hidden" name="btn"
			value=<%=btn %>> <input type="number" name="num"> <input
			type="submit" value="삭제">
	</form>
	<% 	
    }else if(btn==3){
    	   %>
	<form action="Array01Pro.jsp">
		<input type="hidden" name="btn" value=<%=btn %>> 삽입할 배열의 인덱스
		값을 입력하세요 <br> <input type="number" name="idx"> <br>
		<br> 삽입할 배열에 추가할 값을 입력하세요 <br> <input type="number"
			name="num"> <input type="submit" value="삽입">
	</form>
	<% 	
    }
   }
 %>




</body>
</html>