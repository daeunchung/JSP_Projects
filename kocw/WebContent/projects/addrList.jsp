<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addressbook_error.jsp"
    import="projects.*, java.util.*"%>
    
<!DOCTYPE html>
<%-- <jsp:userBean id="addresses" scope="request" class="java.util.ArrayList<AddressBean>" /> --%>
<html>
<head>
<meta charset="UTF-8" content="text/html" http-equiv="Content-Type">
<!-- 스타일시트 적용 -->
<link rel="stylesheet" href="addressbook.css" type="text/css" media="screen" />

<%-- id번호를 클릭했을때 해당 주소록 페이지로 이동시켜주기 . id 번호에 대해서 hyperlink 구성해주기
수정/삭제 화면으로 이동하기 위한 URL 구성, JavaScript는 <HEAD></HEAD>태그 사이에 위치
입력으로 id를 가져오고, prompt를 통해 사용자의 비밀번호 입력을 pwd로 받아오며, Controller 페이지로 이동하게 함. (get방식으로)
실제 응용에서는 prompt 보다는 별도의 입력창이 바람직함.
 --%>
 <script type="text/javascript">
 	function check(id) {
 		pwd = prompt("수정/삭제하려면 관리자 비밀번호를 입력하세요.");
 		document.location.href
 			= "addrController.jsp?action=modify&id=" + id + "&pwd=" + pwd;
	}
 </script>
<title>주소록 목록</title>
</head>
<body>
	<div align="center"><h2>주소록 목록</h2><hr>
	<form action="">
		<a href="addrInsert.jsp">주소록 등록</a>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화</th>
				<th>생일</th>
				<th>회사</th>
				<th>메모</th>
			</tr>
			<%
			for(AddressBean addr : (ArrayList<AddressBean>)request.getAttribute("addrs")){
			%>
			<tr>
				<td><a href="javascript:check(<%= addr.getId() %>)">
					<%= addr.getId() %></a></td>
				<td><%= addr.getId() %></td>
				<td><%= addr.getName() %></td>
				<td><%= addr.getEmail() %></td>
				<td><%= addr.getTel() %></td>
				<td><%= addr.getBirth() %></td>
				<td><%= addr.getCompany() %></td>
				<td><%= addr.getMemo() %></td>
			</tr>
			<% } %>
		</table>
	</form>
	</div>
</body>
</html>