package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardListAction")
public class BoardListAction extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		

		// 화면에 보여질 게시글의 개수를 지정
		int pageSize = 10;
		// 현재 보여지고 있는 페이지의 number 값을 읽어들임
		String pageNumber = request.getParameter("pageNum");
		// null 처리
		if(pageNumber == null) {
			pageNumber = "1";
		}
		// 전체 게시글의 개수
		int count = 0;
		// JSP페이지 내에서 보여질 넘버링 숫자 값을 저장하는 변수 선언
		int number = 0;
		
		// 현재 보여지고 있는 페이지 문자를 숫자로 형변환
		int currentPage = Integer.parseInt(pageNumber);
		// 전제 게시글의 개수를 가져와야 하기에 데이터베이스 객체 생성
		BoardDAO bdao = BoardDAO.getInstance();
		count = bdao.getAllCount();
		
		// 현재 보여질 페이지 시작 번호를 설정
		int startRow = (currentPage - 1) * pageSize;
		
		
		// 최신글 10개를 기준으로 게시글을 리턴 받아주는 메서드 호출
		Vector<BoardBean> v = bdao.getAllBoard(startRow, pageSize);
		number = count - (currentPage - 1) * pageSize;
		
		// BoardList.jsp쪽으로 request객체에 담아서 넘겨줌
		request.setAttribute("v", v);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		/*System.out.println(number);
		System.out.println(pageSize);
		System.out.println(count);
		System.out.println(currentPage);*/
		
		
		RequestDispatcher dis = request.getRequestDispatcher("02_boardList.jsp");
		dis.forward(request, response);
	}


}
