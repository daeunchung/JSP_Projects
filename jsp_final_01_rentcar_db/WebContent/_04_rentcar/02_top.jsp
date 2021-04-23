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
	 // 세션을 이용한 로그인 처리
	 String id = (String)session.getAttribute("id");
	 
	 // 로그인이 되어있지 않다면
	 if(id == null){
		 id = "GUEST";
	 }
	 %>
	<table>
		<tr height="70">
			<td colspan="4">
				<a href="01_carMain.jsp" style="text-decoration: none">
				<img alt="" src="img/rent_logo.jpg" height="120">
				</a>
			</td>
			<td align="center" width="200">
				<%= id %>님
				<%
					if(id.equals("GUEST")){
				%>
				<button onclick="location.href='05_memberLogin.jsp'"> 로그인 </button>
				<%						
					}else{
				 %>
				
				
				<button onclick="location.href='07_memberLogout.jsp'"> 로그아웃 </button> 
				<%						
					}
				 %>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="01_carMain.jsp?center=08_carReserveMain.jsp" 
				style="text-decoration: none">예 약 하 기</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="01_carMain.jsp?center=14_carReserveView.jsp" 
				style="text-decoration: none">예 약 확 인</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">자유게시판</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">이  벤  트</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">고 객 센 터</a></font>
			</td>
		</tr>
	</table>
</body>
</html>