<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("utf-8");%>
<%-- 7~9라인: 수정된 정보를 가지고 데이터저장빈객체를 생성--%>
<jsp:useBean id="member" class="member.Member">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%  
  MemberDAO manager = MemberDAO.getInstance();
  //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환
  int check = manager.updateMember(member);
    
  out.println(check);
 %>