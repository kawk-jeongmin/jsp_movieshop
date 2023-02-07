package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	 private Connection conn;            // DB에 접근하는 객체
	    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
	    
	    public BbsDAO(){ 
	        try {
	            String dbURL = "jdbc:mysql://localhost:3306/SHOP";
	            String dbID = "root";
	            String dbPassword = "Kjm0408^^";
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public String getDate() {
	    	String sql = "select now()";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
	    		if(rs.next()) {
	    			return rs.getString(1);
	    		}
	    		}catch(Exception e) {
	    			e.printStackTrace();
	    		}
	    	return "";
	    }
	    //게시물이 쓰여진 날짜 가져옴
	    
	    public int getNext() {
	    	String sql = "select bbsID from bbs order by bbsID desc";
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
	    		if(rs.next()) {
	    			return rs.getInt(1) + 1;
	    		}
	    		return 1;
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return -1;
	    }
	    // 마지막에 쓰인 게시물 가져옴
	    
	    public int write(String bbsTitle, String userID, String bbsContent) {
	        String SQL = "INSERT INTO bbs VALUES (?,?,?,?,?,?)";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext());
	            pstmt.setString(2, bbsTitle);
	            pstmt.setString(3, getDate());
	            pstmt.setString(4, bbsContent);
	            pstmt.setInt(5, 1);
	            pstmt.setString(6, userID);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	    
	    public ArrayList<Bbs> getList(int pageNumber){
	    	String sql = "select * from bbs where bbsID < ? And bbsAvailable = 1 order by bbsID desc limit 10";
	    	ArrayList<Bbs> list = new ArrayList<Bbs>();
	    	try {
	    		PreparedStatement pstmt = conn.prepareStatement(sql);
	    		pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
	    		rs = pstmt.executeQuery();
	    		while(rs.next()) {
	    			Bbs bbs = new Bbs();
	                bbs.setBbsID(rs.getInt(1));
	                bbs.setBbsTitle(rs.getString(2));
	                bbs.setBbsDate(rs.getString(3));
	                bbs.setBbsContent(rs.getString(4));
	                bbs.setBbsAvailable(rs.getInt(5));
	                bbs.setUserID(rs.getString(6));
	                list.add(bbs);
	    		}
	    		}catch (Exception e) {
	                e.printStackTrace();
	    	}
	    		return list;
	    }
	    
	    public boolean nextPage(int pageNumber) {
	        String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1"; 
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	            rs = pstmt.executeQuery();
	            if (rs.next())
	            {
	                return true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false; 
	    }
	    
	    public Bbs getBbs(int bbsID) {
	    	String SQL = "SELECT * FROM BBS WHERE bbsID = ?"; 
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, bbsID);
	            rs = pstmt.executeQuery();
	            if (rs.next())
	            {
	                    Bbs bbs = new Bbs();
		                bbs.setBbsID(rs.getInt(1));
		                bbs.setBbsTitle(rs.getString(2));
		                bbs.setBbsDate(rs.getString(3));
		                bbs.setBbsContent(rs.getString(4));
		                bbs.setBbsAvailable(rs.getInt(5));
		                bbs.setUserID(rs.getString(6));
	                return bbs;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null; 
	    }
	    
	    public int update(int bbsID, String bbsTitle, String bbsContent) {
	    	String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, bbsTitle);
	            pstmt.setString(2, bbsContent);
	            pstmt.setInt(3, bbsID);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	    
	    public int delete(int bbsID) {
	    	String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, bbsID);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	    

}
