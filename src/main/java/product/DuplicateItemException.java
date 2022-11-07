package product;

public class DuplicateItemException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public DuplicateItemException() {
		super("상품이 중복되어 장바구니에 추가할 수 없습니다");
	}

}
