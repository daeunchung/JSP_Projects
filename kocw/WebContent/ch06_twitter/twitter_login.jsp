<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
<title>트위터 로그인 화면</title>
</head>
<body>
	<center>
	<h2>트위터 로그인</h2>
	<form action="twitter_list.jsp" name="form1" method="post">
		<input type="text" name="username">
		<input type="submit" value="로그인">
	</form>
</body>
</html>


<%-- JSP 내장객체 application 사용해보기 
	1. db 사용안하고 application 내장 객체 사용
	2. 톰캣 종료시 저장된 데이터도 초기화
	3. 다중 사용자 접속을 지원 , 개별 사용자 id를 유지

	twitter_login.jsp  로그인하는 화면 , 비밀번호 입력 없이 사용자 이름만 입력하여 로그인
	twitter_list.jsp   트위터 메인 화면으로 등록된 글의 목록이 나타남 . 작성자 아이디/내용/시간을 출력
	tweet.jsp          현재 로그인한 사용자 아이디와 작성된 메세지를 저장.
	                   application 내장객체를 이용해서 모든 사용자가 공유할 수 있는 임시 저장소로 활용
--%>
