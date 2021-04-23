package ch05;
/* JSP �� �Ӽ�(Attribute)�� �н��ϱ⿡ ������ ������ ���α׷� - �� ������ �湮�� ��
 * Counter.java ������  Counter Ŭ������ �̿��Ͽ� ServletContext ��ü�� binding
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
		ServletContext sc = getServletContext();	// ���� �Ķ���� �ʱ�ȭ�� ���
		Counter cnt = (Counter)sc.getAttribute("counter");
		// ServletContext ��ü��  getAttribute �޼��带 �̿��ؼ� Counter ��ü cnt ���� counter�� ��

		if(cnt == null) {
			cnt = new Counter();
		}
		cnt.addCount();
		out.println("<p>�����" + cnt.getCount() + "��° ������Դϴ�.</p>");
		sc.setAttribute("counter", cnt);
		// ������ cnt �� counter ��� �̸����� ����
		
	}

}
