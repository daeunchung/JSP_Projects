<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 한글 캐릭터셋 변환
	request.setCharacterEncoding("utf-8");
	
	// HTML 폼에서 전달된 msg 값을 가지고 옴
	String msg = request.getParameter("msg");
	
	// 세션에 저장된 로그인 사용자 이름을 가지고 옴
	Object username = session.getAttribute("user");
	
	// 메세지 저장을 위해 application에서 msgs로 저장된 ArrayList 가지고 옴.
	ArrayList<String>msgs = (ArrayList<String>)application.getAttribute("msgs");
	
	// null인 경우 새로운 ArrayList 객체를 생성
	if(msgs == null){
		msgs = new ArrayList<String>();
		application.setAttribute("msgs", msgs);
	}

	// 사용자 이름, 메서지, 날짜 정보를 포함하여 ArrayList 추가
	msgs.add(username + " :: " + msg + ", " + new java.util.Date());
	// 톰캣 콘솔을 통한 로깅
	application.log(msg + "추가됨");
	// 목록 화면으로 리다이렉팅
	response.sendRedirect("twitter_list.jsp");

%>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
</head>
<body>

</body>
</html>