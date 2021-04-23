package ch05_shoppingcart;
// Session 을 Attribute 하여 각 클라이언트마다 분리된 저장영역이 있으면서 페이지를 자유롭게 돌아다녀도 정보가 공유되어 장바구니가 가능한 원리

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SelectProduct")
public class SelectProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
			
		PrintWriter out = response.getWriter();
		out.println("<center>");
		out.println("<h2>상품선택<h2>");
		out.println("<hr>");
		out.println(username + "님이 로그인한 상태입니다.");
		out.println("<form name=form2 method=post action='AddProduct'>");
		out.println("<select name='product'>");
		out.println("<option>apple</option>");
		out.println("<option>orange</option>");
		out.println("<option>lemon</option>");
		out.println("</select>");
		out.println("<input type=submit value=추가 />");
		out.println("</form>");
		out.println("<a href='CheckOut'>결제</a>");
		out.println("</center>");
	}

}
