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
int height = Integer.parseInt(request.getParameter("height"));
int parents =  Integer.parseInt(request.getParameter("parents"));
String result =""; 
if(height >= 120) {
	result= "놀이기구 이용가능합니다.";
}
if(height < 120) {

	if(parents == 1) {
		result= "놀이기구 이용가능합니다.";
	}
	if(parents == 0) {
		result= "놀이기구를 이용할 수 없습니다.";
	}
}

%>
<h2> <%=result %> </h2>
<button onclick="location.href='Ex06.jsp'"> 뒤로가기 </button>

</body>
</html>