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

@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<center><h2>선택한 상품 목록</h2>");
		out.println("<hr>");
		HttpSession session = request.getSession();
		ArrayList<?> list = (ArrayList<?>)session.getAttribute("productlist");
		if(list == null) {
			out.println("선택한 상품이 없습니다.!");
		}else {
			for(Object product : list) {
				out.println(product + "<br>");
			}
			out.println("</center>");
		}
	}

}
