package _03_join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/loginAction")
public class loginAction extends HttpServlet {	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		reqPro(request , response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request , response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("아이디 : " + id);
		System.out.println("패스워드 : " + pw);
		
	
		/*request.setAttribute("id", id);
		request.setAttribute("pw", pw);*/
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		String str = (String) session.getAttribute("ID");
		System.out.println(str);
			
		RequestDispatcher dis = request.getRequestDispatcher("03_servlet/04_loginView.jsp");
		dis.forward(request, response);
	}
}


