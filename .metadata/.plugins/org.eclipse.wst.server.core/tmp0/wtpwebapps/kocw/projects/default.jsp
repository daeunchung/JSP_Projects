<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- MVC 패턴의 Controller 페이지를 경유하도록 조치 
	주소록 목록은 addrList.jsp 에서 처리
	그런데 MVC 패턴을 사용할 경우 Controller 에서 View 페이지를 호출함
	목록 페이지를 호출할 때, action=list 를 추가하여 Controller 를 경유하여 목록페이지로 이동
	response.sendRedirect()를 이용할 수 있으나, URL이 노출되는 문제가 있어 , action 이용


	get방식으로 action값에 list를 가지고 다른 페이지로 이동. 
	다른페이지로 이동하지만 response.sendRedirect()와 달리 현재 가진 정보를 가지고 있는 채로 이동
--%>
<% pageContext.forward("addrController.jsp?action=list"); %>