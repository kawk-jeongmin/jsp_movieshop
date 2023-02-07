package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bbs.Bbs;

public class ReplyDAO {
	private Connection conn;            // DB에 접근하는 객체
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    public ReplyDAO(){ 
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
    
    public int reply(String replyContent, int bbsID) {
        String SQL = "INSERT INTO reply VALUES (?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, replyContent);
            pstmt.setString(2, getDate());
            pstmt.setInt(3, bbsID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public List<Reply> getReply(int bbsID) {
    	List<Reply> replyInfoList = new ArrayList<>();
    	String sql = "select * from reply where bbsID=?";
    	try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bbsID);
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                    Reply replyList = new Reply();
                    replyList.setReplyContent(rs.getString("replyContent"));
                    replyList.setReplyDate(rs.getString("replyDate"));
                    replyList.setBbsID(rs.getInt("bbsID"));
                    replyInfoList.add(replyList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return replyInfoList; 
    }

}
