<%-- 11_orderedList.jsp --%>
<%@page import="_05_bookstore.BuyDAO"%>
<%@page import="_05_bookstore.BuyDTO"%>

<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	// String buyer = (String)session.getAttribute("id");

	List<BuyDTO> buyLists = null;
	BuyDTO buyList = null;
	int count = 0;
	
	BuyDAO dao = BuyDAO.getInstance();
	count = dao.getListCount();
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>관리자 주문 목록</title>
	</head>
	<body>
		<h3><b>주문목록</b></h3>
		<a href="06_managerMain.jsp">관리자 메인으로</a>
	<% if(count == 0){ %>
		<table>
			<tr>
				<td>구매목록이 없습니다.</td>
			</tr>
		</table>
	<% } else {
			buyLists = dao.getBuyList();
	%>
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>책이름</th>
				<th>주문가격</th>
				<th>주문수량</th>
				<th>주문일</th>
				<th>결제계좌</th>
				<th>배송명</th>
				<th>배송지전화</th>
				<th>배송지주소</th>
				<th>배송지상황</th>
			</tr>
	<% 
		for(int i=0; i<buyLists.size(); i++){
			buyList = (BuyDTO)buyLists.get(i);
	%>		
			<tr>
				<td><%= buyList.getBuy_id() %></td>
				<td><%= buyList.getBuyer() %></td>
				<td><%= buyList.getBook_title() %></td>
				<td><%= buyList.getBuy_price() %></td>
				<td><%= buyList.getBuy_date() %></td>
				<td><%= buyList.getBuy_date() %></td>
				<td><%= buyList.getAccount() %></td>
				<td><%= buyList.getDeliveryName() %></td>
				<td><%= buyList.getDeliveryTel() %></td>
				<td><%= buyList.getDeliveryAddress() %></td>
				<td><%= buyList.getSanction() %></td>
			</tr>
	<% 
		} 
	  }
	
	%>	
		</table>	
	</body>
</html>

















