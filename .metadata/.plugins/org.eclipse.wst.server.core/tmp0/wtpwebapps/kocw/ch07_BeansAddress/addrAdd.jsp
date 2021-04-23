<%-- 주 소 록   등 록   처 리 를   위 한   jsp (html 폼에서 입력한 내용 data 객체 생성해서 속성값으로 추가해주는 곳) --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8"); %>
<!-- 빈즈 선언 : 개별 주소록 처리를 위함 -->
<!-- HTML 폼에서 전달받은 값을 setProperty를 이용하여 매핑처리 -->
<!-- 매핑된 AddrBean 객체는 AddrManager 클래스의 add() 메서드에 전달 -->
<jsp:useBean id="addr" class="ch07.AddrBean" />
<jsp:setProperty property="*" name="addr"/>

<!-- 빈즈 선언 : AddrManager 클래스의 add() 메서드를 활용하기 위함 -->
<!-- 범위(scope) 를 application으로 정의, 톰캣 종료시까지 유지 -->
<jsp:useBean id="am" class="ch07.AddrManager" scope="application" />

<%
	// 매핑된 AddrBean 객체는 AddrManager 클래스의 add() 메서드 호출
	am.add(addr);
%>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 등록</title>
</head>
<body>
	<div align="center">
	<h2>등록내용</h2>
	<%-- getProperty 및 표현식을 이용하여 입력된 내용을 확인 --%>
	이름 : <jsp:getProperty property="username" name="addr"/><P>
	전화번호 : <%=addr.getTel() %><P>
	이메일 : <%=addr.getEmail() %><P>
	성별: <%=addr.getGender() %>
	<HR>
	<!-- 목록 페이지로 이동 -->
	<a href="addrList.jsp">목록 보기</a>
	</div>
</body>
</html>
<!-- html로 입력된 내용을 AddrManager 객체를 이용하여 추가, 자료를 전달할 때 AddrBean 이용 -->