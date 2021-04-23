package ch05;
/*
 * Servlet ���� �پ��� ��ü���� �����ϴµ� ServletConfig ��ü�� �˾ƺ���.
 * 
 * ServletConfig ��ü
 * - ������ �ʱ�ȭ�� �� ���� ������ �����ؼ� �����Ǵ� ��ü
 * - Container �� ���� �����Ǿ� Servlet ���� ���޵�.
 * - web.xml ���� <init-param> �� �о ServletConfig �� ����
 * 
 * ServletConfig ��ü�� �޼���
 * - getInitParameter(name) 	: �Ķ���� �� name �� ������ value ����
 * - getInitParameterNames() 	: �Ķ������ name ���� ��� Enumeration ���� ����
 * - getServletContext			: ServletContext ��ü ���� 
 * 
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet(urlPatterns = {"/EmailServlet"},
initParams = {@WebInitParam(name = "adminEmail" , value = "admin@naver.omc"),
		@WebInitParam(name = "myEmail" , value = "skyblue5023@naver.com")})
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("test init parameters<br>");
		
		ServletConfig sc = getServletConfig();
		Enumeration<?> e = sc.getInitParameterNames();
		while(e.hasMoreElements()) {
			out.println("param name = " + e.nextElement() + "<br>");
		}
		out.println("Admin email : " + sc.getInitParameter("adminEmail"));
		out.println("<br>");
		out.println("My email : " + sc.getInitParameter("myEmail"));
	}

}
