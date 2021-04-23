<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  request.setCharacterEncoding("utf-8"); %>
	
<%
  String id= request.getParameter("id");
  String passwd= request.getParameter("passwd");
  String name= request.getParameter("name");
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  
  try{
	 	String jdbcUrl="jdbc:mysql://localhost:3306/joindb01?serverTimezone=UTC";
	    String dbId="root";
	    String dbPass="root";
	 
	 	Class.forName("com.mysql.cj.jdbc.Driver");
	 	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );	
	 	
	 	String sql= "select id, passwd from member where id= ?";
		pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
		rs=pstmt.executeQuery();
	    
		if(rs.next()){ 
			String rId=rs.getString("id");
			String rPasswd=rs.getString("passwd");
	      if(id.equals(rId) && passwd.equals(rPasswd)){
		     sql= "update member set name= ?  where id= ? ";
		     pstmt=conn.prepareStatement(sql);
		     pstmt.setString(1,name);
		     pstmt.setString(2,id);
		     pstmt.executeUpdate();	   
	%>	
	  member 테이블의 레코드를 수정했습니다.
	<%
	      }else
			out.println("패스워드가 틀렸습니다.");
		}else
			 out.println("아이디가 틀렸습니다.");
	  }catch(Exception e){ 
		  e.printStackTrace();
	  }finally{
		  if(rs != null) 
			 try{rs.close();}catch(SQLException sqle){}
		  if(pstmt != null) 
			 try{pstmt.close();}catch(SQLException sqle){}
		  if(conn != null) 
			 try{conn.close();}catch(SQLException sqle){}
	  }
  
	%>

<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>