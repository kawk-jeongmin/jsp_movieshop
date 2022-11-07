package user;

import product.CartDAO;

public class User {
	private String userID;
	private String userPassword;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userAdress;
	private String userGender;
	private String userHousecode;
	private String userDetailAdress;
	
	private CartDAO cart;
	
	public CartDAO getCart() {
		if(cart == null)
			cart = new CartDAO();
		return cart;
	}
	
	public User() {
		super();
	}
	
	public User(String userID, String userPassword, String userName) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "User [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName
				+  ", cart=" + cart + "]";	}

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAdress() {
		return userAdress;
	}
	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserHousecode() {
		return userHousecode;
	}
	public void setUserHousecode(String userHousecode) {
		this.userHousecode = userHousecode;
	}
	public String getUserDetailAdress() {
		return userDetailAdress;
	}
	public void setUserDetailAdress(String userDetailAdress) {
		this.userDetailAdress = userDetailAdress;
	}
	
	

}
