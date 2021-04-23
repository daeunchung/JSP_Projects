<%-- 상품 선택 화면 , 리스트에서 원하는 상품을 선택하고 추가 버튼을 눌러 상품 추가
Request 객체를 이용해 로그인 이름을 가져와 세션에 저장
상품을 선택할 수 있는 <select> 창을 만든 후 목록을 선택한 뒤 추가를 누르면 add.jsp 로 전달
이때 <select> 의 name 속성은  product --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
 
        String name = request.getParameter("name");
        //request.getSession().setAttribute("userName", name);
 
        session.setAttribute("login", name);
    %>
    <% if (name == "") {
    %><script>
        alert("로그인을 다시 해주세요");
        history.back();
    </script>
    <%
        } else { %>
    <div align="center">
        <h1>상품 추가 리스트</h1>
        <hr>
        <%=request.getSession().getAttribute("login")%>님이 입장 하셨습니다!!
        <hr>
        <form method=post action=add.jsp>
            <select name="product">
                <option value="사과">사과</option>
                <option value="포도">포도</option>
                <option value="레몬">레몬</option>
                <option value="복숭아">복숭아</option>
            </select> <input value="추가" type="submit"> <br>
            <br>
            <br> <a href="checkOut.jsp" name="add">계산</a>
        </form>
        <br><br>
        <% }
        %>
 
    </div>
</body>
</html>
