<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%
String[] board;
int count;

if(session.getAttribute("board")==null){
	count = 1;
	board = new String[count];
	
}else{
	board=(String[])session.getAttribute("board");
	count = board.length+1;
}
System.out.println("count = " + count + " size = " + board.length );
String title = request.getParameter("title");

if(count > 1){

String[] temp = new String[count]; 
	
for(int i=0; i<board.length;i++){
	temp[i] = board[i];
}
temp[count-1] = title;

board = temp;
}else if(count == 1){
board[0] = title;
}

session.setAttribute("board", board);

response.sendRedirect("board1.jsp");
%>


</body>
</html>