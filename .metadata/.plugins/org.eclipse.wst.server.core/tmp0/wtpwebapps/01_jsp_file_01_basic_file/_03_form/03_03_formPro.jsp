<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");%>
	
<%
   int localNum = Integer.parseInt(request.getParameter("localNum"));
   String localName ="";
   
   switch (localNum){ //localNum변수의 값은 0~7사이의 값
       case 0:
	       localName ="종로, 중구, 용산";
	       break;
       case 1:
	       localName ="도봉, 강북, 노원, 성북";
	       break;
       case 2:
	       localName ="동대문, 성동, 중량, 광진";
	       break;
       case 3:
	       localName ="강동, 송파";
	       break;
       case 4:
	       localName ="서초, 강남";
	       break;
       case 5:
	       localName ="동작, 관악, 금천";
	       break;
       case 6:
	       localName ="강서, 양천, 영등포, 구로";
	       break;
       case 7:
	       localName ="은평, 마포, 서대문";
	       break;
	   default:
		   localName ="없는 권역";
           break;
   }
   
   out.println("선택하신 지역은 <b>" + localName +" </b> 입니다");
%>
</body>
</html>