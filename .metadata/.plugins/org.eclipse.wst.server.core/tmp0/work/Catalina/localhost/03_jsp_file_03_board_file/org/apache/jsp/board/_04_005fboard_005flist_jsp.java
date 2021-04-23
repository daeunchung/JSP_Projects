/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2020-09-22 02:57:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import board.Board;
import java.util.ArrayList;
import board.BoardDAO;

public final class _04_005fboard_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("board.Board");
    _jspx_imports_classes.add("board.BoardDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("\t<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\t\t<title>04_board_list.jsp</title>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t");

		String strPageSize = (String)session.getAttribute("pageSize");
		if(strPageSize == null){
			strPageSize = "5";
		}
		int pageSize = Integer.parseInt(strPageSize);
		
		int count = BoardDAO.getInstance().getAllCount();
	
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int curPage = Integer.parseInt(pageNum);
		
		int startRow = (curPage - 1) * pageSize;
		int endRow = startRow + pageSize;
		if(endRow > count) endRow = count;
		
		int number = count - (curPage - 1) * pageSize;
		
		ArrayList<Board> boardList = BoardDAO.getInstance().getAllBoard(startRow, endRow); 
	
      out.write("\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<div align=\"left\">\r\n");
      out.write("\t\t\t<form method=\"post\" action=\"12_board_dummyPro.jsp\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"dummyCount\" size=\"5\" />\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"더미파일 추가하기\" />\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div align=\"right\">\r\n");
      out.write("\t\t\t<form method=\"post\" action=\"13_board_pageCountPro.jsp\">\r\n");
      out.write("\t\t\t\t<select name=\"pageSize\">\r\n");
      out.write("\t\t\t\t\t<option value=\"5\">5개씩</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"10\">10개씩</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"15\">15개씩</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"20\">20개씩</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"30\">30개씩</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"40\">40개씩</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"50\">50개씩</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"페이지 게시글 수 수정하기\" />\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<hr>\r\n");
      out.write("\t\t<div align=\"center\">\r\n");
      out.write("\t\t\t<h2>전체 게시글 보기[");
      out.print( count );
      out.write("개]</h2>\r\n");
      out.write("\t\t\t<form>\r\n");
      out.write("\t\t\t\t<table border=\"1\">\r\n");
      out.write("\t\t\t\t\t<tr height=\"40\">\r\n");
      out.write("\t\t\t\t\t\t<td align=\"right\" colspan=\"5\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" value=\"글쓰기\" onclick=\"location.href='02_board_write.jsp'\" />\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr height=\"40\">\r\n");
      out.write("\t\t\t\t\t\t<td width=\"50\" align=\"center\">번호</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"320\" align=\"center\">제목</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100\" align=\"center\">작성자</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"150\" align=\"center\">작성일</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"50\" align=\"center\">조회수</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

					for(int i=0; i<boardList.size(); i++){
						Board board = boardList.get(i);
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr height=\"40\">\r\n");
      out.write("\t\t\t\t\t\t<td width=\"50\" align=\"center\">");
      out.print( number-- );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"100\">\r\n");
      out.write("\t\t\t\t\t\t");
 
							if(board.getReStep() > 1){
								for(int j=0; j<(board.getReStep()-1)*5; j++){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t&nbsp;\r\n");
      out.write("\t\t\t\t\t\t");
			
								}
							} 
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"05_board_info.jsp?num=");
      out.print( board.getNum() );
      out.write('"');
      out.write('>');
      out.print( board.getSubject() );
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"320\" align=\"center\">");
      out.print( board.getWriter() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"150\" align=\"center\">");
      out.print( board.getRegDate() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"50\" align=\"center\">");
      out.print( board.getReadcount() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t");

						if(count > 0){
							int size = 3;
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							
							int startPageNum = 1;
							if(curPage % size != 0){
								startPageNum = (curPage / size) * size + 1;
							}else{
								startPageNum = ((curPage / size) - 1) * size + 1;
							}
							int endPageNum = startPageNum + size -1;
							if(endPageNum > pageCount) endPageNum = pageCount;
							
							if(startPageNum > size){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"04_board_list.jsp?pageNum=");
      out.print( startPageNum - size );
      out.write("\">[이전]</a>\r\n");
      out.write("\t\t\t\t\t");
		
						}
						
							for(int i=startPageNum; i<=endPageNum; i++){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"04_board_list.jsp?pageNum=");
      out.print( i );
      out.write('"');
      out.write('>');
      out.write('[');
      out.print( i );
      out.write("]</a>\r\n");
      out.write("\t\t\t\t\t");

							}
						
							if(endPageNum < pageCount){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"04_board_list.jsp?pageNum=");
      out.print( startPageNum + size );
      out.write("\">[이후]</a>\r\n");
      out.write("\t\t\t\t\t");

							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t</p>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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