<%@page import="_03_board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09_bDeletePro</title>
</head>
<body>
	<%
		String pass = request.getParameter("password");
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 데이터 베이스 연결
		BoardDao dao = BoardDao.getInstance();
		String password = dao.getPass(num);
		
		// 기존 패스워드 값과 delete form에서 작성한 패스워드 비교
		if(pass.equals(password)){
			// 패스워드가 같으면
			dao.deleteBoard(num);
			
			response.sendRedirect("04_bList.jsp");
		}else{
	%>
		<script type="text/javascript">
			alert("패스워드가 틀립니다.");
			history.go(-1);
		</script>
	<%				
		}
	%>	
</body>
</html>