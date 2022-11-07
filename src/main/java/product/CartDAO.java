package product;

import java.util.*;

public class CartDAO {
	private ArrayList<Product> itemList = new ArrayList<Product>();
	
	public ArrayList<Product> getItemList(){
		return itemList;
	}

	public int findIndexByNo(String No) {
		int index = -1;
		
		for(int i=0; i<itemList.size(); i++) {
			if (itemList.get(i).getNo().contentEquals(No)) {
				index = i;
				break;
			}
		}
		return index;
	}
	
	//상품 추가 메소드
	public void addItem(Product product) throws DuplicateItemException {
		if(findIndexByNo(product.getNo()) != -1) {
			throw new DuplicateItemException();
		}
		itemList.add(product);
	}
	
	//상품 삭제 메소드
	public void removeItem(String no) {
		int index = findIndexByNo(no);
		itemList.remove(index);
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "CartDAO [itemList=" + itemList + "]";
	}
	
	
}
