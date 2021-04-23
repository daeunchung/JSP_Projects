package ch05;

/*
 * ServletContext ��ü
 * �ϳ��� web application ���� �ϳ��� ServletContext ��ü�� �����Ѵ�.
 * ������ container �� ���õ� ������ servlet ���� �����Ѵ�
 * ���Ե� ��� �������� �ʱ� �Ķ���͸� ������ �� �����ϴ�
 * 						ServletContext
 * 					  /			|		  \
 * 					 /          |          \
 * 					/			|			\
 * 		ServletConfig	ServletConfig		ServletConfig	
 * 			|					|				  |
 *  	 servlet			 servlet			servlet
 * 
 * 
 * ServletContext ��ü�� �޼����
 * - ������������
 * getServerInfo() , getMajorVersion()
 * - �����ڿ�����
 * getMimeType(filename) , getResource(path)
 * - �α�
 * log(message)
 * - Attribute : get/setAttribute
 * - Parameter : getInitParameter(name) , getInitParameterNames()
 * 
 * =======> Servlet ���� attribute ���� , �����̳ʿ��� ���� ���� ���� ���
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletContext
 */
@WebServlet("/ServletContext")
public class ServletContext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// �ڵ� ����
}
