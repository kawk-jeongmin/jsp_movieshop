package control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.*;

public class deleteItemController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = "front?command=home";
		
		// 로그인 여부 확인
		HttpSession session = request.getSession(false);
		// 로그인 상태이면, 아이템 삭제 후, url을 바꿔준다.
		if (session != null && session.getAttribute("user") != null) {
			// dto : 로그인 정보
			User user 
				= (User) session.getAttribute("user");
			// itemNo : cart.jsp에서 보낸 itemNo
			String itemNo = request.getParameter("no");
			
			//dto에서 CartBean을 얻어와서, 그 안에있는 removeItem을 이용해 
			//itemList에 있는 dto를 삭제한다.
			user.getCart().removeItem(itemNo);
			
			// 다시 장바구니로 보내준다.
			url = "redirect:front?command=cartview";
		} 
		
		return url;
	}
	

}
