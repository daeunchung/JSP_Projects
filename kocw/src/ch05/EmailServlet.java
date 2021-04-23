package ch05;
/*
 * Servlet 에는 다양한 객체들이 존재하는데 ServletConfig 객체를 알아본다.
 * 
 * ServletConfig 객체
 * - 서블릿이 초기화될 때 관련 정보를 저장해서 제공되는 객체
 * - Container 에 의해 생성되어 Servlet 에게 전달됨.
 * - web.xml 에서 <init-param> 을 읽어서 ServletConfig 에 저장
 * 
 * ServletConfig 객체의 메서드
 * - getInitParameter(name) 	: 파라미터 중 name 에 연관된 value 리턴
 * - getInitParameterNames() 	: 파라미터의 name 들을 묶어서 Enumeration 으로 리턴
 * - getServletContext			: ServletContext 객체 리턴 
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
