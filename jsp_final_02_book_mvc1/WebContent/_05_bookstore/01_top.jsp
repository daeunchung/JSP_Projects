<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<% if(id == null){ %>
		<a href="16_list.jsp?book_kind=all">전체목록보기</a>
		<br>
		
		<form method="post" action="05_loginPro.jsp">
			아이디 : <input type="text" name="id" size="15" maxlength="50" autofocus>&nbsp;
			비밀번호 : <input type="password" name="passwd" size="15" maxlength="16" >
			<input type="submit" value="로그인">
		</form>
		<font color="red">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다. *</font>
	<% } else { %>
		<a href="16_list.jsp?book_kind=all">전체목록보기</a>&nbsp;
		<a href="19_cartList.jsp?book_kind=all">장바구니 보기</a>&nbsp;
		<a href="25_buyList.jsp">구매목록보기</a>
		
		<br><br>
		<b><%= id %>님, 즐거운 쇼핑시간이 되세요.</b>
		<input type="button" value="로그아웃" onclick="window.location.href='07_logout.jsp'">
	<% } %>	
	</body>
</body>
</html>