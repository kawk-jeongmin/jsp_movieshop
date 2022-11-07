package control;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;

}
	public Controller create(String command) {
		Controller controller=null;
//		if(command.contentEquals("home")) {
//			controller=new HomeController();
//		}
//		else if(command.contentEquals("ItemDetail")) {
//			controller=new ItemDetailController();
//		}
//		else if(command.contentEquals("login")) {
//			controller=new LoginController();
//		}
//		else if(command.contentEquals("logout")) {
//			controller=new LogoutController();
//		}
//		else if(command.contentEquals("registerItemForm")) {
//			controller=new RegisterItemFormController();
//		}
//		else if(command.contentEquals("RegisterItem")) {
//			controller=new RegisterItemController();
//		}
//		else if(command.contentEquals("RegisterItemResult")) {
//			controller=new RegisterItemResultController();
//		}
		// 장바구니 담기 기능
		if(command.contentEquals("addcart")) {
			controller=new AddCartController();
		}
		// 장바구니 보기 기능
		else if(command.contentEquals("cartview")) {
			controller=new CartViewController();
		}
		// 장바구니에 있는 상품 삭제 기능
		else if(command.contentEquals("deleteCart")) {
			controller=new deleteItemController();
		}
		return controller;
	}
}
