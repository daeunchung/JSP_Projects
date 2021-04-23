package ch05_shoppingcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product = request.getParameter("product");
		HttpSession session = request.getSession();
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productlist");
		if(list == null) { 
			list = new ArrayList<String>();
		}
		list.add(product);
		session.setAttribute("productlist", list);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(product + "이(가) 추가되었습니다.");
	}

}
