package ch05_shoppingcart;
// Session �� Attribute �Ͽ� �� Ŭ���̾�Ʈ���� �и��� ���念���� �����鼭 �������� �����Ӱ� ���ƴٳ൵ ������ �����Ǿ� ��ٱ��ϰ� ������ ����

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
		out.println("<h2>��ǰ����<h2>");
		out.println("<hr>");
		out.println(username + "���� �α����� �����Դϴ�.");
		out.println("<form name=form2 method=post action='AddProduct'>");
		out.println("<select name='product'>");
		out.println("<option>apple</option>");
		out.println("<option>orange</option>");
		out.println("<option>lemon</option>");
		out.println("</select>");
		out.println("<input type=submit value=�߰� />");
		out.println("</form>");
		out.println("<a href='CheckOut'>����</a>");
		out.println("</center>");
	}

}
