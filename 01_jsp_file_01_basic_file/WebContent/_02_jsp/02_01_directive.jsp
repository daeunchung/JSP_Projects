<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 주석  
	jsp ==> 자바 서버 페이지 ==> 역활 ==> html 에서 아래 태그를 더사용할수 있다.
     -1. 지시자(Directive) 태그        	<%@    %>
     -2. 표현식(Expression) 태그      	<%=    %>
     -3. 선언자(Declration) 태그      	<%!    %>
     -4. 스크립트릿(Scriptlet) 태그  	<%     %>
	 -5. 주석 태그 				 	
--%> 
<%--
	1. 지시자(Directive) 태그 : <%@    %>
		
		 page Directive : jsp 페이지에 대한 정보를 정의한다. 					
		
		 [사용방법 ]  <%@ page 속성%>   		
		
		 page 디렉티브 의 속성 종류 : 
				[Info] [language] [contentType] [extends] 
				[import] [session] [buffer] [autoFlush] 
				[sThreadSafe] [errorPage] [isErrorPage] 
				[pageEncoding] [isELignored]		
									
		 여러가지가 있지만 당장은 기본3개만 사용(language , contentType , pageEncoding) 자동생성된다.		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>