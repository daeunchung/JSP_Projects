<%@page import="_09_rentcar.RentcarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
	<%	
	
		RentcarDao.instance.realpath = application.getRealPath("");
		System.out.println(RentcarDao.instance.realpath);		
		RentcarDao.instance.memberBasicSet();
		RentcarDao.instance.rentcarBasicSet();		
		RentcarDao.instance.loadData();		
		String center = request.getParameter("center");
		
		// 처음 실행시에는 center값이 넘어오지 않기에
		// null처리 해줌
		if(center == null){	
			center = "04_center.jsp";		// defulat center값을 부여
		}
	%>

	<table>
		<%-- top 부분 --%>
		<tr height="120" align="center">
			<td align="center" width="1000">
				<jsp:include page="02_top.jsp" />
			</td>
		</tr>
		<%-- center 부분 --%>
		<tr align="center">
			<td align="center" width="1000">
				<jsp:include page="<%= center %>" />
			</td>
		</tr>
		<%-- bottom 부분 --%>
		<tr height="100" align="center">
			<td align="center" width="1000">
				<jsp:include page="03_bottom.jsp" />
			</td>
		</tr>
	</table>
	</div>
</body>
</html>