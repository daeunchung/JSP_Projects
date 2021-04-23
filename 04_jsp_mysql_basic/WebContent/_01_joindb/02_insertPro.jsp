<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
	create database joindb01;
	use joindb01;
	create table member(
		id varchar(20),
	    passwd varchar(20),
	    name varchar(20),
		joindate datetime
	);
	select * from member;
 --%>

<% request.setCharacterEncoding("utf-8");%>
<%
	String id = request.getParameter("id");
	String passwd= request.getParameter("passwd");
	String name = request.getParameter("name");    
	Timestamp register=new Timestamp(System.currentTimeMillis());

	Connection conn=null;
	PreparedStatement pstmt=null;
	String str="";
	
	 try{
	 	 String jdbcUrl="jdbc:mysql://localhost:3306/joindb01?serverTimezone=UTC";
	     String dbId="root";
	     String dbPass="root";
	 	 
	 	 Class.forName("com.mysql.cj.jdbc.Driver");
	 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 	
	 	 String sql= "insert into member values (?,?,?,?)";
	 	 pstmt=conn.prepareStatement(sql);
	 	 pstmt.setString(1,id);
	     pstmt.setString(2,passwd);
	 	 pstmt.setString(3,name);
	 	 pstmt.setTimestamp(4,register);
	 	 pstmt.executeUpdate();
	 	 
	 	 str= "member 테이블에 새로운 레코드를 추가했습니다.";

	 	}catch(Exception e){ 
	 		e.printStackTrace();
	 		str="member 테이블에 새로운 레코드를 추가에 실패했습니다";
	 	}finally{
	 		if(pstmt != null) 
	 			try{pstmt.close();}catch(SQLException sqle){}
	 		if(conn != null) 
	 			try{conn.close();}catch(SQLException sqle){}
	 	}
	
%>
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>