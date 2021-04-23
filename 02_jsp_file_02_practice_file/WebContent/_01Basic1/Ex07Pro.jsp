<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 =  Integer.parseInt(request.getParameter("num2"));
int num3 =  Integer.parseInt(request.getParameter("num3"));
int maxNum = num1;

if (maxNum < num2) {
	maxNum = num2;
}
if (maxNum < num3) {
	maxNum = num3;
}

%>
<h2> 가장 큰 숫자는 <%=maxNum %> 입니다</h2>
<button onclick="location.href='Ex07.jsp'"> 뒤로가기 </button>
</body>
</html>