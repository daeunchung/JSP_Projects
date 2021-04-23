package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;


@WebServlet("/ReWriteProAction")
public class ReWriteProAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*System.out.println(request.getParameter("writer"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("password"));
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("ref"));
		System.out.println(request.getParameter("re_step"));
		System.out.println(request.getParameter("re_level"));*/
		
		request.setCharacterEncoding("UTF-8");
		
		BoardBean bean = new BoardBean();
		bean.setWriter(request.getParameter("writer"));
		bean.setSubject(request.getParameter("subject"));
		bean.setEmail(request.getParameter("email"));
		bean.setPassword(request.getParameter("password"));
		bean.setContent(request.getParameter("content"));
		
		bean.setRef(Integer.parseInt(request.getParameter("ref")));
		bean.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bean.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.reWriteBoard(bean);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListAction");
		dis.forward(request, response);
	}
}
