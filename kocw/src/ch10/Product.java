package ch10;
/* [기본실습] 표현언어의 기본 이해
Product.java 	: 상품 정보를 제공하는 빈즈 클래스로 jsp에 데이터를 공급
ProductList.jsp	: 상품 목록을 출력하는 jsp 파일 , Product 클래스로부터 상품 목록을 가져와 출력
ProductSel.jsp	: ProductList.jsp 에서 상품을 선택하고 <확인> 버튼을 눌렀을때 호출되는 jsp , 
				   표현언어를 이용해 데이터  출력	*/

public class Product {
	private String[] productList = {"item1","item2","item3","item4","item5"};

	private int num1 = 10;
	private int num2 = 20;
	public int getNum1(){ return num1; }
	public int getNum2() { return num2; }
	public String[] getProductList() { return productList; }
}

/* 페이지1 (인스턴스명시:ProductList.jsp) , 페이지2(표현언어사용:ProductSel.jsp)
 * ${ param.sel }중 param은 표현 언어에서 request.getParameter()처럼 HTML 폼에 저장된 값에 접근하는
내장객체로, param.sel은 request.getParameter(sel) 과 동일하다.

${product.num1 + product.num2 }에서, 페이지 1에서 명시한 인스턴스명인 product를 사용하여
멤버들 (num1, num2)에 접근할 수 있음을 보여준다.
페이지2 인 ProductSel에서는 product 인스턴스를 볼 수 없지만 앞서 페이지1에서 명시했기에 사용 가능하다. */
