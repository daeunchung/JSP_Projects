<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>EL 예제: 상품목록</h2>
<hr>
	<form name=form1 method=post action=ProductSel.jsp>
	<jsp:useBean id="product" class="ch10.Product" scope="session"/>
	<select name="sel">
	<%
		for(String item : product.getProductList()){
			out.println("<option>"+item+"</option>");
		}
	%>
	</select>
	<input type="submit" value="OK!"/>
	</form>
</div>
</body>
</html>