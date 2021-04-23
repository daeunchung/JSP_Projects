<%-- 10_bookUpdatePro.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>관리자 책수정</title>
	</head>
	<body>
		<script type="text/javascript">
			alert('수정을 완료하였습니다!');
			location.href='/_jsp_06_bookstore_mvc/mg/bookList.do?book_kind=${ book_kind }';
		</script>
	</body>
</html>