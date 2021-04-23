<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addressbook_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 주소 입력</title>
<!-- 스타일시트 적용 -->
<link rel="stylesheet" href="addressbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center"><h2>새로운 주소 등록</h2><hr>
[<a href="addrController.jsp?action=list">주소록 목록으로</a>]<p>
<!-- [<a href="default.jsp">주소록 목록으로</a>] -->
 
<form name="form1" method="post" action="addrController.jsp">
	<%-- addrController.jsp 페이지를 호출할 때 action값을 가져가야함.
	action은 입력 컨트롤로 존재할 수 없는 값. action을 전달하기 위해 type을 hidden(실제로 존재하지 않지만 값 전달 가능)으로 설정 
	
	즉, "addrController.jsp?action=insert"와 같은 역할 수행 --%>
	<input type="hidden" name="action" value="insert">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" maxlength="10"></td>
		</tr>
		<tr>
			<th>email</th>
			<td><input type="text" name="email" maxlength="20"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" maxlength="13"></td>
		</tr>
		<tr>
			<th>생일</th>
			<td><input type="text" name="birth">
			<br> "yyyy-mm-dd" 형식으로 입력하세요.
			</td>
		</tr>
		<tr>
			<th>회사</th>
			<td><input type="text" name="company" maxlength="10"></td>
		</tr>
		<tr>
			<th>메모</th>
			<td><input type="text" name="memo" maxlength="20"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="저장"> <!-- submit 누르면 action값 insert를 가지고 addrController.jsp페이지로 이동 -->
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>

</div>
</body>
</html>