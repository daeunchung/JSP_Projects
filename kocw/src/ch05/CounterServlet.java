package ch05;
/* JSP 의 속성(Attribute)를 학습하기에 적합한 간단한 프로그램 - 웹 페이지 방문자 수
 * Counter.java 파일의  Counter 클래스를 이용하여 ServletContext 객체에 binding
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CounterServlet")
public class CounterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<H1>Counter test</H1>");
		ServletContext sc = getServletContext();	// 보통 파라미터 초기화에 사용
		Counter cnt = (Counter)sc.getAttribute("counter");
		// ServletContext 객체의  getAttribute 메서드를 이용해서 Counter 객체 cnt 에게 counter를 줌

		if(cnt == null) {
			cnt = new Counter();
		}
		cnt.addCount();
		out.println("<p>당신은" + cnt.getCount() + "번째 사용자입니다.</p>");
		sc.setAttribute("counter", cnt);
		// 현재의 cnt 를 counter 라는 이름으로 저장
		
	}

}
