<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
button {
	margin: 5px 0;
	padding: 3em 5em;
	font-size: 13px;
}
</style>
</head>
<body>
	<%
		int[] board;
		String player;
		String box = "";
		int winner =0;
		if (request.getParameter("player") == null) {
			board = new int[9];
			player = "P2";
			winner=0;
			session.setAttribute("board", board);
		} else {
			board = (int[]) session.getAttribute("board");
			player = request.getParameter("player");
			int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
			System.out.println(); 
			System.out.println("================================="); 
			System.out.println(); 
			
			if(winner == 0){
			for(int i=0; i<board.length; i++){	
				winner=0;
				System.out.print( i + "=   " + board[i] + "  "); 
				if (i % 3 == 0) {
					System.out.println("player=  " + player + "   "+ i + " / "+ (i+1)  + " / "+ (i+2)   );
					if( board[i] == 1 && board[i+1] == 1 && board[i+2] == 1 ){
						System.out.println("승리자 p1");
						winner=1;
						player = "P1";
						break; 
					}
					
					if( board[i] == 2 && board[i+1] == 2 && board[i+2] == 2){
						System.out.println("승리자 p2");
						winner=1;
						player = "P2";
						break; 
					}
					
				}else continue;
				System.out.println(); 	
				} // for
			}
			
			if(winner == 0){
			for(int i=0; i<3; i++){	
				winner=0;
					System.out.println("player=  " + player + "   "+ i + " / "+ (i+1)  + " / "+ (i+2)   );
					if( board[i] == 1 && board[i+3] == 1 && board[i+6] == 1 ){
						System.out.println("승리자 p1");
						winner=1;
						player = "P1";
					
						break; 
					}
					
					if( board[i] == 2 && board[i+3] == 2 && board[i+6] == 2){
						System.out.println("승리자 p2");
						winner=1;
						player = "P2";
				
						break; 
					}
				}
			}//for
 
			if(winner == 0){
				if(board[0] == 1 && board[4] == 1 && board[8] == 1) {
					winner = 1;
					player = "P1";
				}
				if(board[0] == 2 && board[4] == 2 && board[8] == 2) {
					winner = 1;
					player = "P2";
				}
				if(board[2] == 1 && board[4] == 1 && board[6] == 1) {
					winner = 1;
					player = "P1";
				}
				if(board[2] == 2 && board[4] == 2 && board[6] == 2) {
					winner = 1;
					player = "P2";
				}
				}
			
			if (winner == 0) {
				if (player.equals("P1")) {
					player = "P2";
					board[boardIdx] = 1;
				} else if (player.equals("P2")) {
					player = "P1";
					board[boardIdx] = 2;
				}
				session.setAttribute("board", board);
	
			} else {
                   %>
	<h2>
		승리자는
		<%=player %>
		입니다!
	</h2>
	<br>
	<button onclick="location.href='TicTacToe.jsp'">리셋</button>
	<br>
	<%
			}
		} //else

		for (int i = 0; i < board.length; i++) {

			if (board[i] == 0) {
				box = " _ ";
			} else if (board[i] == 1) {
				box = " O ";
			} else if (board[i] == 2) {
				box = " X ";
			}
	%>
	<button
		onclick="location.href='TicTacToe.jsp?player=<%=player%>&boardIdx=<%=i%>'"
		<% if(board[i]!=0){ %> disabled <%  } %>><%=box%>
	</button>
	&nbsp;&nbsp;
	<%
		if ((i + 1) % 3 == 0) {
				out.println("<br>");
			}
		} //for
	%>
	<br>
	<br>
	<br>


</body>
</html>