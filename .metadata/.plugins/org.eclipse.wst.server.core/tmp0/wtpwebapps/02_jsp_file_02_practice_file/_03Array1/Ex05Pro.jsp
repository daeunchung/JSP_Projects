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

int[] arr = {10, 20, 30, 40, 50};
int[] hakbuns = {1001, 1002, 1003, 1004, 1005};
int[] scores  = {  87,   11,   45,   98,   23};

int question = 0;
if(request.getParameter("question")==null){
	question =1;
} else{
	question =Integer.parseInt(request.getParameter("question"));
	
}

System.out.println("question" + question);
if(question == 1){
	int idx1 = Integer.parseInt(request.getParameter("num1"));
	int idx2 = Integer.parseInt(request.getParameter("num2"));
	int temp = arr[idx1];
	arr[idx1] = arr[idx2];
	arr[idx2] = temp;
	%>
	<h2> 문제 1  결과값  </h2>

	<%
	for(int i =0; i < arr.length; i++){
	     out.print(arr[i] + " ");
	}
	question++;
	
	%>
	<br><br>
	<button onclick="location.href='Ex05.jsp?question=<%=question%>'"> 다음 문제 </button>
	
	<%

}

else if(question == 2){
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int idx1 =0;
	int idx2 =0;
	for(int i=0; i<5; i++) {
		if(arr[i] == num1) {
			idx1 = i;
		}
		if(arr[i] == num2) {
			idx2 = i;
		}
	}
	int temp = arr[idx1];
	arr[idx1] = arr[idx2];
	arr[idx2] = temp;

	for(int i =0; i < arr.length; i++){
	     out.print(arr[i] + " ");
	}
	question++;
	
	%>
	<br><br>
	<button onclick="location.href='Ex05.jsp?question=<%=question%>'"> 다음 문제 </button>
	<%
}

else if(question == 3){
	%>
	<pre>
	int[] hakbuns = {1001, 1002, 1003, 1004, 1005};
	int[] scores  = {  87,   11,   45,   98,   23};
	</pre>
	<%
	int stuNo1 = Integer.parseInt(request.getParameter("num1"));
	int stuNo2 = Integer.parseInt(request.getParameter("num2"));
	
	int idx1 = 0;
	int idx2 = 0;
	
	for(int i=0; i<5; i++) {
		if(hakbuns[i] == stuNo1) {
			idx1 = i;
		}
		if(hakbuns[i] == stuNo2) {
			idx2 = i;
		}
	}
	int temp = scores[idx1];
	scores[idx1] = scores[idx2];
	scores[idx2] = temp;

   for(int i =0; i < hakbuns.length; i++){
    
	     out.print(hakbuns[i] + " : " + scores[i]  + " <br> ");
   }
	question++;
	%>

	<br><br>
	<button onclick="location.href='Ex05.jsp?question=<%=question%>'"> 다음 문제 </button>
	<%
}

%> 

</body>
</html>