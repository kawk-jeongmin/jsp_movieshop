package product;

import java.sql.*;
import java.util.*;

import cart.Cart;



public class ProductDAO {
	
	private PreparedStatement pstmt;
    private Connection con;
    private ResultSet rs;
    
    //데이터 베이스의 커넥션툴을 사용하도록 설정하는 메소드
	public ProductDAO() {
		try {
			 String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
	            String dbID = "root";
	            String dbPassword = "Kjm0408^^";
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection(dbURL, dbID, dbPassword);     
		}catch (Exception e) {
			e.printStackTrace();
		}

    }
	 
	 public int register(Product product) {
		 String SQL = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, ?)";
		 try {
			 pstmt = con.prepareStatement(SQL);
			 pstmt.setString(1,product.getNo());
			 pstmt.setString(2,product.getName());
			 pstmt.setString(3,product.getCategory());
			 pstmt.setString(4,product.getPrice());
			 pstmt.setString(5,product.getCompany());
			 pstmt.setString(6,product.getImg());
			 pstmt.setString(7,product.getInfo());
			 return pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1;
	 }
	 
	}
