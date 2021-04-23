package ch05;

/*
 * ServletContext 객체
 * 하나의 web application 마다 하나의 ServletContext 객체가 존재한다.
 * 서버가 container 에 관련된 정보를 servlet 에게 제공한다
 * 포함된 모든 서블릿에게 초기 파라미터를 제공할 때 유용하다
 * 						ServletContext
 * 					  /			|		  \
 * 					 /          |          \
 * 					/			|			\
 * 		ServletConfig	ServletConfig		ServletConfig	
 * 			|					|				  |
 *  	 servlet			 servlet			servlet
 * 
 * 
 * ServletContext 객체의 메서드들
 * - 서버정보관련
 * getServerInfo() , getMajorVersion()
 * - 서버자원정보
 * getMimeType(filename) , getResource(path)
 * - 로깅
 * log(message)
 * - Attribute : get/setAttribute
 * - Parameter : getInitParameter(name) , getInitParameterNames()
 * 
 * =======> Servlet 간의 attribute 공유 , 컨테이너와의 연결 등을 위해 사용
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
       
	// 코드 생략
}
