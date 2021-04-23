<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 에러</title>
</head>
<body>
<div align="center"><h2>주소록 에러</h2><hr>
<table style="cellpadding:5 width:400">
	<tr style="width:100%" bgcolor="pink">
		<td>주소록 처리중 에러가 발생 했습니다. 빠른 시일내 복구하겠습니다. 관리자에게 문의해 주세요...<br></td>
	</tr>
	<tr>
		<td>에러내용 : <%= exception %></td>
	</tr>
</table>
</div>
</body>
</html>