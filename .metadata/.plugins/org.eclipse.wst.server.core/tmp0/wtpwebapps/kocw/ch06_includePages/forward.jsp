<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
�ȳ� �� ����ڵ�1�̾�
�ȳ� �� ����ڵ�2�̾�
�ȳ� �� ����ڵ�3�̾�
�ȳ� �� ����ڵ�4�̾�
�ȳ� �� ����ڵ�5�̾�
�ȳ� �� ����ڵ�6�̾�
 
<jsp:forward page="shopping.jsp">
        <jsp:param value="name" name="name" />
        <jsp:param value="address" name="address" />
</jsp:forward>
        
</body>
</html>

<%--
forward �׼� �±װ� �ùٸ��� �����ϱ� ���ؼ��� forward �׼� �±׸� �����ϱ� ���� �� �������� �����Ͱ� ���۵Ǹ� �ȵȴ�. 
���� ��� ���۸� �÷����� ���Ŀ� forward �׼� �±׸� �����ϸ� ���� �帧�� �̵��ϴµ� �����Ѵ�. 
����ϰ� ���� �Ӽ��� none���� �ؼ� ���۸� ������� �ʴ� ��쿡�� forward �׼� �±״� ����� �������� �ʴ´�.

url �ּҰ� shopping.jsp �� �ƴ� forward.jsp�� ���� Ȯ���� �� �ִ�.  
forward �׼� �±״� ���� �����Ų jsp ������ ���¸� ��ȭ ��ų�� ���� ������ �ִ� ��ġ�� ��ȭ��Ű�� �ʱ� �����̴�.
�׸��Ͽ� , 
forward �׼� ���Ŀ� ������ url �� forward.jsp �̰� ������ ����(�Ӽ�)�� shopping.jsp �� ���̴�. 


* <jsp:param> �׼� �±׸� �̿��ؼ� �̵��� �������� �Ķ���� �߰��ϱ�   --%>