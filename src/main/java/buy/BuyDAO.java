package buy;

import java.sql.*;

import user.User;

public class BuyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
    private ResultSet rs;
	
	public BuyDAO() {
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
		
		public int buyInfo(Buy buy) {
			String SQL = "INSERT INTO buy VALUES (?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, buy.getUserID());
				pstmt.setString(2, buy.getUserName());
				pstmt.setString(3, buy.getUserPhone());
				pstmt.setString(4, buy.getUserAdress());
				pstmt.setString(5, buy.getUserHousecode());
				pstmt.setString(6, buy.getUserDetailAdress());
				return pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}

}
