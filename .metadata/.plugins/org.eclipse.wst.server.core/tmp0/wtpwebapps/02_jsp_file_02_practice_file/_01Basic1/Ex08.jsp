<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<pre>

# ATM[1단계] : 이체하기
 1. 이체할 계좌번호를 입력받는다.
 2. 계좌번호가 일치하면,
 3. 이체할 금액을 입력받는다.
 4. 이체할 금액 <= myMoney	: 이체가능
	myMoney   - 이체할 금액
	yourMoney + 이체할 금액
	이체할 금액  > myMoney 	: 이체불가
	
	Ex08Pro.jsp 페이지에 계산하고 결과 값을 띄우기 
	"계좌번호" 에 "입금금액" 원을 이체를 완료하였습니다. 남아있는 금액은 "계산결과 "원 입니다 출력하기
 5. 계좌번호가 존재하지않거나 빈칸이 있을시에 알람창 띄우기 	
 
  myMoney = 8700;
  yourMoney = 12000;
  myAcc = "1234";
  yourAcc ="4321";
</pre>
<%

int myMoney = 8700;
int yourMoney = 12000;

%>
<script>

function checkInput(){
	var myAcc = "1234";
	var yourAcc ="4321";
	
	if(document.f2.account.value!="1234" && document.f2.account.value!="4321"){
		alert('해당계좌번호가 존재하지 않습니다')
		document.f2.account.value="";
		document.f2.account.focus();
		return;
	}
	
	if(document.f2.account.value == ""){
		alert('계좌번호를 입력하세요');
		document.f2.account.focus();
		return;
	}
	
	if(document.f2.money.value == ""){
		alert('입금 금액을 입력하세요');
		document.f2.money.focus();
		return;
	}
	
	document.f2.submit();
}

</script>

<form name="f2" action="Ex08Pro.jsp">
이체할 계좌번호를 입력하세요. <br><br>
<input type="text" name="account"> <br><br>
이체할 금액을 입력하세요. <br><br>
<input type="text" name="money">
<input type="hidden" name="myMoney" value=<%=myMoney %>>
<input type="hidden" name="yourMoney" value=<%=yourMoney %>> <br><br>
<input type="button" onclick="checkInput()" value="이체"> 
</form>

</body>
</html>