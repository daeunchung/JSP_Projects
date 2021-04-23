package ch10;
/* [�⺻�ǽ�] ǥ������� �⺻ ����
Product.java 	: ��ǰ ������ �����ϴ� ���� Ŭ������ jsp�� �����͸� ����
ProductList.jsp	: ��ǰ ����� ����ϴ� jsp ���� , Product Ŭ�����κ��� ��ǰ ����� ������ ���
ProductSel.jsp	: ProductList.jsp ���� ��ǰ�� �����ϰ� <Ȯ��> ��ư�� �������� ȣ��Ǵ� jsp , 
				   ǥ���� �̿��� ������  ���	*/

public class Product {
	private String[] productList = {"item1","item2","item3","item4","item5"};

	private int num1 = 10;
	private int num2 = 20;
	public int getNum1(){ return num1; }
	public int getNum2() { return num2; }
	public String[] getProductList() { return productList; }
}

/* ������1 (�ν��Ͻ����:ProductList.jsp) , ������2(ǥ�������:ProductSel.jsp)
 * ${ param.sel }�� param�� ǥ�� ���� request.getParameter()ó�� HTML ���� ����� ���� �����ϴ�
���尴ü��, param.sel�� request.getParameter(sel) �� �����ϴ�.

${product.num1 + product.num2 }����, ������ 1���� ����� �ν��Ͻ����� product�� ����Ͽ�
����� (num1, num2)�� ������ �� ������ �����ش�.
������2 �� ProductSel������ product �ν��Ͻ��� �� �� ������ �ռ� ������1���� ����߱⿡ ��� �����ϴ�. */
