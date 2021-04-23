<%-- setProduct.jsp 에서 선택한 상품을 productname 이라는 변수에 저장하고 , 
세션에서 productlist 라는 이름의 속성을 가지고와 ArrayList 타입의 참조변수에 대입
추가된 ArrayList 는 다시 세션에 저장되고 , 이후 새로운 상품이 추가될 때 세션에서 가지고온 ArrayList 에 추가된다.
세션이 살아 있는 동안 선택된 상품이 모두 유지된다. --%>

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
	<%
		request.setCharacterEncoding("UTF-8");
		ArrayList<String> arr = (ArrayList<String>) (session.getAttribute("productList"));
		
		String productName = request.getParameter("product");
		
		/*arrayList 안에 아무것도 없으면 arrayList 생성 */
		if(session.getAttribute("productList") == null){
			arr = new ArrayList<String>();
		}
		arr.add(productName);
		session.setAttribute("productList", arr);
	%>
	
	<script type="text/javascript">
		alert("<%=productName %>가 추가되었습니다.");
		history.back();
	</script>

</body>
</html>