<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
안녕 난 출력코드1이야
안녕 난 출력코드2이야
안녕 난 출력코드3이야
안녕 난 출력코드4이야
안녕 난 출력코드5이야
안녕 난 출력코드6이야
 
<jsp:forward page="shopping.jsp">
        <jsp:param value="name" name="name" />
        <jsp:param value="address" name="address" />
</jsp:forward>
        
</body>
</html>

<%--
forward 액션 태그가 올바르게 동작하기 위해서는 forward 액션 태그를 실행하기 전에 웹 브라우저에 데이터가 전송되면 안된다. 
만약 출력 버퍼를 플러시한 이후에 forward 액션 태그를 실행하면 실행 흐름을 이동하는데 실패한다. 
비슷하게 버퍼 속성을 none으로 해서 버퍼를 사용하지 않는 경우에도 forward 액션 태그는 제대로 동작하지 않는다.

url 주소가 shopping.jsp 가 아닌 forward.jsp인 것을 확인할 수 있다.  
forward 액션 태그는 내가 실행시킨 jsp 파일의 형태를 변화 시킬뿐 내가 가지고 있는 위치는 변화시키지 않기 때문이다.
그리하여 , 
forward 액션 이후에 페이지 url 은 forward.jsp 이고 페이지 내용(속성)은 shopping.jsp 인 것이다. 


* <jsp:param> 액션 태그를 이용해서 이동할 페이지에 파라미터 추가하기   --%>