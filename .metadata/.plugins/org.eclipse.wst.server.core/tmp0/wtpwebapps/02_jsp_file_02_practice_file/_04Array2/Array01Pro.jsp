<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>


	<h2>결과값</h2>
	<%
int[] arr = new int[5]; 
int  count =0;
int btn = Integer.parseInt(request.getParameter("btn"));
int num = Integer.parseInt(request.getParameter("num"));
if(session.getAttribute("count")!=null){
    arr = (int[])(session.getAttribute("arr"));
    count = (int)(session.getAttribute("count"));
    }
if(count < arr.length && count >= 0 ){
if(btn == 1){
	// 배열 추가 
	
	arr[count] = num;
	count++; 

	
}else if (btn == 2){
	// 배열 삭제
	
	int idx = -1; 
	for(int i =0; i <count; i++){
		if(arr[i]==num){
			idx = i;
			break;
		}
	}
	if(idx != -1){
	for(int i = idx; i < count-1; i++){
		arr[i] = arr[i+1];
	}
	count--;
	}else{
		out.println("<h3>해당 값을 찾을 수 없습니다 </h3>");
	}
}else if (btn == 3){
	// 배열 삽입 
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	if(idx < arr.length && idx >= 0 ){
		if(count < arr.length && count >= 0 ){
		 
			for(int i=count; i>idx; i--){
				arr[i] = arr[i-1];
			}
			
			arr[idx] = num;
			count++;
	
		}else{
			out.print("<h3> 배열의 길이의 범위가 아닙니다 </h3>");
		}
		}else{
			out.println("<h3>해당 위치에는 값 삽입이 불가능합니다 </h3>");
		}
	}

session.setAttribute("arr", arr);
session.setAttribute("count", count);
out.println ("arr 배열 <br>");
for(int i=0; i<count; i ++ ){
	out.print(+ arr[i] +"  ");
}


} else{
	
	%>
	<button onclick="<%session.invalidate();%>">배열 초기화</button>
	<%
}

%>
	<br>
	<br>
	<button onclick="location.href='Array01.jsp'">뒤로 가기</button>

</body>
</html>