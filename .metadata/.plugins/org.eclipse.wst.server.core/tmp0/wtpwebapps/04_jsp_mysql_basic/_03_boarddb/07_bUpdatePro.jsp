<%@page import="_03_board.BoardDao"%>

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
		request.setCharacterEncoding("UTF-8");
	%>
		<jsp:useBean id="bean" class="_03_board.Board">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>
	<%
		// 데이터 베이스에 연결
		BoardDao dao = BoardDao.getInstance();
		// 해당 게시글의 패스워드 값을 얻어오기
		String pass = dao.getPass(bean.getNum());
		// 기존 패스워드 값과 update시 작성한 pass값이 같은지 비교
		if(pass.equals(bean.getPassword())){
			// 데이터 수정하는 메서드 호출
			dao.updateBoard(bean);
			// 수정이 완료되면 다시 전체 게시글 보기로 이동
			response.sendRedirect("04_bList.jsp");
		}else{
			// 패스워드가 틀리다면
	%>
		<script type="text/javascript">
			alert('패스워드가 일치하지 않습니다. 다시 확인 후 수정해주세요.');
			history.go(-1);
		</script>
	<%			
		}
	%>
</body>
</html>