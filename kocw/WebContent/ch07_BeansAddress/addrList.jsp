<%-- 주 소 록     목 록     화 면  --%>

<%@page import="ch07.AddrBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- import 문장은 ch07 내부에 정의된 클래스를 포함함을 지정 -->
<!DOCTYPE html>
<!-- 빈즈 선언 : 저장된 게시글을 가져오기 위함 -->
<!-- 범위(scope)를 application으로 정의, 톰캣 종료시까지 유지 , 서버가 동작하는한 죽지 않아-->
<jsp:useBean id="am" class="ch07.AddrManager" scope="application" />

<html>
<head>
<meta charset="UTF-8">
<title>주소록 관리</title>
</head>
<body>
<div align="center">
<h2>주소록</h2>
<hr>
<a href="addrForm.html">주소추가</a><P>
<table border="1" style="width:500px; text-align: center">
	<tr>
	 	<th>이름</th>
	 	<th>전화번호</th>
	 	<th>이메일</th>
	 	<th>성별</th>
	</tr>
 	<tr>
 	<%
 		// 주소록 관리 DAO 클래스로 생성한 객체의 getAddrList() 메서드를 실행,
 		// 주소록 목록을 가지면서 모든 자료를 순회하며 처리
 		 for(AddrBean ab : am.getAddrList()){
 	%>
 		<%--표현식을 이용하여 각 속성값을 출력 --%>
 		<td><%=ab.getUsername() %></td>
 		<td><%=ab.getTel() %></td>
 		<td><%=ab.getEmail() %></td>
 		<td><%=ab.getGender() %></td>
	</tr>
	<% 
	 	}
	%>
</table>
</div>
</body>
</html>
<!-- 주소록 목록 출력 , application 내장객체 활용하여 AddrManager 객체의 데이터 읽어 옴 -->