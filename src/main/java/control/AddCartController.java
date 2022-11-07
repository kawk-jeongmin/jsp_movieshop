package control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.*;
import user.*;

public class AddCartController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String url =  "redirect:/front?command=home";
		
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			User user 
				= (User) session.getAttribute("user");
			// 2. 세션에 할당된 값 유무 확인
			if (user != null) {
				//item-detail.jsp에서 itemNo 가져오기
				String no = request.getParameter("no");
				//itemNo를 통해 itemDTO 객체 만들기
				Product product = product.getInstance().findItemByNo(no);
				
				//로그인되어있는 것 확인 후, 
				// 1. 카트 생성 (getCart)
				// 2. 아이템 추가(addItem) : 중복여부 체크함
				
				try { // 중복이 아닐 경우
					user.getCart().addItem(product);
					url = "/item/addcart.jsp";
				} catch (DuplicateItemException de) { // 중복일 경우
					url = "/item/duplicate_cart.jsp";
				}
				
			}
		}
		return url;
	}
	

}
