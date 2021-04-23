<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addressbook_error.jsp"
    import="projects.*, java.util.*"%>
    
<% request.setCharacterEncoding("utf-8"); %>
    
<%-- JSP 빈즈를 이용하여 DAO 클래스의 객체 선언 (동작 제어를 위한 객체라서 setProperty 필요 X)--%>    
<jsp:useBean id="addrBook" class="projects.AddressBook" />
<%-- JSP 빈즈를 이용하여 DO 클래스의 객체 선언 (정보 이동을 위한)--%>    
<jsp:useBean id="addr" class="projects.AddressBean" />
<%-- JSP 빈즈를 이용하여 주소입력폼에서 전달되어 온 DO클래스의 속성값 불러오기 --%>
<jsp:setProperty property="*" name="addr"/>
    
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	// 요청 파라미터에 따른 동작 처리
	if(action.equals("list")){	// 주소록 목록 요청 (DAO클래스의 메서드 읽어서 목록 가져오기, 가져온 목록을 View 에 전달)
		// 1. DB에서 읽어오는 작업    2. 속성관리를 통해 내장객체에 저장해주는 작업      3. 해당 페이지 불러주기
		ArrayList <AddressBean> addresses = addrBook.getAddrList();
		request.setAttribute("addrs", addresses); // 내장객체의 속성으로 set 해놓기
		pageContext.forward("addrList.jsp");     // 페이지 이동시켜주기 (addrList.jsp 에서 request.getAttribute로  ArrayList 속 내용을 읽어올 수 있다.)
	}
	
	else if(action.equals("insert")){	// 주소 등록 요청
		if(addrBook.insertAddr(addr)){
			// 입력에 성공한 경우, Controller를 경유하여 목록페이지 호출
			response.sendRedirect("addrController.jsp?action=list");
			// response.sendRedirect("default.jsp");
		}else{
			// 입력에 실패한 경우에는 예외 발생
			throw new Exception("새로운 주소 등록에 실패했습니다.");
		}
	}
	
	else if(action.equals("modify")){	// 주소 수정 페이지 요청
		// id 값을 이용하여 기존 주소록의 값을 불러옴
		// addrController.jsp?action=modify&id=1&pwd=1234
		AddressBean m_addr = addrBook.getAddr(Integer.parseInt(request.getParameter("id")));
		
		// 전달해온 비밀번호 추출
		String pwd = (String)request.getParameter("pwd");
		// out.println(pwd);
		// 입력한 관리자 비밀번호가 강제로 설정한 "1234" 와 일치하는지 확인
		if(pwd.equals("1234")){
			// out.println("비밀번호 일치");
			// 데이 터베이스로부터 읽은 정보를 수정 폼에 전달
			request.setAttribute("addr", m_addr);
			pageContext.forward("addrModify.jsp");
		} else {
			// out.println("비밀번호 불일치");
			// 비밀번호 불일치, 이전 페이지로 이동
			out.println("<script>alert('비밀번호가 틀렸습니다!'); " + "history.go(-1); </script>");
		}
	}
	
	else if(action.equals("update")){	// 수정된 주소로 등록 요청
		// 테스트
		// out.println(addr.getName() + ":" + addr.getEmail() + ":" + addr.getTel() + ":" 
		//	+ addr.getBirth() + ":" + addr.getCompany() + ":" + addr.getMemo() + ":" + addr.getId());
	
		// 전달되어온 정보를 이용하여 주소 수정
		if(addrBook.modifyAddr(addr)){
			out.println("success");
			response.sendRedirect("addrController.jsp?action=list");
			// response.sendRedirect("default.jsp");
		} else{
			// out.println("fail");
			throw new Exception("주소 수정에 실패하였습니다.");
		}
	}
	
	else if(action.equals("delete")){	// 주소 삭제요청
		// 전달되어온 정보를 이용하여 주소 삭제
		if(addrBook.deleteAddr(addr.getId())){
			response.sendRedirect("addrController.jsp?action=list");
			// response.sendRedirect("default.jsp");
		} else{
			throw new Exception("주소 삭제에 실패하였습니다.");
		}
	}else{	// 잘못된 액션 요청
		
	}
%>