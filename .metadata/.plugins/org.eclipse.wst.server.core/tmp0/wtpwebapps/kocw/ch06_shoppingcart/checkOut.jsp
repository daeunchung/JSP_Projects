<%-- 세션이 살아 있고 하나 이상의 상품을 선택한 상태라면, ArrayList 를 가지고와 화면에 선택한 상품의 목록을 보여준다.
뒤로가기 버튼을 누르면 다시 상품을 선택하는 창이 나온다.
로그아웃 버튼을 누르면 Login.jsp 페이지로 이동하며 세션 종료 --%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	request.setCharacterEncoding("UTF-8");	%>
	
	<% 	ArrayList<String> arrr = (ArrayList<String>) (session.getAttribute("productList"));	%>
<div align="center">
	<h1>상품 결과</h1>
	<hr>
	<%= session.getAttribute("login") %>님의 장바구니 목록
	<hr>
	<% if(arrr == null){ %>
	장바구니에 넣은 상품이 없습니다.
	<% }else{ 
		for(String i : arrr){
			out.println(i); %><br>
		<% }
	} %>
	<br><br><br>
	<table>
		<tr>
			<td><input type="button" onclick="history.back()" value="뒤로가기"></td>
			<td>
				<form action="Login.jsp" method="post"> 
					<input value="로그아웃" type="submit">
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>