package cart;

import java.sql.*;
import java.util.*;


public class CartDAO {
	
	private Connection conn;
    
    public CartDAO() {
		try {
			 String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
	         String dbID = "root";
	         String dbPassword = "Kjm0408^^";
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
			}
		}
    
    
}
