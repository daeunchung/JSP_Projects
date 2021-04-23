<%@page import="_03_board.BoardDao"%>
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
%>
	<jsp:useBean id="bean" class="_03_board.Board">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>
<%
	// 데이터베이스 객체 생성
	BoardDao bdao = BoardDao.getInstance();
	bdao.reWriteBoard(bean);
	
	// 답변 데이터를 모두 저장 후 전체 게시글 보기를 설정
	response.sendRedirect("04_bList.jsp");
%>

</body>
</html>