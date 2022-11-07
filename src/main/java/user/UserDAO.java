package user;

import java.sql.*;
import java.util.*;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
    private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디 없음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPhone());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserAdress());
			pstmt.setString(7, user.getUserGender());
			pstmt.setString(8, user.getUserHousecode());
			pstmt.setString(9, user.getUserDetailAdress());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public User findUserById (String userID) throws SQLException{
		User user = null;
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "select userName from user where userID = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next())
				user = new User(userID,null,rs.getString(1));
		}finally {
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
		}
		return user;
	}
	
	public ArrayList<String> getAddressKind() throws SQLException{
		ArrayList<String> list=new ArrayList<String>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select distinct(userAdress) from user";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
				list.add(rs.getString(1));
		}finally {
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
		}
		return list;
	}
	
	public int getMemberTotalCount() throws SQLException {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			String sql="select count(*) from user";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				count=rs.getInt(1);
		}finally {
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
		}
		return count;
	}


}
