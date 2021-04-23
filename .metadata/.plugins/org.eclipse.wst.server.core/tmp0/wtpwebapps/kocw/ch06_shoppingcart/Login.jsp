<%-- [JSP] session을 이용한 장바구니 만들기
* 쇼핑몰의 기본적인 흐름
1. 사용자가 로그인한다.
2. 원하는 만큼 상품을 선택한다.
3. 주문 버튼을 클릭하면 지금까지 선택했던 상품이 모두 나타난다.
4. 로그아웃을 하면 다시 로그인 페이지로 넘어간다. --%>

<%-- 로그인 화면 , 비밀번호 X 사용자 이름 입력 양식
사용자 이름을 입력을 위한 폼으로 로그인 버튼을 누르면 action 태그에서 지정된 파일로 이동
이때 username 파라미터로 사용자가 입력한 값이 전달된다
사용자 이름을 넣지 않은 경우 다음창으로 안넘어가고 로그인 창 나타내기 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html" http-equiv="Content-Type" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% session.invalidate();%>
	<center>
		<h1>로그인</h1>
		<hr>
		<form action="setProduct.jsp" method="post">
		이름: 
		<input type="text" name="name">
		<input type="submit" value="로그인">
		</form>
	</center>
</body>
</html>