/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2020-10-20 11:53:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ch07_005fBeansAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ch07.AddrBean;

public final class addrList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("ch07.AddrBean");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("<!-- import 문장은 ch07 내부에 정의된 클래스를 포함함을 지정 -->\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!-- 빈즈 선언 : 저장된 게시글을 가져오기 위함 -->\r\n");
      out.write("<!-- 범위(scope)를 application으로 정의, 톰캣 종료시까지 유지 , 서버가 동작하는한 죽지 않아-->\r\n");
      ch07.AddrManager am = null;
      synchronized (application) {
        am = (ch07.AddrManager) _jspx_page_context.getAttribute("am", javax.servlet.jsp.PageContext.APPLICATION_SCOPE);
        if (am == null){
          am = new ch07.AddrManager();
          _jspx_page_context.setAttribute("am", am, javax.servlet.jsp.PageContext.APPLICATION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>주소록 관리</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div align=\"center\">\r\n");
      out.write("<h2>주소록</h2>\r\n");
      out.write("<hr>\r\n");
      out.write("<a href=\"addrForm.html\">주소추가</a><P>\r\n");
      out.write("<table border=\"1\" style=\"width:500px; text-align: center\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t \t<th>이름</th>\r\n");
      out.write("\t \t<th>전화번호</th>\r\n");
      out.write("\t \t<th>이메일</th>\r\n");
      out.write("\t \t<th>성별</th>\r\n");
      out.write("\t</tr>\r\n");
      out.write(" \t<tr>\r\n");
      out.write(" \t");

 		// 주소록 관리 DAO 클래스로 생성한 객체의 getAddrList() 메서드를 실행,
 		// 주소록 목록을 가지면서 모든 자료를 순회하며 처리
 		 for(AddrBean ab : am.getAddrList()){
 	
      out.write("\r\n");
      out.write(" \t\t");
      out.write("\r\n");
      out.write(" \t\t<td>");
      out.print(ab.getUsername() );
      out.write("</td>\r\n");
      out.write(" \t\t<td>");
      out.print(ab.getTel() );
      out.write("</td>\r\n");
      out.write(" \t\t<td>");
      out.print(ab.getEmail() );
      out.write("</td>\r\n");
      out.write(" \t\t<td>");
      out.print(ab.getGender() );
      out.write("</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
 
	 	}
	
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<!-- 주소록 목록 출력 , application 내장객체 활용하여 AddrManager 객체의 데이터 읽어 옴 -->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
