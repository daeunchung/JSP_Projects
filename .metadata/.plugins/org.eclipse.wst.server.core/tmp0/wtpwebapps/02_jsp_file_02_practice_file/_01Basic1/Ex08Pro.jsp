<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String myAcc = "1234";
String yourAcc ="4321";

String account  = request.getParameter("account"); 
int money = Integer.parseInt(request.getParameter("money"));
int myMoney = Integer.parseInt(request.getParameter("myMoney"));
int yourMoney = Integer.parseInt(request.getParameter("yourMoney"));
String result ="";

if(account.equals(yourAcc)) {
		
		if(money <= myMoney) {
			myMoney = myMoney - money;
			yourMoney = yourMoney + money;
			result = yourAcc + "에 "+money +"원을 이체를 완료하였습니다. 남아있는 금액은 " + myMoney + "원 입니다";
		}else {
			result =yourAcc + "에 계좌잔액이 "+ ( money - myMoney) +"만큼  부족합니다.";
		}
}else if(account.equals(myAcc)) {
	
	if(money <= yourMoney) {
		yourMoney = yourMoney - money;
		myMoney = myMoney + money;
		result = myAcc +" 에 " + money +"원을 이체를 완료하였습니다. 남아있는 금액은 " + yourMoney + "원 입니다";
	}else {
		result =myAcc + "에 계좌잔액이 "+ ( money - yourMoney) +"만큼  부족합니다.";
	}
}
%>

<script type="text/javascript">
alert("<%=result%>"); 
location.href="Ex08.jsp";
</script>

</body>
</html>