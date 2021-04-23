<%-- 09_bookUpdatePro.jsp --%>
<%@page import="_05_bookstore.BookDTO"%>
<%@page import="_05_bookstore.BookDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String realFolder = "";		// 웹 어플리케이션상의 절대 경로
	String filename="";
	MultipartRequest imageUp = null;
	
	String saveFolder = "_05_bookstore/imageFile";	// 파일이 업로드되는 폴더 지정
	String encType = "utf-8";			// 인코딩 타입
	int maxSize = 2 * 1024 * 1024;		// 최대 업로드될 파일크기 5MB
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	System.out.println("realFolder = " + realFolder);
	
	try{
		// 전송을 담당할 컴포넌트를 생성하고 파일을 전송
		// 전송할 파일명 = 가지고 있는 객체, 서버상의 절대경로, 업로드될 파일크기, 인코딩타입, 기본보안적용
		imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		// 전송한 파일 정보를 가져와 출력
		Enumeration files = imageUp.getFileNames();
		
		// 파일 정보가 있다면
		while(files.hasMoreElements()){
			// input 태그의 속성이 file인 태그의 name속성 값: 파라미터 이름
			String name = (String)files.nextElement();
		
			// 서버에 저장된 파일 이름
			filename = imageUp.getFilesystemName(name);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%
	int book_id = Integer.parseInt(imageUp.getParameter("book_id"));

	String book_kind = imageUp.getParameter("book_kind");
	String book_title = imageUp.getParameter("book_title");
	String book_price = imageUp.getParameter("book_price");
	String book_count = imageUp.getParameter("book_count");
	String author = imageUp.getParameter("author");
	String publishing_com = imageUp.getParameter("publishing_com");
	String book_content = imageUp.getParameter("book_content");
	String discount_rate = imageUp.getParameter("discount_rate");
	
	String year = imageUp.getParameter("publishing_year");
	
	String month = "";
	if(imageUp.getParameter("publishing_month").length() == 1){
		month = month + "0" + imageUp.getParameter("publishing_month");
	}else{
		month = imageUp.getParameter("publishing_month");
	}
	
	String day = "";
	if(imageUp.getParameter("publishing_day").length() == 1){
		day = day + "0" + imageUp.getParameter("publishing_day");
	}else{
		day = imageUp.getParameter("publishing_day");
	}

	BookDTO dto = new BookDTO();
	dto.setBook_kind(book_kind);
	dto.setBook_title(book_title);
	dto.setBook_price(Integer.parseInt(book_price));
	dto.setBook_count(Integer.parseInt(book_count));
	dto.setAuthor(author);
	dto.setPublishing_com(publishing_com);
	dto.setPublishing_date(year + "-" + month + "-" + day);
	
	if(filename != null){
		dto.setBook_image(filename);
	}else{
		dto.setBook_image("nothing.jpg");
	}
	
	dto.setBook_content(book_content);
	dto.setDiscount_rate(Integer.parseInt(discount_rate));
	
	BookDAO dao = BookDAO.getInstance();
	dao.updateBoard(dto, book_id);
	
	response.sendRedirect("10_bookList.jsp?book_kind=" + book_kind);
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>관리자 책정보 수정</title>
	</head>
	<body>
	
	</body>
</html>