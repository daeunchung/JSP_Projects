<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addressbook_error.jsp" import="projects.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 정보 수정</title>
<!-- 스타일시트 적용 -->
<link rel="stylesheet" href="addressbook.css" type="text/css" media="screen" />

<!-- 삭제 버튼을 누른 경우 처리를 위한 JavaScript 지정 -->
<%-- 원래는 한개의 form태그에는 한개의 submit버튼만 있을 수 있다. 
여기서는 수정, 삭제 2가지를 구현하기 위하여 Javascript 를 사용해서 submit 하나를 처리하는 것 
action값은 delete로 , submit 버튼은 하나 추가 하는 식으로--%>
<script type="text/javascript">
	function deleteAddress() {
		pwd = prompt("비밀번호: ");
		
		if(pwd == "1234"){
			result = confirm("정말로 삭제하시겠습니까?"); 
			// 입력에 따른 처리
			if(result){
				document.form1.action.value="delete";
				document.form1.submit();
			} else{
				return;
			}
		} else{
			alert("비밀번호가 틀렸습니다!");
			return;
		}
	}
</script>
</head>
<body>
	<div align="center"><h2>주소 수정</h2><hr>
	[<a href="default.jsp">주소록 목록으로</a>]<p>
	
	<form name="form1" method="post" action="addrController.jsp">
	<%-- addrController.jsp 페이지를 호출할 때 action을 전달하기 위해 type을 hidden으로 설정
	즉, "addrController.jsp?action=update"와 같은 역할 수행 --%>
	<input type="hidden" name="action" value="update">
	<%-- Controller 페이지에서 setAttribute()로 전달해준 값을 읽어 옴 --%>
	<% 
		AddressBean addr = (AddressBean)request.getAttribute("addr");
	%>
	<%-- hidden action으로 주소록 id 값을 가져감 --%>
	<input type="hidden" name="id" value="<%= addr.getId() %>">
	
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" maxlength="10" value="<%= addr.getName() %>"></td>
		</tr>
		<tr>
			<th>email</th>
			<td><input type="text" name="email" maxlength="20" value="<%= addr.getEmail() %>"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" maxlength="13" value="<%= addr.getTel() %>"></td>
		</tr>
		<tr>
			<th>생일</th>
			<td><input type="text" name="birth" value="<%= addr.getBirth() %>">
			<br> "yyyy-mm-dd" 형식으로 입력하세요.</td>
		</tr>
		<tr>
			<th>회사</th>
			<td><input type="text" name="company" maxlength="10" value="<%= addr.getCompany() %>"></td>
		</tr>
		<tr>
			<th>메모</th>
			<td><input type="text" name="memo" maxlength="20" value="<%= addr.getMemo() %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="저장"> 
				<!-- 하나의 form태그에는 하나의 submit버튼만 있을 수 있다. 
				그러나 submit 버튼을 2개 사용하기 위해서 하나는 form태그의 submit버튼으로 (기본submit이라서 update 액션가지고 이동), 
				다른하나는 javascript 에서 (function deleteAddress 이용해서 addrController.jsp 페이지로 이동할 수 있도록 
				앞쪽에 달아줘서 처리했음 -->
				<input type="button" value="삭제" onclick="deleteAddress()">
				<input type="reset" value="취소">
			</td>
		</tr>	
	</table>
	</form>
	
	</div>
</body>
</html>
