<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2> </h2>
<pre> 
	심플 최대값 찾기
         문제 
	# 최대값 구하기[2단계]
	1. 정수 값 3개를 입력한다.
	2. 입력받은 3개의 숫자 중 가장 큰 값을 출력한다.
	3. 값 없으면 오류 창 띄우기 
</pre>

<script>
function checkInput(){
	if(document.f1.num1.value==""){
		alert('첫번째 값을 입력하세요');
		document.f1.num1.focus();
		return;
	}
	if(document.f1.num2.value==""){
		alert('두번째 값을 입력하세요');
		document.f1.num2.focus();
		return;
	}
	if(document.f1.num3.value==""){
		alert('세번째 값을 입력하세요');
		document.f1.num3.focus();
		return;
	}
	
	document.f1.submit();
}

</script>

<form name="f1" action="Ex07Pro.jsp"> 
<input type="number" name="num1" >  &nbsp;&nbsp; &nbsp;
 <input type="number" name="num2" > &nbsp;&nbsp; &nbsp;
 <input type="number" name="num3" > &nbsp;&nbsp; &nbsp;
<input type="button" onclick="checkInput()" value="전송"> 
</form>

</body>
</html>