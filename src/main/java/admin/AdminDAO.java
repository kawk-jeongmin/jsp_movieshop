package admin;

import java.sql.*;

import user.User;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement pstmt;
    private ResultSet rs;
    
    public AdminDAO() {
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
    
    public int adminlogin(String adminID, String adminPW) {
		String SQL = "SELECT adminPW FROM admin WHERE adminID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, adminID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(adminPW)) {
					return 1; //로그인 성공
				}else {
				}
					return 0; //비밀번호 불일치
			}
			
			return -1; //아이디 없음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
    
}
