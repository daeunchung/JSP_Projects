<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 빈즈액션을 이용하여 LoginBean 클래스를 login 이라는 이름의 빈즈 객체로 활용 -->
<jsp:useBean id="login" class="ch07.LoginBean" scope="page" />
<!-- HTML 폼으로부터 전달받은 id와 pw를 LoginBean의 맴버변수로 전달 -->
<!-- property="*" 부분은 와일드카드로 모든 속성을 지정하겠다는 의미 -->
<jsp:setProperty name="login" property="*" />

<html>
<head>
<meta charset="UTF-8">
<title>로그인.jsp</title>
</head>
<body>
	<div align="center">
	<h3>로그인 예제</h3>
	<hr>
	<%-- 빈즈 클래스인 객체를 이용하여 로그인여부를 확인하고, 결과에 따른 출력 --%>
	<%
		if(!login.checkUser()){
			out.println("로그인 실패!!");
		}else{
			out.println("로그인 성공!!");
		}
	%>
	<hr>
	<%-- 빈즈 클래스의 getProperty 액션을 이용하여 추출된 속성값을 화면에 출력 --%>
	사용자 아이디 : <jsp:getProperty property="userid" name="login"/>
	사용자 패스워드: <jsp:getProperty property="passwd" name="login"/>
	<hr>
	<%-- 표현식을 이용하여 출력할 수도 있음 --%>
	사용자 아이디 : <%=login.getUserid() %>
	사용자 패스워드 : <%=login.getPasswd() %>
	</div>
</body>
</html>