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
		  예)
		  ###
		  ###
		  ###
		

</pre>
	<% 
		for(int i=0; i<3; i++) {
			for(int j=0; j<3; j++) {
				out.print("#");
			}
			out.println("<br>");
		}
		out.println("<br>");
		%>
	<pre> 
    문제 1)
		  #
		  ##
		  ###
		 </pre>


	<%		for(int i=0; i<3; i++) {
	for(int j=0; j<=i; j++) {
		out.print("#");
	}
	out.println("<br>");
}
	out.println("<br>");
 %>
	<pre>
      문제 2)
		  ###
		  ##
		  #
		 </pre>

	<% 		for(int i=0; i<3; i++) {
			for(int j=3; j>i; j--) {
				out.print("#");
			}
			out.println("<br>");
		}
		
	out.println("<br>"); %>

	<pre>
    문제 3)
		  @##
		  @@#
		  @@@
		 </pre>


	<% 		for(int i=0; i<3; i++) {
			for(int j=0; j<=i; j++) {
				out.print("@");
			}
			for(int j=2; j>i; j--) {
			     out.print("#");
			}
			out.println("<br>");
		}
		
	out.println("<br>");%>

	<pre>	
	 문제 4)
		    #
		   ###
		  #####
		 </pre>

	<%		int k = 0;
	out.print("&nbsp;");	
	for(int i=0; i<3; i++) {
				for(int j=2; j>i; j--) {
					out.print("&nbsp;&nbsp;	");
				}
				for(int j=0; j<=k; j++) {
					out.print("#");
				}
				out.println("<br>");
				k += 2;
			} %>


</body>
</html>